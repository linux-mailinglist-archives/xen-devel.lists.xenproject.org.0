Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FEE6D41B4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 12:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517364.802586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHFc-00007J-MX; Mon, 03 Apr 2023 10:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517364.802586; Mon, 03 Apr 2023 10:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHFc-0008VM-Hz; Mon, 03 Apr 2023 10:17:24 +0000
Received: by outflank-mailman (input) for mailman id 517364;
 Mon, 03 Apr 2023 10:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGRT=72=citrix.com=prvs=45084431a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjHFb-0008VE-87
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 10:17:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b724bc29-d208-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 12:17:21 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 06:17:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6995.namprd03.prod.outlook.com (2603:10b6:510:12f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Mon, 3 Apr
 2023 10:16:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 10:16:58 +0000
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
X-Inumbo-ID: b724bc29-d208-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680517041;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NJHBp8nY60BOtf1vDWBU2/LaHN57DMrJQ7Fa47wamQ4=;
  b=UtQwbGWnepMshyZ77M6JfhLfkudJsZjsEgsHMH7iR7/1eoGJU0d++Hxj
   Nf2+deF40423cFeO1Wu9Kp3iyIVWN2E0kChdxu3kYJE17NunaFObVGTxF
   U23wbuigrVrkhELg5Ny+JzviuT5BWw1PnyqTpkaPi4PYA9TmG9j/udB/Y
   8=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 103470109
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cUGwyqif1xAN3cxzictcwVL4X161TBEKZh0ujC45NGQN5FlHY01je
 htvUWuHO6yCYTHyLt0iOY+yph8CvcTUydJkQAo6/i4yQSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXDzIHSxaA3Nuuwb2pYdQ22McJDs/0adZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1YLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXjqqEy2QXCroAVIDA2aH+DrKiXsECzcMJ+B
 nAZpwg1v4FnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQI/
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iE3JR9M6SKqt1IStSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodt7xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:rh5QuqFqAHsk1/C1pLqF9ZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6Km90dq7MBThHPlOkPQs1NaZLXPbUQ6TQL2KgrGSoAEIdxeOk9K1kJ
 0QCJSWa+eAc2SS7/yb3ODQKb9Jrri6GeKT9J/jJh9WPH5XgspbnmNE42igYytLrUV9dPgE/M
 323Ls6m9PsQwVeUiz9bUN1LdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjo6h+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWShGOwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NreTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJEzxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wA93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYWjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7sywleF/NHwgF9/suoqSQ4tbHNf7W2Gy4OR4TevKb0rYi6paxYY
 f1BHpUa8WTWVcGV7w5mTEWYKMiWkX2YPdly+rTZGj+0v4jCreawNAzI8yjbYbFIHIDZl7VJE
 clcXzaGPhgh3rbL0MQxiKhFE/QRg==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="103470109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5Lur6ZyE0aACszxuCNOIXsT6RRjPrhVIVvHgKHoclm829RtHI3+Z08iFsyahZyOj94qB8coR7J2EpOinJ1lH5oQjU7fjhSCXSQFSxDc2ocJQ9oyYxe4dd2pfu4TNzIukXujds3StmkSRdesZLz+OgVi135RhxNVbTFmy7RD+oHrWw8mLXEzlYE0ZmRin/lGB18CZM0ZpMBzz/St4s7LHkGa/LwQuiziBYUNjdXnHkZLpJ+6T7VaRO/lFd3Wu+zqRWlE2tQomO67p3cNj1Zme+pezHp84ndoFnpJ8xr9F7tXS5aF3m66DgfkcwS5RuaMgyPnLfJBD/nxKA1ZVJJOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybvD7N7hjF7U5elqg+fiOU6qIf03CIqjL/+AdVJOIWg=;
 b=FHmsqiINj7FQ0uXpccFF+uvDRGkotWDy7t/fdePZohheXwfB36Hd9EcLpKpnk5xY7Tg+Ayhw+pBlHwhyDr6YpG63NndpT4AKxBnmmCpn7GcVBnQPpKEVl1PaC3l7UpQIMm+8BGZgx8BSpWY/Q4WuZyaS26EMiqcOBCzqPXip3phO+ZabtbakotFkRMlLaCDuILA5givxfElzSsTdlkiglhnAVbU8u48UdV3p+oA9OM652Jqx6lUu7fSO8Z2jehVY9KK6AaqSfIbeYIJb0ozRtaTosuFvn2QxB7izQ0PF+MTSt1oldMhVXuzKLEP91egSBk819q9uftcvoYWSDpFQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybvD7N7hjF7U5elqg+fiOU6qIf03CIqjL/+AdVJOIWg=;
 b=PbQekA4iIB5zDkXUwEgJNxL7SXYXtPu3RoNSrMHuiaCZFfkZSP3otWvKZmsyx6WaNW4TI3AU5shbVG5VN1HygYEP/ZAU2aptahVC4/KYN3TYV4/oCoDFj2I8UmFofOzwasMB0DlzUBEWtzuGsFrj4twf42IBl0xLCmJsKZvLTSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
Date: Mon, 3 Apr 2023 11:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
 <ZCqVEHe1Qo3skeVf@Air-de-Roger>
In-Reply-To: <ZCqVEHe1Qo3skeVf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4db509-371d-41e7-d5c5-08db342c8eb9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GstqtAe623VcD3PaR5SL1OsCm35wA/8D/WdrH/9lAOdpOctcedUXTPUe31HVANhrkveJAQYZjIChO0hxxqAKNNst8fdkzTjiWyQNw+xDqesm3VAQOdbU2WwprdnAOMMU+hmTnF62n3iLbw5qOUxp1j6leRqoRW8RE43/NZFjqyTEn1DmoqGmk/IjjMyQR2Z3jbesgkK0ZseDj6IneLBDD3kgyUbo8P/IYVc0xavu7UUYlh4+u8oIvtoZKDIHWXbByra5T+L6j6ITPm/CMYQhxRNtp6BjahRHDyd6cNBycw8gMlou6ijEqWczu6Gjtq/UgY2alcHki504VMUwPiB9umwW69ec120QpLnR1S8oU/smP8hsmqYDx4ZRMLCBId28nbFcP99BW4XbKlmwSLxd7Pt4LuTbC8fTvz/nwkSzPuGgFD2VV2VdOs7bisUA9X3guFrbmNTY2wrc5xL9MpPaBQ69oLo9S99Yo0qGV0cR5R0dshbqN+5nulPC+uSwPM2Usx3IUxeuzy1X6hiKxdsV/elpy9j9cOobEoUO6tpCCTjmSCaxqk2i5sEW3Fu2pVKo/Ub89Cp+1a0IyONYcqrcA6DIa5LDcVUuvcGXH/3oTUTtO/cTyx3ZsyWMzY5T3SH6boWYbLAGyQvB3WoGBDlsxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(30864003)(2906002)(6512007)(6506007)(26005)(38100700002)(53546011)(31696002)(86362001)(83380400001)(36756003)(2616005)(82960400001)(186003)(6666004)(41300700001)(6862004)(6486002)(8936002)(8676002)(31686004)(6636002)(54906003)(4326008)(66556008)(66476007)(66946007)(478600001)(316002)(37006003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlpSUXlZbFJMRmJ0RWRQQ0g2OUZlUjd0U09mSlcrZHBHcldiYVNqdzZoQU9C?=
 =?utf-8?B?MVR6WXNaVjZMaE9nT2FjU051d09DT2gxRHhteEw2dHRqMEprdklEb1QreE90?=
 =?utf-8?B?ejZvY0Jub0pDWE52Q013OWZHSzBDRGFqaUFCSkNGUzQwQklYRFY5NWtKRkp2?=
 =?utf-8?B?RTg4MENDU0ZzbWJpd2trbFlWQ3B4MGZtVk5zOEEzb1dLU1dOZW56aFZRQUNN?=
 =?utf-8?B?SGliL1BvVitLZXFtQWpXNHdPWEcyUXV3RGlROTVnMjQ5Z1AvaEJlWFpkSTRV?=
 =?utf-8?B?NVRrS2Q3L3dWbFRNdFRiSm82VWJFeFdVS2tobXNsejBISldBWVc2VUEzSHNz?=
 =?utf-8?B?b3drREE0ZEM5aXdwU1lQeWZsQ1B6MzNMVFUrdlJqNG9wMzNQQTdMMkFadUYy?=
 =?utf-8?B?MUJuUjQxU2FQdm81Mlhnekx1dEdXaDEwaHE1SjljTEtZM2U0OHBJUEZIR0Qw?=
 =?utf-8?B?SVJZVkZXS0dQQnZBSjNYUWJTdzcrV084Z1ZFcWRtWFJDUS91bkIwMm5FS3li?=
 =?utf-8?B?VGI1MUJ6TksxVEhZZnpBT3ZLYmZxVFZWMVNZRWNRdjdnNVVwMmQzK1FiemdY?=
 =?utf-8?B?QTB6WjZBYVhacXdmd0FwbzZudTRvNmN1VXA3dlBNalp3ZzRsT2o2eFRsQ2JS?=
 =?utf-8?B?dVl3NWpML2J6Qng4TVN4MWsyM2NObWV4cjkzTTlUblRlZGpocFhBSHZUS3NI?=
 =?utf-8?B?UG52TmVQd0d5RndPVzFMU2JlbFVOSm51QVRzOWljc2dmR0lZWWhMZW1CTW5Q?=
 =?utf-8?B?M0RIUDZ1M2k0ZU53NjkrMUhIdTlqV3F3Sit6cmIxQUxiOUpsc0thN2g1TUNE?=
 =?utf-8?B?UUczSjRsejVCSEw2V3lDcFN3dytibUN2akU2V0U2RTBkZmFlVDhBVnBpQ3hG?=
 =?utf-8?B?cmZpb3FpV2pvbXdnaS9BcHhiY1dVVDFzQlExc0NLYytKVmZyekh3OVZjUFV2?=
 =?utf-8?B?ZEIvNGJOcWFiT2NqQmRoSjRNajAyU1llNUFHSy9pSjhzU3pjaWxCaHFiZGJu?=
 =?utf-8?B?QWk3SkU4R2MzUjZqdnp0WHlDcC9lOW1DV1I0MUVZYURJeGdKbHduZ05HSGVZ?=
 =?utf-8?B?a1hjd3JXWmJiUTNVcHRzUUJGWGJQSkswK2VEZERpUEJiOVVIaWdnaGdjbDlw?=
 =?utf-8?B?M3QyQ1lBamJSN2R3UDhqNWFXSU84R1RmS0JjMDYzcWVpYm5PTXhBWnQxaXRB?=
 =?utf-8?B?aEVqb29zWXdiaEJTak55L3VENFhDRzFhMWJLcWZJU0JHY3pCSWx5bDJvclVC?=
 =?utf-8?B?djBoQmNIeGpyOCtRNEliWndRQloxYklaSUdPaEVqNFRwMDEwVGE4MXp5Yzlt?=
 =?utf-8?B?RU91QzlVOVNvQm5xcFhEaUpBOGJzSHJyUk11dkFDa2RkQ3RjS1diZjRlSGp4?=
 =?utf-8?B?QlJ1d1hxTFc0NzZpTi82WTJobDdhWjl1RTlPM09rWVZiQmF0STJUQWpnSkZR?=
 =?utf-8?B?bEdGckRLS0Y5Y3NFQTQrVHdCeG1YZHA2VG9BbWxObjUwL0N1VE1VS3RYTkVw?=
 =?utf-8?B?SlpDNE8xYjY3UVhxSnFvYTZmMUJZQTA0cnE2QWlsekxyVjRNazVSTVpESTdn?=
 =?utf-8?B?TkliSEx6YzBkZnZ6a0o0WTR6NHgyenJPZzJlSkhkck9xUHNHOWRmcUI2SVJF?=
 =?utf-8?B?OGNxSUM3QXVDbU1NTGVDYTViL2FZSzdFM3FERDhhSkpyQzRka09oZkxkVkRk?=
 =?utf-8?B?MURNTVJ0MG5LNVFGM1ZBK2R3c2twRkt6REVOSHBsbGRZc3pyanJ0eEcweWJa?=
 =?utf-8?B?K1MrcmNhVlpGQW9RSHkzMVRBcUpWcWZyY3dNZjNaNkFjV0RkUVYzVUt1ZWxM?=
 =?utf-8?B?Ui9qMWlBb085VEhFZFAvNXFtWmJqNnE1RmRWckd0TzZ1SFdoT0podTRsSTRl?=
 =?utf-8?B?Nk5TcXV3bFdRaDNDaWh3T1lqK2V0VTRmd29DMkFyTytCTm5pR1ROdGRpZjdT?=
 =?utf-8?B?UWNUZ2hQWkNiSEh3ZHlEZmZEdlZzcW5YaGM2VnRkdDJYcU1LZG9MblFoaEMv?=
 =?utf-8?B?S215MUF0bU1lR3pkV1Z5QmlXeU9VbklEcWJ3M09HZHJuUVpoNnQvN3h3elZx?=
 =?utf-8?B?VXh5V0tzS3IrM3F0K2xSQ21LcWZRVTRNRmtzSm5JWFhWaWpXb216cjNPcjhG?=
 =?utf-8?B?NVYvTy9QVDVaZTJLOHZWK2tSRDc5NjFrTDJ0V1hNa29KV0hhdzYra2JRQ0FU?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6xQ7WrnMkvZOy0HC6j5Ux70YVQIxeMJbsq5NhhW83077hZINysldrrU6ShmesiyzVhuCGVfa5PXwVZNLaGA3ZAyXFR6oI5y8sa4knGyw+rwBi9945Xk+W7/Wselats0HyidgQGUGdL4gOrSRv10f+ZXkTW3nsg4fTuXcbyoS+QsYMYM7OPC5kVXkhMrTOt7Tg/5KoxlNF+N6O1z+Tz8BotPkIKJmlzgM1xObRRM4SiGfl6Xe4SmTJYg6bd0yG/25QziJcEJ8uM7Ip7Rgd2fSQNHTRVJU/JXunAVjSsvbh+yA22+f4gtM8iJrdYQqjJJndvr+1onzNNAdYItyBQM1Zav/UZQwXWt9swcNA2ratA0b6G5P22HWpWaqa6dTOToUWG7WUIR7c0BMQ4+l1z95FyV1KM+dtmfB7YzBGcIM8upE+japTBGic/KeM8G70ctzQ4p+R9zT32l/0LHTmtjgLw66mT2NAAbsFUfi4cNQcUcD5pG1X/+bYXHFUYJOW1ZnOtXZMdkGAzPl+YZJCcqIrwa9gPHZFdsWPTP1YB+MWVImmANSAUgB+XKJvRc7CtOQNS7RKmzZ4gWUPq8rbGRixR4l/fNOQfmSqbkSBYVoUFgNk+QWWNbGKHnKCev42BuKTFoEe3kmnUF0sNwsDwvQyVvaKTRZvRRzNBOkwWxXaVaJgIJHfTuXjItX+/falFDIkwxVetkPSZv9zTZ3s4os+AS1keIc+XbTxXXdu/Xo45DLh6Ci4M6V1u8SB4mpP0hCQ8uWGq00b6qGK67Q9amxl11plvC2bekRD1tVbsMc5VfGkgH4fEdQEgMpHCJ+Ljou
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4db509-371d-41e7-d5c5-08db342c8eb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 10:16:58.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTeM3/YP8WHkeszVLhnoJvM2RvVl+J4FsxU6TaD+Yjxt2mk4zKKJ2irrGFKNYZlATTveczY0ExWP2HzyTUjBF3NfZX8sFZNdvrCRvtaZJzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6995

On 03/04/2023 9:57 am, Roger Pau Monné wrote:
> On Fri, Mar 31, 2023 at 06:57:19PM +0100, Andrew Cooper wrote:
>> This started by noticing the dubious Fam17h check in
>> arch_ioreq_server_get_type_addr(), and then realising that checking the host
>> CF8_EXT setting is utterly bogus for the guest <-> qemu emulation path.
>>
>> What should be consulted here is the guest's MSR_AMD64_NB_CFG setting, but a)
>> there isn't one, and b) the vestigial remnants of the cross-vendor migration
>> logic cause MSR_AMD64_NB_CFG to be unconditionally read-as-zero, making the
>> CF8_EXT path unused by any suitably-written OS in the first place.
>>
>> MSR_AMD64_NB_CFG really has been removed on Fam17h (it's now just a read-zero,
>> write-discard stub), and the ECS extension is unconditionally active, meaning
>> it is not correct for Xen to ignore the ExtRegNo field on newer AMD CPUs.
>>
>> It turns out that Xen did even have this behaviour in 4.5 and earlier, with
>> this problematic CF8_EXT checking being added in 4.6.  Therefore, revert back
>> to Xen's older behaviour - it is objectively less wrong than the current
>> logic.
>>
>> While fixing this, get rid of hvm_pci_decode_addr() - it is more complicated
>> to follow (and to call) than using the CF8* macros in the calling context.
>> Rename CF8_ADDR() to CF8_REG() to better describe what it does, and write a
>> comment explaining all about CF8/CFC accesses.
>>
>> There's one rare case when CF8_EXT is visible to guests, and that is for a
>> pinned hwdom.  Right now, we permit such a dom0 to modify the CF8_EXT bit, but
>> this seems like a very unwise idea.  Leave a TODO for people to consider.
> One weirdness I've noticed is that for vPCI we decode the accesses
> taking the extended CF8 bit after this change, but then if the access
> is relayed to the hardware using vpci_{read,write}_hw it will be
> forwarded to the hardware using pci_conf_{read,write}<size> which
> doesn't have support for CF8_EXT.  So if the underlying hardware
> doesn't have MMCFG support and the reg is > 255 it will be dropped.

It is important to stress that this change does not influence whether
the guest issues ECS accesses or not.  All it does is change Xen's
handling of such accesses.

Previously vPCI blindly ignored ECS accesses, so the vPCI layer
effectively truncated them to BCS accesses.

Now, from your analysis, when MMCFG isn't active, Xen's PCI layer will
effectively terminate ECS accesses with default behaviour, even on
systems where IO ECS is available.

So we've changed one valid behaviour for a different valid behaviour.


(Quick tangent...  Our PCI handling is currently very dumb. 
pci_mmcfg_read() returns its value by pointer but the callers never
check.  Swapping it to return by value would improve code gen quite a
lot.  Also, when MMCFG is active we still pass BCS accesses to IO ports.)

So I think we do want to improve Xen's general behaviour too, but this
difference here doesn't concern me.

>
>> Fixes: e0fbf3bf9871 ("x86/AMD: correct certain Fam17 checks")
>> Fixes: 2d67a7a4d37a ("x86: synchronize PCI config space access decoding")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> Whoever reviewed those two patches originally was clearly a fool...
>> ---
>>  xen/arch/x86/hvm/io.c             | 24 ++++++------------------
>>  xen/arch/x86/hvm/ioreq.c          | 19 ++-----------------
>>  xen/arch/x86/include/asm/hvm/io.h |  4 ----
>>  xen/arch/x86/include/asm/pci.h    | 26 ++++++++++++++++++++++++--
>>  xen/arch/x86/pv/emul-priv-op.c    | 19 ++++++-------------
>>  5 files changed, 38 insertions(+), 54 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
>> index 5ae209d3b6b3..b0d3c236e985 100644
>> --- a/xen/arch/x86/hvm/io.c
>> +++ b/xen/arch/x86/hvm/io.c
>> @@ -248,20 +248,6 @@ void register_g2m_portio_handler(struct domain *d)
>>      handler->ops = &g2m_portio_ops;
>>  }
>>  
>> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
>> -                                 pci_sbdf_t *sbdf)
>> -{
>> -    ASSERT(CF8_ENABLED(cf8));
>> -
>> -    sbdf->bdf = CF8_BDF(cf8);
>> -    sbdf->seg = 0;
>> -    /*
>> -     * NB: the lower 2 bits of the register address are fetched from the
>> -     * offset into the 0xcfc register when reading/writing to it.
>> -     */
>> -    return CF8_ADDR_LO(cf8) | (addr & 3);
>> -}
>> -
>>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
>>  static bool cf_check vpci_portio_accept(
>>      const struct hvm_io_handler *handler, const ioreq_t *p)
>> @@ -275,7 +261,7 @@ static int cf_check vpci_portio_read(
>>  {
>>      const struct domain *d = current->domain;
>>      unsigned int reg;
>> -    pci_sbdf_t sbdf;
>> +    pci_sbdf_t sbdf = {};
>>      uint32_t cf8;
>>  
>>      *data = ~(uint64_t)0;
>> @@ -292,7 +278,8 @@ static int cf_check vpci_portio_read(
>>      if ( !CF8_ENABLED(cf8) )
>>          return X86EMUL_UNHANDLEABLE;
>>  
>> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>> +    sbdf.bdf = CF8_BDF(cf8);
>> +    reg = CF8_REG(cf8) | (addr & 3);
>>  
>>      if ( !vpci_access_allowed(reg, size) )
>>          return X86EMUL_OKAY;
>> @@ -308,7 +295,7 @@ static int cf_check vpci_portio_write(
>>  {
>>      struct domain *d = current->domain;
>>      unsigned int reg;
>> -    pci_sbdf_t sbdf;
>> +    pci_sbdf_t sbdf = {};
>>      uint32_t cf8;
>>  
>>      if ( addr == 0xcf8 )
>> @@ -323,7 +310,8 @@ static int cf_check vpci_portio_write(
>>      if ( !CF8_ENABLED(cf8) )
>>          return X86EMUL_UNHANDLEABLE;
>>  
>> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>> +    sbdf.bdf = CF8_BDF(cf8);
>> +    reg = CF8_REG(cf8) | (addr & 3);
>>  
>>      if ( !vpci_access_allowed(reg, size) )
>>          return X86EMUL_OKAY;
>> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
>> index 0bdcca1e1a5f..325a9d118e52 100644
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -285,27 +285,12 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
>>           (p->addr & ~3) == 0xcfc &&
>>           CF8_ENABLED(cf8) )
>>      {
>> -        unsigned int x86_fam, reg;
>> -        pci_sbdf_t sbdf;
>> -
>> -        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
>> +        pci_sbdf_t sbdf = { .bdf = CF8_BDF(cf8) };
>> +        unsigned int reg = CF8_REG(cf8) | (p->addr & 3);
>>  
>>          /* PCI config data cycle */
>>          *type = XEN_DMOP_IO_RANGE_PCI;
>>          *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
>> -        /* AMD extended configuration space access? */
>> -        if ( CF8_ADDR_HI(cf8) &&
>> -             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
>> -             (x86_fam = get_cpu_family(
>> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
>> -             x86_fam < 0x17 )
>> -        {
>> -            uint64_t msr_val;
>> -
>> -            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
>> -                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
>> -                *addr |= CF8_ADDR_HI(cf8);
>> -        }
>>      }
>>      else
>>      {
>> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
>> index 54e0161b492c..3f3fb6403ccb 100644
>> --- a/xen/arch/x86/include/asm/hvm/io.h
>> +++ b/xen/arch/x86/include/asm/hvm/io.h
>> @@ -144,10 +144,6 @@ void stdvga_deinit(struct domain *d);
>>  
>>  extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
>>  
>> -/* Decode a PCI port IO access into a bus/slot/func/reg. */
>> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
>> -                                 pci_sbdf_t *sbdf);
>> -
>>  /*
>>   * HVM port IO handler that performs forwarding of guest IO ports into machine
>>   * IO ports.
>> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
>> index f4a58c8acf13..3b814f4ebacf 100644
>> --- a/xen/arch/x86/include/asm/pci.h
>> +++ b/xen/arch/x86/include/asm/pci.h
>> @@ -3,10 +3,32 @@
>>  
>>  #include <xen/mm.h>
>>  
>> +/*
>> + * PCI config space accesses with CF8/CFC:
>> + *
>> + * 1) Write {Enable | BDF | Reg} to CF8 to set an address
>> + * 2) Read or write CF{C..F} to access the register
>> + *
>> + * For sub-dword register accesses, the bottom two register address bits come
>> + * from the CF{C..F} address, not from CF8.
>> + *
>> + * AMD have extention to this protocol to access PCIe Extend Config Space by
>> + * storing the 4 extra register address bits in the penultimate nibble of CF8.
>> + * This extention:
>> + *  - Is unconditionally active on Fam17h and later
>> + *  - Has model specific enablement on Fam10h thru Fam16h
>> + *  - Has reserved behaviour in all other cases, including other vendors
>> + *
>> + * For simplicity and because we are permitted to, given "reserved", Xen
>> + * always treats ECS as active when emulating guest PCI config space accesses.
>> + */
>>  #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
>> -#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
>> -#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>> +#define CF8_REG(cf8)                                    \
>> +    ({                                                  \
>> +        unsigned int _c = cf8;                          \
>> +        ((_c & 0x0f000000) >> 16) | (_c & 0xfc);        \
>> +    })
> What happens on Intel when the bit is set, is it just ignored?

"the bit" => the ECS nibble, or the CF8_EXT bit?

The ECS nibble is ignored on Intel AFAICT, while the CF8_EXT bit is in a
very AMD-only MSR, so won't exist on Intel.

> We only allow such accesses for dom0 anyway.

And guests running on AMD hardware where CF8_EXT is active on the
northbridge of the core we are instantaneously scheduled on.

>>  
>>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>>                          || id == 0x01268086 || id == 0x01028086 \
>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
>> index 5da00e24e4ff..008367195c78 100644
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
>>          if ( ro_map && test_bit(machine_bdf, ro_map) )
>>              return false;
>>      }
>> -    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
>> -    /* AMD extended configuration space access? */
>> -    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
>> -         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
>> -         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
>> -    {
>> -        uint64_t msr_val;
>> -
>> -        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
>> -            return false;
>> -        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
>> -            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
>> -    }
>> +    start |= CF8_REG(currd->arch.pci_cf8);
>>  
>>      return !write ?
>>             xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
>> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
>>          if ( !is_hwdom_pinned_vcpu(curr) )
>>              return X86EMUL_OKAY;
>>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
>> +             /*
>> +              * TODO: this is broken.  What happens when dom0 is pinned but
>> +              * can't see the full system?  CF8_EXT probably ought to be a
>> +              * Xen-owned setting, and made symmetric across the system.
>> +              */
> I would assume CF8_EXT would be symmetric across the system, specially
> given that it seems to be phased out and only used in older AMD
> families that where all symmetric?

The CF8_EXT bit has been phased out.  The IO ECS functionality still exists.

But yes, the more I think about letting dom0 play with this, the more I
think it is a fundamentally broken idea...  I bet it was from the very
early AMD Fam10h days where dom0 knew how to turn it on, and Xen was
trying to pretend it didn't have to touch any PCI devices.

~Andrew

