Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E37E1B4C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 08:37:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627776.978624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzu9u-0007pR-NN; Mon, 06 Nov 2023 07:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627776.978624; Mon, 06 Nov 2023 07:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzu9u-0007mV-KJ; Mon, 06 Nov 2023 07:36:30 +0000
Received: by outflank-mailman (input) for mailman id 627776;
 Mon, 06 Nov 2023 07:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qzu9s-0007mP-HS
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 07:36:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31b19e99-7c77-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 08:36:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Mon, 6 Nov
 2023 07:36:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 07:36:24 +0000
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
X-Inumbo-ID: 31b19e99-7c77-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+kGoyey9nY9X5Gijoz8IE+LQ3IUmSUmSb5aTZ56VSqDF8dC8+s9DdZGlsYKJ+uVmzGGH+KQ8wkQ7LlLkcqOdG0eALA0kUyisIJlSDzPWjZF8CdLdDnjGyski/p0twZaUuO7bfBGJD5kwLVopkFxoYebRDlDkyYVdDkp4XWKssjqCf8cR5TsiDoyN7OngKXIr5qDjzHqPRlE6FVlrSLktb9XaiXofqsMfaGQS+vsxJY2/siXhZOBxVNBNdphDCPRLRy7OCvBBthUFPVO+MCDAFJ/D8IdsG+Oc3mgFt+cTHCz4Uvupn5XoO53fpeSANO8bvMx6uHiQSEpm3KZY4sGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ReeFiBuHSMKwxCCL5+pdqeU2nqnFYLyt5jmD8RkNTQ=;
 b=Qf58OScDacVe8gOAxNYvwnR81SQuhKl7Wi9cFGKsZgs7AYTKzEp3FI54AjzkYWSw5oqyLN6hDy7QfIxHlldcuHApMupMpoiBQbqzD1pxWONnqKzvrylHMd++96E9gtgLwabR4lDXYSqeo1k3HwRxxC2iz4jHyz/sf+pZOxD5mAjya0VXLh0BIRI/oQI5Mho03WttaV9t9Akb0yINSZqhvhhM+bFw4NA+sv7zmoQ4unE6BQHenGN+BN538qex1Wzud11+EnGREkAtEGQ971NeVGAaM/FS1t6YQW1IsE0z9F45vk1OTP6rGyFGzdItIB5E+oqdonNyW6Ig+qgpHDzKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ReeFiBuHSMKwxCCL5+pdqeU2nqnFYLyt5jmD8RkNTQ=;
 b=1aIHRFBeE06vly4dh3hpWaogQlHFHnzyrociPEobu85r1JRtwk8MhUt84YPy/bGVIUzMZPLzI9D0zCZrJZG05Ch1lgRURI2tuejgMAK2tk7c3et3lljtEqfa3G37jKdi7gZhZQeLNd6kFyhok+A0FbsgNnPI/HcS+Ioz+XBT9kkMH7aMv5AtTUM6DdhoNaMIUqNey3yh3FWUtEAZBoTyb/1vZ9QlBOdltrCzPBr7nZA4JuqTF/XKqw1SHNL8J26GFWm0gi1s6BJml1uijD9XgH3TUbQPfMN3tMp2nFwMKK1NDjmf1ateCKu5HRqT9PzeRagQnY3ONAa4FTdt90z9jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f755d70e-3851-4891-148c-5f83fb33f9f1@suse.com>
Date: Mon, 6 Nov 2023 08:36:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: New Defects reported by Coverity Scan for XenProject
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6547674e54da3_1c3af2c62521719a8359bc@prd-scan-dashboard-0.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6547674e54da3_1c3af2c62521719a8359bc@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6bc6df-ef88-4b91-36c2-08dbde9b1478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A0Z5laGV2eTINybcQU06ZxbmfMpeTRF5AaA5NlzUY+PphQe8kLGxqPG9Mv3p5o9oNfCvtTWtgcRC3VUjAgs/+krGWRkSozwOCGj46tZK8Iu8B+uto7PiQcN9WgOJT33uQyC2Gl7FAXRY4qH2QFYoqPTLVGRngID2e0hhj6CdMpvx4NsyYuk4OeS6OyImjNPBWosU7NUmAUx7GL9s1c70T9BSO165Hl1++g9Y0kX+5iSdUlnq/iW8BZHB8Lk64e9oZjEytCjTt9+OxDEhBxWPSRQOqm2GzxObicJ8raSULM9nTEn6N2b4wgG3KsHGx/0CSzKzjVOM1cagAjMAbfekQRy05huYLPPojukPMZhyfUwSpa4Js+bpKlUKCyzhnm/ramHeBx36XdkPx+yT5xNxWf8C/+9F8MnLVVMO4jQEZo81/w1Khz2JUyhRduNyimskG0DZE/d0kTH6AFlx/VXtLuJpkFGIvlGtWfoe9PSwEWiFftKJjp7nizptJOmYbK4aGsxWylQj3T8PDMY4gX7YUiLQtfypVjUQaYv5BqVoBE82FVYyXcmycuv1HzlyUJWtyEdytJXulpvAwQYS+oRuOk4T2b1i3kvZ0UEKrlyhcBYVoG4aeCa18OysxLBGKQieVhB3wq9gDCsm2T0QAmS5DA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(31686004)(26005)(6512007)(53546011)(2616005)(38100700002)(83380400001)(31696002)(86362001)(36756003)(6486002)(41300700001)(6916009)(66556008)(5660300002)(478600001)(66476007)(316002)(8676002)(966005)(8936002)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBNelppeUhBSTkrOXdXR29jazBrS2lzQ2xlL1BpS0RrNGluOGdoR0xaWGEy?=
 =?utf-8?B?YnNhMExocjMyckc2Q3hXWjBRL2tyd3VoY01pazZtLzYzT2xpU1E0WktQNW9k?=
 =?utf-8?B?K2lveUk5NmFxSXZUVlY5U0cwMllGQjRVc2lOSVZQejJ0VzRTM3pwZFh3dDBP?=
 =?utf-8?B?TzFMQnVDdm8rM3FKSFExb0xFVUZ0NkloVWI5cWJRaHhZanZPSVdzam5rQlFF?=
 =?utf-8?B?ZFZXd1U3TzdGZVVyNjNjY1pHVVplQmc3ZUd0SjFTMTN2T3RnSXlsaHBVeVJs?=
 =?utf-8?B?bm13QWlhaFVpSEtUb3p1bVBrbzVCNENCLy91bUJHaDNidE9EOGZhRTBXQU9J?=
 =?utf-8?B?RENkR3hNQ3dwUkNFc3h1RmNPK3dOSzBIaTMxQjUxdjJjTVl3NTRZNXZ4Nmxy?=
 =?utf-8?B?d3NOaWdRbXhTOHV5SVNPclIvcVRGcFI3OGVhZitnVElYR1FTNkVtSUZCYnhC?=
 =?utf-8?B?Zzc2bDZSR1UweEdQUEg3SlJWT3pYeDkxWm8rWUZmVVRzcGhaNGJPNmZoTHda?=
 =?utf-8?B?Qy9UM2Z4YkR5cGdrU0xBeDlocmpVTnU3MEI2UkZicUVseVpQVDYyNGNEb0Rv?=
 =?utf-8?B?UGFGQjliY2hZcmZ3djVjVkRkM1NIaU1GNFhIV0llOG93MURYNkVvUkVhWUUz?=
 =?utf-8?B?cXF0NzIwNlppcGFIWHVCK0h6VWs0UFJRdGVGK2Q3czBpTFZ0YU5Rd0hybW9Z?=
 =?utf-8?B?UUdKRFNUV0RWTzhnYlRyWSs4R0F2QVFldUF2eGVCdmlSaTNrUkxtN0pmZURB?=
 =?utf-8?B?b3dXRFREbWpxZnphWTJrWFVHak91VDRZZDJmSkd6bmFwYWYzYnNVTDN4Zzkz?=
 =?utf-8?B?cTFnM2p3MkRZKzRLZ3VSdDhpK0tMeEVld0tZUFVNekNBeUJPeEZjaXJwRk9O?=
 =?utf-8?B?VHVYSjVDeGo0Z1U4WGVJY2FMR3pwWmVEdU9GeWQ2bDJ3UURITDNtL3pPT0tv?=
 =?utf-8?B?azdtQ0tBNTNWVGtPM1ZOdDhyNWpacEFqNUF0SmZPTVE4TnlzOUdzZi9EcjEv?=
 =?utf-8?B?dkJadkRVbkU1VzFwdE01TnhKUmFWdzIxd0QxUmgrY0QxVTNiSmhOckQ4cTVT?=
 =?utf-8?B?aFIyNmFFNkpGVldNTDd3VDArREVDdXUrMmxqelowRzhZbGJxNkVraUlJVncr?=
 =?utf-8?B?cklwOExYTVlPZWpaUUFwVnQwRVdtaG04Y1dTL3BmaVhES2pnaDJ6VTl3Mzgr?=
 =?utf-8?B?STNWYjBQVFZrYmFwZ3R2WlJ2VFZUanFQSnc5RTM5NHB2cS96WXdHeTFvU0F1?=
 =?utf-8?B?dEt5QXB0ZVhvRjYxVitwWUlGRTFlUW5yOE5CZEFTYlJVd3FlaVVGbnAzclJL?=
 =?utf-8?B?ZFlDZXNiOUVLL3hqdkNiUSt1dmlrZW1MbDNpMERkT1A4N3lFYkk3bk5ON1pM?=
 =?utf-8?B?NkVnOWxiYnh5SDkvTU03RENTUm1xTzBCclJRSTlteHdKTGlGVXBEVkNqa09j?=
 =?utf-8?B?d25PbEVPMTFaT3FCbHN0SmYrcXJ2UjZRd2FrWmJ4SjJRVDZtSnhJWGpzVkdT?=
 =?utf-8?B?dFYweXY0V0M2YWJDRHF4NUpnVWhZUmM3alRzUmNkYmd5bTNBcnRnM2ZpV3pn?=
 =?utf-8?B?YTE5cFRmc0ZpLy9WbnFPMmpSQVRLSXF2L2I0cjBMYUNNZm9iRkNiUTlKOFVJ?=
 =?utf-8?B?aE1ldHRUaitzcWthY29BSmdDMnZ3VlFUK3QzS0RkQ3VudEt1bXRMdGlBcDVh?=
 =?utf-8?B?N3VzeXdNcEZzTndzYUtuNkg3ZW5oOHVvTnZoSnBDeUZhbENEMGZMaFJBNGI0?=
 =?utf-8?B?MkpDZlBaNS91UDNCdXhsSCthcnF6bk92TTFWSS9FMkhxMUx6THk2QjlHUG13?=
 =?utf-8?B?Z3pNaDdNUFpHNEVzODFTQ3JMM1JOSktKYkZXTVdreE5Ed3J5bjFjS0l0Z292?=
 =?utf-8?B?ZXZTQUFINk91aGxwTUU1UENwWUgzNEttTFNuOW85VWRwTHAzeC82RzkxSUFt?=
 =?utf-8?B?RVJPZE9ablJFWGw0ZzU5TWdod3d1eWdKZUZGTGtJSysrWTJDNjkwM0NrNlhT?=
 =?utf-8?B?L1p4VC9HZ2NMb0d4UWNDSitPbVlENVZudXJDbG1lSE9yMWJKTThaUjdFY2Ra?=
 =?utf-8?B?dUVKOURFSGovaDVhazYzM2VZZ0F6SDJGQU50VithZ2tHeW9OeHkxQTU1elpF?=
 =?utf-8?Q?fMZCIG7RHl+R1SCSCT6IzyT8a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6bc6df-ef88-4b91-36c2-08dbde9b1478
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 07:36:24.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ivmRESAq5W/kIaHtQvjv1sUzQtWBGJD5zz2MLeLcqVNeYWkZ0h9e/vyEa3/fQfPulLRTF9bytYskQzANt17jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

On 05.11.2023 10:58, scan-admin@coverity.com wrote:
> Hi,
> 
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
> 1 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
> 
> 
> ** CID 1548622:  Null pointer dereferences  (NULL_RETURNS)
> /tools/firmware/xen-dir/xen-root/xen/arch/x86/cpu/mcheck/mcaction.c: 96 in mc_memerr_dhandler()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1548622:  Null pointer dereferences  (NULL_RETURNS)
> /tools/firmware/xen-dir/xen-root/xen/arch/x86/cpu/mcheck/mcaction.c: 96 in mc_memerr_dhandler()
> 90                     d = rcu_lock_domain_by_id(bank->mc_domid);
> 91                     ASSERT(d);

No matter that this code can certainly do with hardening, how can - with
this ASSERT() - ...

> 92                     gfn = get_gpfn_from_mfn((bank->mc_addr) >> PAGE_SHIFT);
> 93     
> 94                     if ( unmmap_broken_page(d, mfn, gfn) )
> 95                     {
>>>>     CID 1548622:  Null pointer dereferences  (NULL_RETURNS)
>>>>     Dereferencing "d", which is known to be "NULL".
> 96                         printk("Unmap broken memory %"PRI_mfn" for DOM%d failed\n",
> 97                                mfn_x(mfn), d->domain_id);

... Coverity "know" that d is going to be NULL here? Best I can infer is
that in a release build d _may_ end up being NULL.

Jan

> 98                         goto vmce_failed;
> 99                     }
> 100     
> 101                     mc_vcpuid = global->mc_vcpuid;
> 
> 
> ________________________________________________________________________________________________________
> To view the defects in Coverity Scan visit, https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yrkTUyUdtq5BaG0O6OgOkaWpauWH6sxLlz8YmsOhJ7zG6w078-2FaiuRz-2FB00i-2BJg44c-3DkX6u_NrtkCdDF-2FTaaXLm1QcFPOFnojIs14Wzrh5dJFBeSVj1z0ksrlVQuW7Zy-2FqT57QjqzVjiJF2PJIK07-2BSEjUth5ouhE2qFNhId4LvekHJXd6ELiP0-2B8XnhP1gdLp7TRFFOvUeT6Lddf1YNNmN9XrN3-2BNawzLRRIl7-2FdJPswV5cGaWoBREWQjGxEUac95xJecxLgQNoDwwrxYdn9zW95rrbSw-3D-3D
> 
>   To manage Coverity Scan email notifications for "jbeulich@suse.com", click https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yped04pjJnmXOsUBtKYNIXxbOS2X-2FCa8eHT5AKto97sa5BC-2BcmyJ5bO5I-2FkczMtlG1epQQquNnD30oPjt4w9gsO1RjVU3f-2FwTsFle9tjKmWG5Kz60AmOhqmk5R1j-2BvLczY-3DAAhv_NrtkCdDF-2FTaaXLm1QcFPOFnojIs14Wzrh5dJFBeSVj1z0ksrlVQuW7Zy-2FqT57Qjqz6yaPk3udV-2B3LoxYpnR2IqMFgeYigqqRYw7WrjuBUd8j1KxekL3U98J70arECI-2BGRvwoXYzOJyfYbO5RKuSCm6Sa6RhyBu6G5o3KPByDgONSFcrLmsCWs9Tu18suJjyZJI0LMS3WFM-2BGpXs6QChyjA-3D-3D
> 


