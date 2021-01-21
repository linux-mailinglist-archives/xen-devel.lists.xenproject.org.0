Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775502FF825
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 23:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72483.130543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2iiE-0005zU-B8; Thu, 21 Jan 2021 22:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72483.130543; Thu, 21 Jan 2021 22:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2iiE-0005z4-7P; Thu, 21 Jan 2021 22:45:58 +0000
Received: by outflank-mailman (input) for mailman id 72483;
 Thu, 21 Jan 2021 22:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+dB=GY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2iiC-0005xO-Fw
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 22:45:56 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89bfe5a2-8e0f-486e-b804-3e26e81d986d;
 Thu, 21 Jan 2021 22:45:54 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LMTqYS047122;
 Thu, 21 Jan 2021 22:45:51 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrhpv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 22:45:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LMUr0j009634;
 Thu, 21 Jan 2021 22:43:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3668qywbxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 22:43:49 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4569.namprd10.prod.outlook.com (2603:10b6:806:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 21 Jan
 2021 22:43:47 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 22:43:47 +0000
Received: from [10.74.98.115] (138.3.200.51) by
 CH0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:610:b1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.10 via Frontend Transport; Thu, 21 Jan 2021 22:43:45 +0000
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
X-Inumbo-ID: 89bfe5a2-8e0f-486e-b804-3e26e81d986d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=P/FVKvprEjfnopWgq4JDhlFyf8ThSFEyUZQA4NT5Lvw=;
 b=xAkiGcrW/0RddWoVv1lDpe1YVc395MYfciOeK2OjgRxudnFM1/OzH5xXaEPyKipXUUcV
 EuV4AaMJf4A7ed+lP+NcU9WqmUt6rS8p6oKaR0e4Zg1jpsrEuFh2LqKv9kAmWHFYftoT
 3Jgb0PNUoo0/Mjp5EZglJzqzc5y17y0y0FYP1EbUZNjJybvUzPHiW+Cc1/2pkxqw2G4+
 sdYKOLN95rAY+UV69cn9UpQu6Exc+D0lsGiZVKrvCAzFXTvt0xGfeGW5LUKYFg5hJ4YD
 s2alaUmgcT8aqEoetXkSy3Z/xGA3ycEXN4A06vBmuijLw98AVrvQ7EzEJTPPn7SqEGnG IA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY7jxbKr1+nn0Lif27fUUHiLaxuhus+/YymUJg7NwqOTXE39xVjcAZx3pzhOknCp8mA2mVaduY8aeTBmxQFLBtsijyFfD4OP7UloVFIQyfqFXNNB9IZliHZ4tYEjY/xaH3QDK9Cg92b0n6zbDsKcoQTL5TgPNq+ew1uBuu590Xa/32c0pbrusYsPfETipzemJwC+eX4YpxSa9UUkKEburkvfuGsuxLggdd/JwvDjYZiEXwInScbWqBApigEdK0whEhc2D28JmfJb5R7WpZ0fgq1qTvN0Rnhry1bOP3d9eJ6vgP+XIY0txkxY5vCzqG1g70LTBopPe8X4eDtjmFgOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/FVKvprEjfnopWgq4JDhlFyf8ThSFEyUZQA4NT5Lvw=;
 b=BuBvMPZeKO8xEwr0wcmS16p8XKnCNVkNc3AF9lVGORUhgZdFyMYbPHLnKYlVpW32LOUT3lz835VqVOy+9NPZddWSfH0nZ9FRFiurfehQQsuxxbebayWgczbqWu5s9PTGTHIGlxx9qaFIxhl6eov4cLYMnj9/coPZAP8Pw8vDSVIr1qPELAPr/roNDWviJHCGnptcGSUnMtd6JBsM4Ep9iV5uFvWXX8zwRQeLdB5MYEjGui8jyatL3E8cxn34HUdMQNvqlsV0uZrL5i6+0bag3MLicxrnJN6lqiq0GvkIKFdKubX4jBAoH1ixYG6ASGTGby83woR7tuEv4WFBEjehHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/FVKvprEjfnopWgq4JDhlFyf8ThSFEyUZQA4NT5Lvw=;
 b=b4G84tq+9cVST4NLcmLRl9Ck78tABmNyVouJ0Veo3P5fW0vWz39YaZLCQ9IkEZthjariQfAzjyn2+wuCeKev2cNSYA5+uAzfyA1WGryp49hUM6CoPjJAmM+vFFFRSNMnAthC4tTJAggW6BuVxuf77Lc7iE91KxaC1HK0Sro2Mbo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org,
        anthony.perard@citrix.com, jbeulich@suse.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <20210121145643.5ogz3worwt3gabdc@liuwe-devbox-debian-v2>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <2126c661-32ac-ae0c-fef9-0cff75d47b7e@oracle.com>
Date: Thu, 21 Jan 2021 17:43:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <20210121145643.5ogz3worwt3gabdc@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [138.3.200.51]
X-ClientProxiedBy: CH0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:610:b1::12) To SA2PR10MB4572.namprd10.prod.outlook.com
 (2603:10b6:806:f9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b20da9-1991-4a91-0cdc-08d8be5e03f2
X-MS-TrafficTypeDiagnostic: SA2PR10MB4569:
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB4569E75A49C7018B24E1DFDE8AA19@SA2PR10MB4569.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gBQh+E7FzA0m+zP8wEMrw9mfbPc8sIVwHik8PM/q4q2y5ce3TkMP2QtygUPO9LHUzslowub5bl6NH/rvDsO0hXdAE9NvD3zpGIRyKaZCSst5XB/33vwHSRU6iZSQBwBSaeDniUnEfHSgz37qZD4/8wi3yBeTn5nb63yGViRYPKKt7wLz7zvYy+x1mjUAhsdwJpFr55+u5fcgec3tyFw7JOGpRm//25SundMGjH+jeM4/VFlc98ToFYVIUIFH+bvtIV0F070UkXt+ggvq1MjCwWU9QBX3FYZM9TLYbBxN7dMRWqjvR9jKuGQkMr8VRXsKjSZhtD7dPpqIa7GSxahgRePV80qU3qdGx+mhGFCC01UD1e4HUBd1P/5EYIeLhaxtMtAc3lzKqmyhDm88uguHEvf2ihdtBhw4qxxUCh7Jks1G+ZlKi/FlKgxTkzLbcbsjxkjLMZqk9WO+KaA5zYOQWAlG8BOZUJwoKArJCpYrKc59f1S/bJAewVCXSomNUCz/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(6666004)(6486002)(316002)(956004)(2616005)(478600001)(66556008)(4326008)(44832011)(66476007)(36756003)(5660300002)(86362001)(66946007)(16576012)(2906002)(6916009)(26005)(53546011)(8676002)(16526019)(186003)(8936002)(31696002)(83380400001)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cXcyMTZsZTBUMUVRZVNkZUxSU3ZidjlzVG45RDFUcHY0UEZvQ2I1c1MzaW1h?=
 =?utf-8?B?VUtTTmpqdThvLys1VnVKakdCa2ZRajNldXcxNzFWY0poSFZEVXRFK2VFTEZV?=
 =?utf-8?B?SUppZTRKdG1YMHhoN3hkeDZGNnpCOHE5WVJxN3BMWTJIaE5NUTZ4dFAwRHo3?=
 =?utf-8?B?SGNFNXNrRTRCYzMwNGszY2xrUG05djcxeVl0a3lLS3p4UHhjbHIzVlp2ZUY2?=
 =?utf-8?B?ZTV4cWp1WEkyN3pNNndQaUN4OVBOMWxqMGhHRzdkZDFKdGtla3B2Qjh1WnhI?=
 =?utf-8?B?SE93OW5xQlFFV3JGWkZtcytoUncvTkM0TlBVcExrenJtNmU0YWpkcytkSzlT?=
 =?utf-8?B?OHlhTE9GWVhZZW1UM3cvT1hFdVBTTm5XdzA3bEp4ZW5CbUl6R1hTKzI4WUQr?=
 =?utf-8?B?b1dickpqZXgxNFV3NGNURERNYWZtUUVpTW5yUk5kbnJ6MjY0eExaOWdkTVBG?=
 =?utf-8?B?QVV2OXh0OUNxUmRMNm5mZm1YbE51ZVVQMDdvck1WenRyaWU5ckd6bjBXSDR2?=
 =?utf-8?B?THowemZ5ckhzMkVPM3VmQ21CTVFTVXlkeFRuRUdJSGdmK1k3Skl1QU1oMkhi?=
 =?utf-8?B?Tlk2WGlWbThhMGFBQmEwRkI2QVQyODJaSnZBNzhrczJ2a3lpOXdPcFNFbzFv?=
 =?utf-8?B?TE1qSWxUeGszMEhxaHhaS1B1NWc2eElnR0Z3MnFYa0NRZVd4ckJtYk41TE1r?=
 =?utf-8?B?dExCTEJyNDcwSEkya1hZRlVCRHZjODZmVmdXWHJqekJTMlpWNGZpV1dVQm9w?=
 =?utf-8?B?UHIxMWgvZUlqTEpraTB2ZEdSMEhWTVNLY2dNUVlNZE5EbnhtdTBwdisxZDRy?=
 =?utf-8?B?RHMyZTZLaGZjbHZ0S1l0YVZXWlI2RXJmS0E0T3hVZjZVUUgreGNzd2llWEJC?=
 =?utf-8?B?NDNRbHF2UVdvT21aTkM4UFZhdmswcjhoOFZMdkhFeXREaENDTVNTUFJCVDVY?=
 =?utf-8?B?bmtFb09aQ2ltUHJDaW1PUHpYOSs1RUVOOThWbDN6T2dCL0hveGMwMEhVQkRo?=
 =?utf-8?B?RElnMllEbCswYWpHVU1BL1V0TUQxVWdDaHBRS3ZWOTBidW5NeFRJODZ4Q0Z2?=
 =?utf-8?B?NXZWcy9LOHlBUzRrdlhOZTdiWkdUdWIvcEw3RFd3TUdCWFVNbnVWQU40ZDdF?=
 =?utf-8?B?c2hEM1BaZThqeS9nUks2bnhkbmViaml0c2RLci9xOXBnZm9GS2lObzlSeWM0?=
 =?utf-8?B?NGgwRjNrRHpZRWs5K1phUUR6ZjFYZGw2RjFuNXF1bUhBUm50REJaejR2akJp?=
 =?utf-8?B?REU1YU5DSjBxdTU0MHBDcWpjN28xN3czLzhyRU5BSHBtUHBtbHVHTmhlWHdI?=
 =?utf-8?B?N09xdEZ1c291am0rMmZ2MXR2S2NvbXhocGExOThqRTUxNGVuZThBbzF4b0dl?=
 =?utf-8?B?SmZEdm9qdFpFNzF2ejh5ZVFaRHFHNVp0b1NnVVdsd2JLYWk2NFB5K2pHZnQw?=
 =?utf-8?Q?ipghkUIM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b20da9-1991-4a91-0cdc-08d8be5e03f2
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 22:43:47.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QptLg++WXFWqvoUHmPI0R4r8UvaaE0EjO2IQAOdbmmBR0gJP6SXXm+cRciPJ07IVbPEDW/zkCWstRWfzADT27KhyXK9HAdZiW3+iU9yx+qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4569
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210115



On 1/21/21 9:56 AM, Wei Liu wrote:
> On Wed, Jan 20, 2021 at 05:49:09PM -0500, Boris Ostrovsky wrote:
>> This option allows guest administrator specify what should happen when
>> guest accesses an MSR which is not explicitly emulated by the hypervisor.
>>
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>>  docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>>  tools/libs/light/libxl_types.idl |  7 +++++++
>>  tools/xl/xl_parse.c              |  7 +++++++
>>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> It is mainly missing a #define LIBXL_HAVE_XXX in libxl.h.
> 
> Other than that, this patch looks good to me. If you end up resending
> this series, please fix that issue.
> 
> If other patches are all reviewed, you can provide some text to be
> merged into this patch.
> 
> Wei.
> 


Ah yes, I forgot about this.



diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3433c950f9aa..f249740daf3f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1310,6 +1310,13 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_CREATEINFO_XEND_SUSPEND_EVTCHN_COMPAT
 
+/*
+ *  LIBXL_HAVE_IGNORE_MSRS indicates that the libxl_ignore_msrs field is
+ *  present in libxl_domain_build_info. This field describes hypervisor
+ *  behavior on guest accesses to unimplemented MSRs.
+ */
+#define LIBXL_HAVE_IGNORE_MSRS 1
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);

