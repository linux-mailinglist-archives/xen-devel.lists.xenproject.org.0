Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9AF4D6353
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289080.490423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSg91-0001E7-Ss; Fri, 11 Mar 2022 14:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289080.490423; Fri, 11 Mar 2022 14:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSg91-0001Bo-PQ; Fri, 11 Mar 2022 14:21:27 +0000
Received: by outflank-mailman (input) for mailman id 289080;
 Fri, 11 Mar 2022 14:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vG69=TW=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nSg8z-0001Ba-Tr
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:21:26 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8775f6ef-a146-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 15:21:24 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BDTDpd029475; 
 Fri, 11 Mar 2022 14:21:19 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2savd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 14:21:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22BEBKml143029;
 Fri, 11 Mar 2022 14:21:18 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by aserp3020.oracle.com with ESMTP id 3ekyp49am7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 14:21:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB5200.namprd10.prod.outlook.com (2603:10b6:5:3a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 14:21:16 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%7]) with mapi id 15.20.5061.023; Fri, 11 Mar 2022
 14:21:16 +0000
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
X-Inumbo-ID: 8775f6ef-a146-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=eOwkiKVKM+CFHzLED+bslnb+pRK6RA8Is8BgbESIvcs=;
 b=UsG0ByX195bflkVlwW+k85dayeWcBlJn8M1cJf6oD6rEjTACeQlo2gqNzQeiDNmf0YdS
 621PDy/fm+RsK+LjCWgpXoe3UagIRd88yFm0RLFyCoOArnidB8vX4AA1Z1h1/lpOBWYS
 yGmNIbU15rCCm5FYzGxU0+a4osjPeixQEdKsuqbrT1RHi80jnuJIpSsqQNajcUPVxQLU
 aMHDcLiEK8JfIiuEBpk7fDjOENI8BpYKhvHKpp+DDEswzO4C1sZPBARCSizsCDUgA98P
 EY+4wwBchKLon21kmFyGX+/IUCsL2uNLU/NuctwJMWGVXJSoua/N0W9Z8RKhAMRSdedh qA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8sfQySo2+k1OWfMTwHqyUU88SV4iWuMzxGzeYKk6KOP7jxPq0gxJh84lGxT7vdfwluwo9qY9/Z3c0qNkOrdLVWrl3PfBgE8ijyxDHBZSPke85owDsjMl9QMYlQU+TSNs1dhIdSgSAB1mcfsfHV1LaeXtLcMbVZ5oWs4M4Q0y9OlBtYDQ+SZqNQFbO29LqXUNrPWq2m5XEFVunWLh6WHbZrd6y+ySgT29DZazuxnf2qes6Lea4BjqXFF1xBgZdwYUK3v9786DX5TLka+2CZzB95wR3qqeqwao6cHYIZU2dbDTlmVX/kqwYEN4Kll/oXBk+D2gn7jxKH7ISoMzBPEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOwkiKVKM+CFHzLED+bslnb+pRK6RA8Is8BgbESIvcs=;
 b=Nrhg7acr/+kp6ld/2QYxMQvGUiSGWmyiIC4ShXIrgQcaCmmOC36msuwCTBGgn5A768giMTzkfibu2s3PEONYd6yWxGGuPqoKGuJfyWSw7HQksIwRPejmzSNogp508htcQDXO3I76wJBlEjstr5YAjYx8Wi4p1tNk/VD/hQpFu37N6RfGkEnM0+bvcxc96dII2ty8g3g4fN6PrNyZFN8WIyTY5Z8CexnyM7A4Xsgk22nq05b8Cuny4t5tzWvo02B6iEKCTsXOg3Ja2pGNm1oBMqREFFBhhEIka0tACOirscXQ+KkBfASZCPgpMrM0RbKp0rhLwVQTXWRzAsFw4ibs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOwkiKVKM+CFHzLED+bslnb+pRK6RA8Is8BgbESIvcs=;
 b=TPW4U0oSsczHEtmOuOc7Yv/AVyZnFbkuqUBiZWEd10Yh4gU9B20aZ62cVYwz1rL8O8Ah2XbiG+3M9WUivRTln2gAd3pVrfpm7xv1VZMYX6yRK6J5BMwFVpjJbdRkHmIjSI15+oc+439vq+H/aNxKWcRF751/3JzzpAWvPqG+TUI=
Message-ID: <bd8054c2-dfe7-7eac-bf76-ccdd95095525@oracle.com>
Date: Fri, 11 Mar 2022 09:21:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH] drivers/xen: use helper macro __ATTR_RW
Content-Language: en-US
To: zhanglianjie <zhanglianjie@uniontech.com>,
        Juergen Gross
 <jgross@suse.com>,
        David Vrabel <david.vrabel@citrix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20220305133823.158961-1-zhanglianjie@uniontech.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220305133823.158961-1-zhanglianjie@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f016c9-88e8-4707-bf29-08da036a678f
X-MS-TrafficTypeDiagnostic: DS7PR10MB5200:EE_
X-Microsoft-Antispam-PRVS: 
	<DS7PR10MB5200C0F8803F40ECA79FBC208A0C9@DS7PR10MB5200.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tQHlWKEv6zuek2avROKSR9uKylPIPjVKfUdqiMhqXkVo1tATHsgBFVjUkct3qllqRl9F/qLgdPf+ErQGjk2VezSLgMDv8ANwjaOgWwjD4CkbN5WuwxAmQQv02qcpvD6HpKT2+YKHug/7pSRqNqfdrNaxnVWixFKJJarGzHqaA7GuTMvpJ5vQ4yqFvkHz9CNen5puyICYzLCWG9cV+E//qfYMFJVvHybGe5nqWiTkBjAe27WHnyH4WhxCMORx/uauKtt9mBjsj8Ct/3WOqxAkdvmHc4FatouYYNLdugS+uCArpkxrOc6Gd93yKZxaLtefRscEOurPL1r4pvFR54LFh3D6cMF9hio7lxOTp/SWtTuWUd04ZMxsh9PxTw1sl7EzRw++86FTqt2cgT+cuDnHUzybXm6O8wg1IJhVy7Zk+ydR/wPWh45nSGCqbKSt4DvlZSW7FhepoICpVLq1UL4mcKlhap7WtS7WiSPijQAYITk+LHVpJzOxwh3KS750VWXsGQCjTxJKfNY/Kf5pyhQL1ouYH71e3yfzGwDgkKiOqc95mc0FPTBWzeKNTvEk4iE4PES+/HtOcP+6Bb7vIJ+HJlYQ11hQaAFE/CpBa5qRu3ghwZqW6RVd2Lzj02aVcTSZ7g+PW7y1oHpW1r/N1FDFkyStAcXX8MJ83JeY41H2ntHiK80ItBcVzBnWGKM+WiPetMrieCVu+DTUomkD78gOQkKcc/GQ1kPrZQ6CcSapE1RB8sCrSOtkOAV9CXhv2t68
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(83380400001)(316002)(2906002)(4326008)(8676002)(6486002)(66556008)(6666004)(5660300002)(31696002)(66946007)(8936002)(53546011)(86362001)(44832011)(66476007)(4744005)(508600001)(2616005)(36756003)(107886003)(186003)(26005)(38100700002)(31686004)(110136005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTlJVHc5QmgrTWJSbk9HTmVQY005WFM4N3I0dlV6M2R4SHdzd1d1ZkRKT04w?=
 =?utf-8?B?UTNDNGFDRHIvUm5URE1ZcTIwbnVDdUx1VFVUa0hNM2F3WlpMUkhWNEt0TDVM?=
 =?utf-8?B?N2tQMDI0RGVBdkNOTEJHUGhSTGNJVVhmYXhxazRmV1g5RWJ4cStIVEFaam1p?=
 =?utf-8?B?dGV3SEtBWlJ2QThKa2VUU2dGbE5iT1BrSTBVdmNGaFJOU3k1M214YTQ1ZUNS?=
 =?utf-8?B?d3BpbjA2REk0TU0xM0pKZnpTSXhrQWFTMVNqa2szWlljVnpwVzl4V2NPOHRW?=
 =?utf-8?B?VVpmcE0rQ3VnL2dMMEZqS2VleU1PQ29BSlFiU0lSWFJlaWJCb3NWMjVzVmNu?=
 =?utf-8?B?QzFpVjlFOWU5YmRkSTMrSFVxK3VxVGlOYkNKU00yWDNqSXU0ZDM4Mi95VHh0?=
 =?utf-8?B?V1ZMM0dhSmV0NUNlWloxVkVqckEvQnNCbEMxYzRCaUpYUEZzbDM1WmtBZGRp?=
 =?utf-8?B?ejBOWXBZTzJLTC9LM0ZMRDlHK004cFg0MTBtZkoxZXI0clZkeEhzV1Z1cGhx?=
 =?utf-8?B?WU9HUlpOeGRpcFVQMzBzdStRNXBmd3duNUI0VFpCNm1GMVBGNEgwek9pVmE2?=
 =?utf-8?B?SHBHZHVnNEtyTEVkZmRKRVFwTjcya1FvcFc4UFZNa1NMQ05SNW9leWg2Z3NB?=
 =?utf-8?B?RFVzUzUxZEdaOUFyZWVVaW44aUFJcUlvMWlMY2RtbjdEelI4OFhWZEhqdGJM?=
 =?utf-8?B?QW1uSXRrVExaUnQyTGNnWHFUSEJPMTNmT1hiZFRpOFdES1lBai9zYVY3eFA1?=
 =?utf-8?B?VFV3VmFTay9sZWtYYnE1dnJNM0hVUWtyb2lXVE1ocnRkRUp4RFhvYWszWXNr?=
 =?utf-8?B?WWlwWDAyQzJMUFNHYUkrQThaV0l3c0tSa1Y4RU9lTGVwVy82VW83aklMVHdG?=
 =?utf-8?B?NGZLblNkREtnY0F0SWhxVy84T0kwUzVvZWJjaWxTM2VLSEZOVktQSnUybDhX?=
 =?utf-8?B?MFRha2VFRnN4NmF4UjBQTU5hZmM2NmE4dG9uTlhkTGo1Z1Z4YkVUWk52VU1T?=
 =?utf-8?B?eDN3SGlhRGdnTVIrd0J3UWxydzIzc2VDWmdKbGV0Z0REZHJnMDVIZUM3WmRG?=
 =?utf-8?B?OTVQUnh1VWpBZFpWQ3QxLzdzMUw5SjdvV29aMDQ3WVRFK1V5NFNZb1Iydm95?=
 =?utf-8?B?VXFDenZhRWx3aFkrcFBkWkthTityMGhaNXl5TnpyQVNFdWt6QzhHcHgvanFT?=
 =?utf-8?B?eFkxemQ2dUdpVkJKM3E4Wmp0TGJOenhDQWZRTE9hRUUyZXppNFM4dDEzbEg2?=
 =?utf-8?B?YTBEWVFNa0M1aG9uV0ZtRGppWTAyNUZzbkp0ZU0vQXB1QjlxMElESFhHK0Rv?=
 =?utf-8?B?WVRzRG5PditNQjlWdnZUYUlvM29KRjdPNStpeUhqMGJ6Qk5kdXkrdEZudUtB?=
 =?utf-8?B?dFBuM3p1aTZQanZVSDFmT09aZjhUR25VNzRUaG9rOFhuQWhqeDZpWHBObHZ3?=
 =?utf-8?B?enMxTEd0YTdFaUdlOTAyOGhxd2lLQVE1cnplNVNHTE5lbEo1ZkVLMUtuamhu?=
 =?utf-8?B?em9KTlliWFBGMDRId2ZacDU3UnNLSHhHS2grcVZETjFiNlcyWi9sdGgvaGJG?=
 =?utf-8?B?OXgxSHJNRjhaQ0VETWVmSUxNQ2JGdFBpSDJYdGI1L0p5S3FSYTVzcnVyU0x2?=
 =?utf-8?B?OS91UGZFQTNENHkwU01oZURUdHRYeG5SbUJKUDdMSXdxeDJtL3BheFpaSzhP?=
 =?utf-8?B?K0UyOVZQUDB2RGZQU3pZU0RzZDUvYWpLamJxY2RUY3VneFNyOSt0Z2VHUFFh?=
 =?utf-8?B?ZjZyUXFFdTROdDZqTGFadEVPVUd5bVFtKzNuazNORm9BN3RrNS9iRmJyN3g2?=
 =?utf-8?B?L0lKRXlwOWQ1dmZnMXJ2WVY3ZjJoRTIwbzM2emxjbFEzMWM5Zm5ISXlLYldL?=
 =?utf-8?B?MFJiejROdXNsc2hpNDBiYXdEdzRYbVBvVmEyTWE4dTRPdDY3c1VnMHJCL3BP?=
 =?utf-8?B?ZWdPM09Td0FRaXRlcFFVS1huQU9EZnUvdUpuWmZ6OHdkM3pHdnYwT0NXRVdG?=
 =?utf-8?B?OFZQQjFpdCtRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f016c9-88e8-4707-bf29-08da036a678f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:21:16.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5+RItXTu/+K10tmkX4zUM1VMd+BpfO+PyDUYJMjkGSN1jM0MdRobVH+hIUL/UsbwN9xSSZitw1bvynCmVyEtuGsMnu1IykBtrdTjvHmKdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5200
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10282 signatures=692556
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110070
X-Proofpoint-ORIG-GUID: LJs2khjPCxfIHDVfn-_gIWHP8AFmU7l3
X-Proofpoint-GUID: LJs2khjPCxfIHDVfn-_gIWHP8AFmU7l3


On 3/5/22 8:38 AM, zhanglianjie wrote:
> Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
> Minor readability improvement.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Applied to for-linus-5.18 (with whitespace change noted in commit message)




