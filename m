Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94993360A7B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111144.212508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX20f-0000BV-W9; Thu, 15 Apr 2021 13:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111144.212508; Thu, 15 Apr 2021 13:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX20f-0000B6-T4; Thu, 15 Apr 2021 13:26:17 +0000
Received: by outflank-mailman (input) for mailman id 111144;
 Thu, 15 Apr 2021 13:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX20d-0000B1-RN
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:26:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 026b49f7-2b58-40e3-9583-11df7003d1d7;
 Thu, 15 Apr 2021 13:26:14 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 026b49f7-2b58-40e3-9583-11df7003d1d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618493174;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ICHFW6ezo+kuLVJEG33yvmmTwE37qtEiEk1OdNDqfgU=;
  b=MWvZNUBE48LgNE9t1rz/hikmVw0EOtuP4Ixi3gCUuKPudYeX15je66RC
   MF+sXZVNB7GXwuNntL0v9swLXSpIUYlyTBbUznucnnfXSq1gzNfCEq5BT
   Q8O4JK9MTBK+SwW2822GFBZZSyntmMQMBTSRyRF2jjJyXPbvJhNwwTE9f
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qO2iktrbtbX4Ze2MBoRpbQzfwPLYUuZJOImC6T4AnbzCTQkQzgurixXKYOCM0cbk0qkveB0Zy+
 3VuVBAUfAlMGMMXW+7r9fDIUv0/vX/ZG+nTBuCCuEG+1sWsnF/dREdfz+x2XWAMvfFsph36EbS
 nHp6Vl10xcRxJLf5UCC1NA1nXtqTdMO/Gb+unWpxh+mecKgIZsK0sQDWobhzYBv+FRe+XIFUFa
 xtXWXHLrH3BXRRC0Qxsjqg5p9ioh5nOW/FOsKvrrNc1LpJseWu874J0vQrpWmbPp5N9G1NqLvM
 auQ=
X-SBRS: 5.2
X-MesageID: 42054482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LwTNw6NyUuMnNMBcT3Hw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiDtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCA4qR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+GLzGz2BACXzRThYoz6G
 StqX2D2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW1fRoymyYoAJYczmgBkUp6WV5E8ugJ
 3wpX4bTrhOwlfwWk3wnhf3wQnn118Vmg/f4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OskMTr6kCvw/NTOXR1x/3DE2UYKquIPk2dZFbIXdb45l/1vwGpuDJwCECjmgbpXdt
 VGMce03oczTXqqK1rdvmVp3eW2WGUyEhqsUiE5y7Ko+gkTs3Zjw0QCwssD2l8G6ZImUpFBo9
 /JK6Jyidh1P4MrRJM4IN1Ebdq8C2TLTx6JGGWOIW7/HKVCH37WsZb47Jg8+enCQu1G8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRzw18B3/fFCy/3BbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmBXfyGLxOwxb1V/BpWDgjefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithdXj4Bl
 cFQTjvNORN5k2mQRbD8VrsckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn8xszjE0wGjoUGOG
 9FZJ/3mKKyome7uUzS6X9yBxZbBkFJpJHpU3ZAox42I1r5GIxz/+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQEB8+4NHmZy18evmiDQZtZuqDr37aqRroISrIdHIBhHwTCEBJ43Sxwrn
 1YVQMCTkjDUhX0iauki5QQLPrFd8Z1hTqqJcI8kwOdiWys4eUUAlcLVT+nVsCaxSw0QSBPu1
 F3+6gDxIablS2XMms5iuQgOFhqYGCaaYg2SzitVcFxoPTGaQtwRWCFiXi/hwsocmTnzUkUm1
 fsNDaZY/3NH1pbtE1Jy6qCyiIGSkytO2ZLLlxqu4x0EmrL/kx+1uKGfYKf+WqcYFlq+JBXDB
 j1JR8pZi9+zdG+0xCY3AuYHXI935M0I6j2F7I4aYze3XurNayFnawLBOVv4Z5gLdzi29V7F9
 63SkuwFnfVGukp0wuaqjIZIyFysmAjiu6t9xv/7mS0tURPd8b6ERBDffU8LN6d5WS/GKrN/5
 V9kN4vvey/dk/2ccWLzKnLbzhFbjPfyFTGO90AmNRxh+YVsrA2IrzwFR3v/1tD1A8lLMj1mF
 gFKZ4LqIzpC8tKRYgqZyld/lAVj9yBI0sgjxzuDoYFDCQQpk6eG+nM3qHBprUuCHCQvQfcOV
 GQ9CtG4vfONhHzooIyOuYVIW5MblI752kn1OSed5fIAAHCTZAIwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uyezDj0A7d+Rt9LaQmyRfrfeqCRCaNE/VP6dq0JBClhbar+te6iHPPcgSAAn5ozL
 FtRAg3dcRMij4rkY0x3GyTc8XM0z0YumobxypmmF7r0pWh+0HBEyh9QFTkvqk=
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="42054482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zp/RkU+Qd99NiXMmR5DdB8DEBOJKEYj3BAcIAUD3T2eiKEwcEnpT9MwGCxQ7ZZG8N/vsYs9tN7J+3cUcYDmDmmAKO74mYpg0xVpefIyFzBCzzsadmil1ZJ9Ozf1qlcOFyoUxxGO8l/nQZlBoBJK7n8aMjcxm5NaChHSxDmJ9WRkWawer5q2S3nb/i5NSZpX5Wt/XN5eYIF4v/MSebpwtWsLR7nLRFoSS6PYvhhnN+mLwfBD5ziUeItd7Z4uIbOsJul4mGGrVTbn8EiHM9PlL3fT9HkZjUbxffqsKV02EmR8uQd3I+aUmwxbjPRufonXU96QF5KJvMGchV1t5F1lmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1l51CG56aHNvtKJYuTpSQmSe+EouQr16Sczlo1cgeY=;
 b=VAj3RREV//tpbEc6+/xzmuzwkCckS8JLI58G+7ttJPqyspiAmCF2jO8xa0x486976qPhaeBu9WXa7fUC/W98iPfaPAM8ch1s2ughT1P6lqa9LxZ9S0zO47bZzP20WYrT8cvwsRrGc8y0WqOKYCsSu+DIa1lDEG8dsOMD+p2aWzvi0RNhSjYjYT1oF/jTV4u5ALnUSVRmiru287tk75sa6lypg1WvF/bQy1ONMFBR40h0XshOLFl5yVa25YvWvjKLnfmnlamR7FAnrqrXNqlcjEsYjMgOGT63RFGgLbTJ0jCno/YHYozrKal2+d2tVXBEin7S65s9L2/aUUojeDk5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1l51CG56aHNvtKJYuTpSQmSe+EouQr16Sczlo1cgeY=;
 b=kI19S03OujByLllUwQXtrgVqa9CpovE/92BXtSTbPzz2uLe1NOLJWSLNypLC3m//ZRgZi72DSrXtKcXhul7L7pJiJUT3uHyDfTubTwr+DtuSxMus/1ve2+P01ZL86OpQhFZ8573n8DCjwT6EcaapcjFnVfgorme+0lqg8uAkw8A=
Date: Thu, 15 Apr 2021 15:26:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YHg+6rLN0rBWXcTs@Air-de-Roger>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00852c4b-76bc-47e9-cd7b-08d9001207b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB429776DD52DACD8290C0832F8F4D9@DM6PR03MB4297.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFPdbfh/t8EBpSXdvnYo9PE0uBGp0/cmp5EUQrNmitlcP6upm994RjAw5H7lkJnHeWodrlFQealDZZW2x6L9aDhO5rw/TDrduiP2KuuA90Rk31yVZxeFlwBu2wF4jA/JsfDIQEDlkkfSS2uYwxH0LtptmGKs08+XdMVIh4zt1vnULTcx64Jk8gB+EmnaG31RSf2GzEjijsyj+dGS9HSCfegxkbAAbsM2RO3PWyL/HkP7zbpvcxldkyGhpN1KqekmHk42xZesuc/1xOedw7kwThrXAqOaNbJ1X0yLmDPoSlFLnlR5ucbpdNZXIcZc8Exvr0QTL9mD4cAYvoZnh5glxKhFdjqBeGYrB2NS3lOHsdaQYf4coScQ9q563XpSr87yDRT8sKYPwB4c2FlFVxqgjQR4e2sRf+gjeBoUm38zdF+TiZwcaXi6Su7wRYf677AW0IB4XfRFzai1WQ3nTnrej46u0DeQdhsnTG4xxXDzHy6jnGDB85L/L6hDtw3bj68Hn35K6FezaCzq5Cxj7inOX6TSyG+tjqq2lvyosc+mUp2AQ8YwUmx05MpScU24WvhrBDcKYPopmiEYXQxAHQt84fp8kAs1APttzxRkULkjGgz4Xh7Bn+ZNJiOgMS3jhCkb8WFq+sRvGOCJTgvZpxvZgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(376002)(396003)(39860400002)(346002)(316002)(186003)(5660300002)(66946007)(478600001)(7416002)(54906003)(6916009)(38100700002)(8676002)(83380400001)(4326008)(2906002)(16526019)(956004)(85182001)(33716001)(9686003)(6486002)(8936002)(26005)(86362001)(66556008)(66476007)(6496006)(6666004)(53546011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmRVUEhmY25QY0lsRnZvSktIaGV0YWpKTVZmRXB2czY5L2RkUzBOOFBLYVJJ?=
 =?utf-8?B?aG11UktYMy9aWmdhU1lWK1pSUEI2VEl1NnVUWSt1ZlZIaGdmcTV4ZktVOFA0?=
 =?utf-8?B?d091eGxDOXR3aWZoZFUyT29ZalhjME11YVlvdkxBU0xhWjZSUS9jTGxtNlRl?=
 =?utf-8?B?Q2Q4bHVyRVVRYTVxTmRpSVhUaXhxdnplUStPQURWcnJOUVIxMncwSkJGZU9u?=
 =?utf-8?B?a2VoY2ZTVkl6SjdHMUlkbU9WWkl6dldUZ0ZMcU1sak1DU0psSENORzZsUzFu?=
 =?utf-8?B?T2dDRDNXU1ZsTnZVVWFhdEhoSm5OZ1llMTJtVWFKcmJnS1VXbmhtRmR0ZzhZ?=
 =?utf-8?B?cFdWd0t3eDdTcmNPRWc2YWRHS2hxU24vRTIxSjk5a1ZlaVIyVjhVYWFwSGp6?=
 =?utf-8?B?Y2NUd2xJWUJlV2Z1UlFVczdPOGoyaFNFK1l2UmsrNHVLU3pMSTN3VmIwbzBw?=
 =?utf-8?B?SUlJK1FBN3hldkF6MWV3TUV6NE9PM2wwR3pUcE9FZmowWE5XUUZPQmViT1g3?=
 =?utf-8?B?UlhxNFc5WkRQYnpyWDYzcWcwYjIrWWdwN08zdmlkTjRiS3kwSDREaUVwSEh1?=
 =?utf-8?B?MkhSTFVFMWIvRDkrMklTcTF1d1FFSlErSFFiNnVOSStDbmtDUGRYRVZxM01K?=
 =?utf-8?B?L3RJM1ZPOXAvaTJ5bkJKNkZvTEdQVDFvUjFZOENkN001bWRSQWFoRnZmcmVR?=
 =?utf-8?B?U1ZBUmR3TUJSdWUwYUsxRFhKZTc2Um5pb2hCRVNEOG1CZnNaVmhZYUcydUVs?=
 =?utf-8?B?dUhoRVh0bzNtY3ZITXJVSW1ZdmhVYVVaVFV2djFTMFROb0xQTllSVjVZbjVy?=
 =?utf-8?B?eTU1ZTR2WllyUFVlWVUxK2drZFNJVHFPR05qZDZuQ25LMjJhZ3BtWHZvc0x3?=
 =?utf-8?B?blhxcEpVYlE1NXVPRGQvN2YrdU5yeWhnb3A5SmVQelBoTnI1OU5Ia2Ztbmxv?=
 =?utf-8?B?RkJVYkorK0tXSVJ0L1RQZlVOQmYwMTRtY3lZVlBuNnlqZVRRU3JQa3lpNDJk?=
 =?utf-8?B?RHB0QlMxTUYxWFpFZXNLRzdFY3dZVDkwQnppRzM0L2FrNC9jc3kzY1RpaWZW?=
 =?utf-8?B?ZkRKNXFLblNmREVwdlo4c0dYV2hVNm1NclFaR3ZFNUYwQ1J3ZWUxNDlSQXEv?=
 =?utf-8?B?QjFQWG5SbE5CNWlnOTlZK2JLaGluZkVEMG84SlQrS1JkQ3BVcGxIRmxrTGN2?=
 =?utf-8?B?U0dqczdZNFJpRWxvSksyWHhYWEZQT1QyUzRqWC94cUlGb09DRXFhMHV3eUdX?=
 =?utf-8?B?MXAySDdQbGpwUWx3akpHbGFYeUJIR0RoK0hHbEZwdHRQUldzVitkUDk1R0RW?=
 =?utf-8?B?RTN6NWFKK3paQmdWR3RpSS9TdHJCNHk1OHM0RGI5UG11YUp6bEdHc0UwRlNC?=
 =?utf-8?B?SDh2RVdtMmdseGRmL0lJbWNYaU5ldFNoYm1NL0Y5Tk91T1JHcUxqOGlxRXEr?=
 =?utf-8?B?ZjdJV01Gem5jRWlObmY3dXN1RkQyYjZBNWxoenVJd1ZtaTdvM3J5SWJSUGxu?=
 =?utf-8?B?QW41b2R6ZlkveTBVUXJMcWV3SGxsTkxqYzE0bTIvejhCZkdGTlRqYVg4QzRR?=
 =?utf-8?B?NUttWk90bUV4cEt2cGpwQkdXR3hQWEhkb2hmQTd5bGpaVUJwbStjVEFFN1lQ?=
 =?utf-8?B?QmNUaTc3SjVuUDhWb21wSHFBcDVabjQ1NnFwV0R6cVRlWHJmT3FyK3pBZFh2?=
 =?utf-8?B?akNDclpYQmdkS0NPN1ZVdXBaVlMwaXhMa0h1M3RHT2FtdUM4WmRhYm5EVFg5?=
 =?utf-8?B?WlR6L2RNSmZwNFd5c2c3c0Vrb1FHVUFaRUM0ZWp6T2RtcGE0RURUcWU4MXdM?=
 =?utf-8?B?QXJsVzRSd1pROEorRUdBUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00852c4b-76bc-47e9-cd7b-08d9001207b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:26:09.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYmQcUoDIZjkLDQ3DX+QPQJswGd/cXEeVhr2u/HL3EkYBHJD7gUNVmGUlO73VIt3vKzKnXNADkuSGqLxBuiaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4297
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 09:49:37AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 14/04/2021 09:05, Roger Pau Monné wrote:
> > On Tue, Apr 13, 2021 at 06:12:10PM +0100, Julien Grall wrote:
> > > Hi Roger,
> > > 
> > > On 12/04/2021 11:49, Roger Pau Monné wrote:
> > > > On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
> > > > > diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> > > > > index 705137f8be..1b473502a1 100644
> > > > > --- a/xen/drivers/passthrough/pci.c
> > > > > +++ b/xen/drivers/passthrough/pci.c
> > > > > @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
> > > > >    }
> > > > >    __initcall(setup_dump_pcidevs);
> > > > > +
> > > > > +#ifdef CONFIG_PCI_MSI_INTERCEPT
> > > > >    int iommu_update_ire_from_msi(
> > > > >        struct msi_desc *msi_desc, struct msi_msg *msg)
> > > > >    {
> > > > >        return iommu_intremap
> > > > >               ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> > > > >    }
> > > > > +#endif
> > > > 
> > > > This is not exactly related to MSI intercepts, the IOMMU interrupt
> > > > remapping table will also be used for interrupt entries for devices
> > > > being used by Xen directly, where no intercept is required.
> > > 
> > > On Arm, this is not tie to the IOMMU. Instead, this handled is a separate
> > > MSI controller (such as the ITS).
> > > 
> > > > 
> > > > And then you also want to gate the hook from iommu_ops itself with
> > > > CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.
> > > 
> > > 
> > > All the callers are in the x86 code. So how about moving the function in an
> > > x86 specific file?
> > 
> > Yes, that seems fine. Just place it in asm-x86/iommu.h. I wonder why
> > update_ire_from_msi wasn't moved when the rest of the x86 specific
> > functions where moved there.
> 
> I am guessing it is because the function was protected by CONFIG_HAS_PCI
> rather than CONFIG_X86. So it was deferred until another arch enables
> CONFIG_HAS_PCI (it is easier to know what code should be moved).
> 
> > Was there an aim to use that in other
> > arches?
> 
> In the future we may need to use MSIs in Xen (IIRC some SMMUs only support
> MSI interrupt).

Then I think some of the bits that are moved from
xen/drivers/passthrough/pci.c (alloc_pci_msi, free_pci_msi and
dump_pci_msi) need to be protected by a Kconfig option different than
CONFIG_PCI_MSI_INTERCEPT, as those are not related to MSI interception,
but to MSI handling in general (ie: Xen devices using MSI need
those). The same with the msi_list and msix fields of pci_dev, those
are not only used for MSI interception.

Or at least might be worth mentioning that the functions will be
needed for Xen to be able to use MSI interrupts itself, even if not
for interception purposes.

Thanks, Roger.

