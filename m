Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457C69F30D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499373.770479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmq8-0007QQ-MR; Wed, 22 Feb 2023 10:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499373.770479; Wed, 22 Feb 2023 10:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmq8-0007Nb-Jh; Wed, 22 Feb 2023 10:59:12 +0000
Received: by outflank-mailman (input) for mailman id 499373;
 Wed, 22 Feb 2023 10:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUmq7-0007NB-A8
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:59:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee13628d-b29f-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 11:59:09 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Feb 2023 05:59:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5955.namprd03.prod.outlook.com (2603:10b6:610:e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 10:59:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 10:59:01 +0000
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
X-Inumbo-ID: ee13628d-b29f-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677063549;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fWrwGLXSV94IBKjjRx+qKvN1iL1SNb7Kxwu+Tw0JdaY=;
  b=BC6g8Nlnav4e5xskSu2IxPrAIoyudxTCmzJDOsi90DjKy/ww6dZhB54g
   hjiUIHYDzLYbDKbKVQ9AbVBwJO175Ca4CE4fnWoFZUopkVUxEBVECPUe8
   9txCy445K6m5AZSdY/ZBk/aKPBY3AYdvEKX7DH41ni/jZCfFe2LgTl9St
   g=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 96879014
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dfhymqgMXDlee9uLGptorJUlX161bREKZh0ujC45NGQN5FlHY01je
 htvWDuCP/6Ia2rzfI0jPN+z8UJSu5DWzNdrTwFtrChnFy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQaCiAnTwupqtmt3auBatswi/pyFerkadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RePoqa8y2QH7Kmo7UxEbaHbmvvmAgV+aQJFAN
 mc7oXEQhP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 lqAntesCTkxtrSQECiZ7u3N82L0PjUJJ2gfYyNCVREC/9TovIA0iFTIU8pnF6m2yNbyHFkc3
 gy3kcT3vJ1L5eZj6klx1Qmvb+6EznQRcjMI2w==
IronPort-HdrOrdr: A9a23:r47B8KpuimtsiAJC30AUCKkaV5o6eYIsimQD101hICG9E/b0qy
 nKpp9w6faaskdzZJheo6HjBEDtex3hHP1OjbX5X43DYOCOggLBEGgI1+TfKlPbehEW/9QtsJ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.97,318,1669093200"; 
   d="scan'208";a="96879014"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQcpWvMSSF+8IuuciPAVrlQmixZlz9r4AioMgp9O4hN9NMP+rbvWaZzRr8rHanbPpcprXPTsmRhIuqPKZneV0lor9c/K8uPEDEmvWcSKzOWVbQ+2qzdGbyrSfbdiqENi5Y0L0P7Q6ya9Csg1U93fACcmAexZpr5iXdH600JZRvGNIsNrrSC8jLWsjZPoElsP4rH0yWDv6pe3wmWSrQ479H7snZbsa89vupXq/IIApO4LVbSe6RCaCRmYu1yjjilWhZJW1SRUkebjwF1uMb9QaGOIVr/GjMmSdV14dZIKXzTRV7QXWiO/vj9e8s9hRe2FOm/W5HczxRTvHwFiVCUoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWrwGLXSV94IBKjjRx+qKvN1iL1SNb7Kxwu+Tw0JdaY=;
 b=jb41zyGN/lUdF950x5vFUiny8CSd7drcbuh7rT34QKNYxxuXcJQVVQjGmIf4AKwYdZ2BK58jdjmIqTMti3G8FfnR+H7gv8fY8Q81/7sdiNXnula8DyqVaK/mf7jJTVuKD45aOEmsp8YT2FUe1H2dYrzeyEc69wHS/v3/E4ZaYrD8m9S4Oclv3LLeJLpgo6NilF8fgNrOUnjw4EoiRWJDm+FPBQkiBgUqYUL0TdQkkxV88sI/YVqes9ERbqh3qJYPFcBFTvhXnpuXDw7a0yD6EeVB9uehGL8n/u1evFS4+CFE5yD/csM7a5yXg7Hftq8TnTao/QhJK8qzogwYjzVyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWrwGLXSV94IBKjjRx+qKvN1iL1SNb7Kxwu+Tw0JdaY=;
 b=trNqTFU080sBLdBRZKb06L/e2biOLOwPF45A536y6ws4+U2Ma4JseAc/krKray5/p6wXayG573tt7MPiJZiW1Vl9C1ePKXr2koGlAb5nPvYSBxUw7W3bUcpPcMB9mkTXcbTqWWhcspCyq6ZT1q7Yy80dQDWEN+8k6OLZf41Ex44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d68c5516-28d7-3ef6-d8af-e15069aa3ed8@citrix.com>
Date: Wed, 22 Feb 2023 10:58:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MSI: drop "packed" attribute from message
 data/address structures
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <7c362963-e6c0-f610-3bae-9465dc91a73b@suse.com>
In-Reply-To: <7c362963-e6c0-f610-3bae-9465dc91a73b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 04dcacdf-7f7d-47fc-637c-08db14c3cdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zDvI/Snrx+YFoWGLOlR7E5sL43YopGQ9Ay3uES7OBrCDU3xT7GKEYj4th0zNaw/86VDMnMOinMUQvgmbrNG08J3ZAmZBjO4OEkr3ucsAmNLTdfjD70Wh6qo4TqTo7em9OFi9VTaaAKiwEJSNaqe7zEPK0v4VD9JN828hWWxHf+bHx1u1wIef9fcvYx8SIIxJhdvTuuDA05Om0+8soTe1axSGgKEiuCnNbYWFdex+SMxYY73efRB4nR6GkTe5naIieG9pQgzccersAH6dTzwBKpZfxskGXvC6tgqQWkge/6jePPwEsYcUTV2agjt9vZdx6pD3LyE6+H1eCl9ccz5QK6ALD/ibFcwV8r+llmeK/iYtNbZnpEK3N6p/quR4oqbI+czH/+UPWjx29ZucwtsKLTeHwytZTxTyFb2/30EJz+/lY0i2KXyca1wQtOECDUQuhjQukeM41H8l21sSUuQJzZzPfU/Q7T8QP6y50BSH2709Kbqc2xXC/0B9Dm+5kuqBZVv2kVeLn4xEN3aZOoVX8+JNls/ZrC3A0bOKCvlCdyZCPh1pJDR6qGg9g67glrLaMHOsaibmwFb10ZB91sx+9pdbXqxUxSy/AJLWOAcjpK3M8pBpOEfgcSjlHjsPHWKXEBP5tH0ukBAEnM2/YA5Ny/gNAjy1tM8ODGUoRMcy/+O7fmb2Q3tYREyHHHTDcLyrDM+5Y68Kdpx922/4zXiaEwElnr19J3Lxm5L2xzUrYD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(36756003)(316002)(83380400001)(6486002)(6506007)(4744005)(478600001)(6666004)(53546011)(2616005)(26005)(186003)(41300700001)(6512007)(2906002)(86362001)(8936002)(31696002)(5660300002)(6916009)(66556008)(66476007)(82960400001)(38100700002)(8676002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pLM2FOVllMcm5jYnQweVJOV0kvTGdaemI1WC9WV3c1cjNVRnhNSGRpVTZv?=
 =?utf-8?B?RjBEUWdkeVViVU1TSndYY2pwSHJFUzVIVG9tYVlEaDVxdjJSZVVCckxKMmJt?=
 =?utf-8?B?QXBwUUs5andScEY1N09VTFp3a0dqNStRSnB1cXZPN3dzakZWeFJCMm9NNnEy?=
 =?utf-8?B?cVNRMXRkTW9PZVlXOWtUdnJIWGxLSktteCtkOVJvTmt2LzlOb0hPRW1mS2hG?=
 =?utf-8?B?VE4xcDhHR3lNSXN1ZjFLckNSMzBwTmJIOWRiQ1RYMDNIeUs1RkhzN2tNdHdn?=
 =?utf-8?B?aWI2cm9GdlUrbDlBT0RoY2Z0L3poaXBzSEJabWtBdVdJRVJRTlZYQXpLZUJi?=
 =?utf-8?B?dFF1Q3liNzVrMUpjb2xIY2ZaRFV4UTlaakkreDJNV2I3VVlBUUVzdDFXNWMz?=
 =?utf-8?B?NjJJb2dZZFJCb3N0Q2dwb2NkRWV1NTlEVXVBSDI1a2N1V09NYjVRVmg0a0do?=
 =?utf-8?B?WXREKytDbXIvdjRJUG8xeHkwd2N0SUx1OUZRdkNZaGdQblFZSHlUWUhzcjZF?=
 =?utf-8?B?bTBrR3IrL2tBaWc0RHN0UTkwaUJjcFYxeU4vNUZpS3c4NVpHV1hzTExZV2JE?=
 =?utf-8?B?VGxlSmVhWkRoeG5pNngxRDdwUmhVSEF0OGg5OUxCSlN1MlVTRU1id1dONmR6?=
 =?utf-8?B?NFVqVzBDK1BmTHN6MEpibkErUnI3SE83MEd2QndjMGRtczBCZXJZeHF2RHNp?=
 =?utf-8?B?U3B3Qzg3eGVWN1orSGlSdkhNanNrTnNCZ0dFelhyQzRZTG5BaFZ5OXJvN1l1?=
 =?utf-8?B?b0hjSzg3RzUvY0NpaE01Q0NweU5sZlFmVk5HUzBIUkRjaUkvN0lOZ0I0TEdZ?=
 =?utf-8?B?MWUrb3FiYktOeWdvWE9oSGJWMGx6Rk92Uk9hMWpHUTByRCtmamNuZXliaGVm?=
 =?utf-8?B?RXdlb1hEc202V3BKanR5MlB4WFUvTUZwV3dEYnFEY3dhVCtCcWNRejdnOG1z?=
 =?utf-8?B?YW1UR1RXQUFBOUJ4RE9VaE1XeGN6OGxFSVhTUThzdjlHV0syTGkwdnZGczJP?=
 =?utf-8?B?TXI1dkNrZ1lKTkdiUnJXem9yZmpmYjh0NUc3RW4zNVNta1A5d2p4ZHdSWjhB?=
 =?utf-8?B?M1NOaEN0cHVjOWt1VFE1QVRpaWwyVEdvMnU3K0w1RlNKb1NKYSs5U0MwcFNt?=
 =?utf-8?B?cjVqeTJpa3VJeHExZENoREFzOFdweWV4a1g4MjlIYmtnU1prRksvc3V5M1Fa?=
 =?utf-8?B?S3RjZG1qdkRlZ3NPcVJkZVU3cFYrTTdRcmdmZVN0Tno0ZHNQVDRJLzY5Y2oz?=
 =?utf-8?B?RkJTU0FkWExzdkVLRmVZM053bERLaXN2aTRiQ1kzVm1PT1RhVWY4dnpOTldS?=
 =?utf-8?B?djhyQmxleGtEWXp0eGlwbUhuVm9TMzJYMWlKZjc4VGdKWnpVdS9leDVIdTdv?=
 =?utf-8?B?dEZ6cThueWJSQTNJOGovMXlnUUxLc0IyWk9KbWtGd1VWYVF1UUI1TUVVNjZ4?=
 =?utf-8?B?ZFJlYTV5WDJIOUFqbi9jTkEyMzhjSkVwdmJKeWQrd1JsdThRdTJxTjZDTjRp?=
 =?utf-8?B?VFBmUUh5QkVjcUh5bi9OaGhDWHlYMkVuNmc5NlpCaHNBM1l4SEoxYkE5Szgr?=
 =?utf-8?B?T2oxSmdVYWQxbVhyNVRpaktzbi84RE1WQVQrYjJzaWdSVWM3MVZ2bHhBSUdn?=
 =?utf-8?B?eU5MaGQ4VUZCUk1BTEgvaHkvSm0yWFBuOWpWVEJNa0l1R2RUdFV5c1Roekox?=
 =?utf-8?B?MDNNUHVMaTJ5b2g2UjVjUDIxQXBSR1Z4b0E2bllSaHRYN0N3SiticGM4RzJI?=
 =?utf-8?B?bTc4cktqZUZHV3VmV21tMTdZNDF5ZDRtVnZFOFFwNnBoMFFXRmk4UEl6Y0Jq?=
 =?utf-8?B?b2lYdHM2dFFUa3IrbkwvSmZ5VFU0QWQ4c3pSUnlHZkJzb2VJQ3FMNkh6UXl1?=
 =?utf-8?B?cmxsZVJXQytwaDFkQ1dsNkIyc0lnK0xsY0E1YnpydlZmTXZtZzl6REhaUkIw?=
 =?utf-8?B?S0NTT2xUemFmNkQwNm16UjVLMU9IVmdQRXpaOEV2Y09mRUEwTDZZYzZqbTZJ?=
 =?utf-8?B?am5SOGNUQ1B4VlN5MmxIZk5wbXhUaWZjOHJ4RUg1aGhsbzVDSDlVZU01VW5k?=
 =?utf-8?B?TDA3NDZOeG1DZWdzaURTb1pkV3V0L0krRkMyYVJaNUl6aitxR2I0RmhuUDZn?=
 =?utf-8?B?L0ozNWM2azc2YjNKS0g0M3BTNC9BSTBGN1NDSHhzeWQrcTlGVmsvZ3UvaDQx?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zwF1DLsGXO+VdXsGLj1CahHDtVYzLpeXsl94LKecnOmUyIDX+PcFIEbaVAsRv2KIKec0qRLVdPFma/Rpu9f4nMmSWU1zH3Ry74XLMx9yZv+Atz/4JeujFlumk2c2BEbEym1fR8YrTKmcYo+SWrq8wqttAYPEeP3yZ93OuY+Pd5z45SLqNePB/4nyds8jOjhRIiPUBk4msxxwxe28LydVmVf60kjheHPtdHBV8ccuo8boTd016ouHdp2IruM73lvnSjhkf2Zkdn9X3L++2xYo6WOfOpelhgPhXKa3GOvTjhHSzskuzIeHlNuC6ncuOJDRsez66pT4fRI+sE1Ychd6w1dgkpjsCCqBE5adIc5bplaDdoU1wg6SJ/ZSQ0XZjkxF9WnAkkNOFcMbVdCSAQCr5nB5V/4d73AH8VGGQA1Z0rCj5uNZUBCs8ziHSXkq5QgX/xXkK8ms8PA6scsvo/muZ3BCE9wew5xYyOuAgRZyfJqLkSMzpa3zvRF4t5ovygISFWNxY7A2QCC4mjlvfoDBLN5skGPt35IJOCA2Ehuj1lLdDYDMyahAiN6cEqAWDAnuuwc+0DVZUODRLPIr3yObRowzi67ia1RGF/JVu3g9bMhEKJScVlQBnHIDZyXc1R+DrXw7SCp7QWoFsfl9RCyrdcsh0HxGvX12QeZU4DXAPXW2WOacWFlf5JYlPPIviAaFsJlMkDvAYN/IHyL02nXQlKg4bWz2AVqnpWwHl13eNGFymQJjFKBlpSQp+2sHo1Fo0luxEXvkVt2y53+m23PyEQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04dcacdf-7f7d-47fc-637c-08db14c3cdfa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:59:01.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XC5nTZsHJ1XH8kvuJ64PLjuOpZwGZWdNytobSYj8Ml7ZMpqDjyWtJ1bv0pz3xrXOJgCDs7k3PCc6Jg8llQvZB2IsQe/VIIvNBXB9/SnDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5955

On 22/02/2023 10:35 am, Jan Beulich wrote:
> The attribute has no purpose here and, in the worst case, could lead to
> the compiler generating worse code. In practice, however: No change to
> generated code (surprisingly not even to generated debug info), at least
> with gcc12 and the .config-s I've tried.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

