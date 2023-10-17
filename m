Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D007CBBC6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618069.961318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdyH-0001Cb-UA; Tue, 17 Oct 2023 06:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618069.961318; Tue, 17 Oct 2023 06:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdyH-00019V-Qw; Tue, 17 Oct 2023 06:54:29 +0000
Received: by outflank-mailman (input) for mailman id 618069;
 Tue, 17 Oct 2023 06:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdyF-00019P-Pg
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:54:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026bd03c-6cba-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 08:54:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 06:54:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:54:23 +0000
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
X-Inumbo-ID: 026bd03c-6cba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwDODiU/gRJFWk6G6Eygs8wTAW7jNDNJ5GC7HI6iHxmujCoqV0rUpNebUbElmjgt2IvZ0GgXekbao7gEeXuVyQw0XdHumzXztHWiK/f9NjyHRSL4gSZ0rQhbWY68dsK03sTBRrHeOZCWtmI7Obya0plwJZfx2EBB8gXRhckpzGyet2SOsxKIAZu36Cm5Ht/SosRjDhK5We01I78gPy6GMjGWe6PMYXfdSh67UeYXzsgsZn8q86V65juaPokS9v0FZBLI2GnKlqWLkvP+G2Kqa4DjiKFNFsWEk2kFMJdQtwsxZft5V8mn8qcLzP5UvKPIGoIETnV4PgjB42ISrgw2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7aYkY8e5FIpd7pj9U+2yHyXDTXkN3c6zhkkZrw0HNs=;
 b=jWve9udy/cN1tpSLpq138ibSYV5QIPqXdOWMZ8kfvwMEleb89gFtyJFH7f2Gt93Hi871Mf+t8ciQ4wYMUyjrnaG1IM099/c9BRxFvm3xvehLXXUaml5E/2szeUEaz9MmByoKwS+UBrC4JxsTYnolLBwXE/BHTdmpFvV8jkYn6YnLHL3cfDJ7BziyzOQ0Z+MJAZukVbqEGsVo6oLL+PJn5Ea6H3Xje5gVpzSkhGk0/WG+eTvzHX2WtfMBzsQmFCnBy+U1WXsYpuYAITfc0siOm6J8SQ0sQpd2seAHB/9FsNrMdpdkXvOvkiQI9zOUXqUSx51sG0SMjpJ3JEywWaEZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7aYkY8e5FIpd7pj9U+2yHyXDTXkN3c6zhkkZrw0HNs=;
 b=kU38wFHsDJofxXBNLWg6/Zzi67fmzhhmGez+NdYBAVXQwi1UfeWqQ9l4ce+5LO3oPs5bUBfMVN4jB7wTguo2EUZ5IHpuqWiPU20q61vXG354zyJZh0VzM2jSqScVP1o3glH+JlLDaVRWa9qs9ZjTVqqnYa9kqcsRTSbmcR9k9GYFig0DbZ6DfV2DaNA0e1nMj0MH7fMwDu4OGBkHAIlj4kd7oxGsa+dNAAaJVADDN7+z/2XqmsiCkcW2MKrphL2tkaDh1r3BVEzMp48gctH95hlnxVxPgaG/paa5NM0gQ3hFNG3ZoSbCKaQvpJUaUjoHOAgOLZXH7Vro6dPR1vw8MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
Date: Tue, 17 Oct 2023 08:54:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
 <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
 <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: da3cedd2-022c-499b-319a-08dbcedde58b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Gobhvny/xhGtZ9XVZOrIJfhNRCqzyfjW7yhiiN/jQWFm3dquPrCmTqnG1aLAC1BiWmjEjhqZZe/gRz+hhFu3nYM1ieG+DMeraqnNerF/ERHqSpcHysAT+FcweVeht0a93UnMbWCbSLdph9GPbq7lkIyO8k8/fVLMvUhdJM5CAni4df+7WPViqJqoWy+iGLYYD/Rmw1rVhcoK+ACc7Dy8SMeuuQRMNCPRL51mOH9HmaHtLViKQgfKqeTWvMzQoodRLv82K8WkVaSRSx7lTJligJ2t0WCXUVwKQE7VMcR2+GrMC++A1Rf0EztpqhWNTXiHwETmsLfCWrjtPMf57MR73pb7cr06DikfpEfh6jjpX8JsRmlmXosc8GJtBpp7qo2VTxh0e4cwH/4crzqccKkV1QLf1pE2nOLJscWSlkeZyoLRKabOb3x7T/PTN0rvyr1bl+op5msrBwhz7A2mn0Mz+qMrGZ8i4E+kuwSIXUqodfqReGgx7ptThew9Eg5d2JVIVYj9qGsRaM0BHgq1IuZwLJom2TitE3oTi6x5HhehAwtFv/tMdWOiPBBF7bQMCTHGdYsflj8mqBfqvSFSWiGKrNWUB9+JiyW/suB1O8HqYMS38aam2vqLScuIonszPEtNFLsV1ETJV88kBZWN21tog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(478600001)(2616005)(6916009)(66476007)(54906003)(316002)(66946007)(66556008)(31696002)(6512007)(26005)(6506007)(2906002)(8936002)(5660300002)(8676002)(4326008)(7416002)(41300700001)(86362001)(36756003)(38100700002)(83380400001)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZElQMmJsTGZuK1krQ0UrcmJ1dm52bEovSU9jTGNYU3d6WUFTc1hTcTJWZ2Uz?=
 =?utf-8?B?VkJhcWhaeExsbDZIaS9jSlRoUkUxbVdmQUhOVEltVDZOWXNFRGZDZW1ZaVRL?=
 =?utf-8?B?Yzl2ZllBcit4NzNBNDNaSGI5OVhFUkdtbkZ1ZHNCL3JuQWhTMkpoNzU5RGdJ?=
 =?utf-8?B?UFg0L1llbVhjdG9KWkNJVXFzVHhlYkJIUTQzVXErWWFwMGJ3bDdwOUhIanhy?=
 =?utf-8?B?RDFUWkNxWnBEY0hTOTRUZ0tXQnBpV2RRTHNwWHY1cnVkMzZkTzNLNkhzQksw?=
 =?utf-8?B?akM4N3BPNDVTQytDODJXWGFQWmhmY3VSNGl6SGpxQWVwMTZmZlU2WFdBRFVt?=
 =?utf-8?B?Ujk0Unh3MlRFTkVYN210ZnJIUnBYcnBiaDNTcnA5RWJhZ050NlFLdWl2WE1r?=
 =?utf-8?B?aHoxbXcybVVYT25rbHZ6Mjh4bkQvVHF0M05rZUh3ak1CWE5QMlE2aXc4aU9H?=
 =?utf-8?B?bktvYTVBODEwZXFRR3h1bmZjWmJyQjFuakxhYmU1NDZmVktIQStuZmE5TWRp?=
 =?utf-8?B?SzY4MlE5TGtNbVB1cUNzbExzdldaYkxSOS9GM2pIVmRVdElPVHAxZ2FOaTZZ?=
 =?utf-8?B?U1k0ZE1wSlFyQ1VIWEtuU0xjTWJOMms5aTRLKzAzQ2hLNHE1WVdwNHhFTzBw?=
 =?utf-8?B?Y3F2aFFLTGhTMW9nUHE3ZFAwVG82OWhqTlY0K3gzaDJIdWFJKzlVcGR5cVZi?=
 =?utf-8?B?TTR6czBTVm1HSDRCRU9mdGVybWxWN29SWnhGK1dQdTJYeFpsWXVSeHFkVFJF?=
 =?utf-8?B?QVdsb3FNVktYNnhwdEJSaVVXNVMyRVBIUkx0cXFuM3lvL2c3UlpBYVdLNGFr?=
 =?utf-8?B?SE9PV0h1c1RRVkVVVzdtL25PYTBrVmdOaVEzS2RpTUVEbThzN3M4V2t4TmtV?=
 =?utf-8?B?MHRhTjltRmNtc295cCtlcUlpWlJYV3BuRExzM2kzK09MT2VXR1BrQjFJRURo?=
 =?utf-8?B?RHZoa3NtL3FmOXEwaFhtc2NqTlFYVEVUSHdqYnlmQlUzUnZ1TGE2S3ZJcTdJ?=
 =?utf-8?B?d0dtaitTZW5NMDA4dm1SczlCR3RocmRneGk5NkdEdlhrMDhxYVF5clJIeGhw?=
 =?utf-8?B?MlRFQVJ2V01hRURpY3h1b093UVhTSUFtVVRDOW1LditjY3dLTDBjczZCNzVZ?=
 =?utf-8?B?dGs1VmtpRzN4Q3NDQTJTZ2xSZlAwZG80MlRKYWtSSkY1YnVWRDlVRUJOTmdW?=
 =?utf-8?B?M0hjSHJjRFZCQlVscXA2YUowOUtvYjIvSnk4eGY0Njh5c3ZMd05MYWVwczlO?=
 =?utf-8?B?cU0yY2FFQ1RZaFpKc0JweERrU2tDMkJCcGNvdktJaytMZFR1eHcrS2ZoZjZE?=
 =?utf-8?B?QnFxQ3NSdERCVXNpTm9vV2FHU3FDU1hIb0ZXZ280ajBRSzZqWVdjWitkY3pn?=
 =?utf-8?B?ZUMzWndmZjdhTWdYQjNxUFZIc0F6RXlsS2Q0dlczM0FLMVc0RG9Ma200K2tM?=
 =?utf-8?B?UUtzWTFjcUlOMXZwbzRGcnZWN2VneUN5TlA5anlLbHllc21RUDdvcVVDMGpz?=
 =?utf-8?B?SnplRVh4SmJLcjU2QTBReEhGQzB6M3JlZjlLNityMUxucWcrdldweWdrUkhk?=
 =?utf-8?B?MlViaWg5ZHJJWDBHbjZoNldIUm1YcUVxbmN4U2tLbkdjcDQvUkpBZXBuWk1X?=
 =?utf-8?B?U3RJUFRJRzdRemVvbDNFNGJFa1oxWHRyTXNSbzBXWjI3djFURUpGK1U2eUdT?=
 =?utf-8?B?NHYyVWovamtaS2lNWGpFQWdqUG5Ia21Xd0szSmF0NE1wa0traW9BU0FYMTN1?=
 =?utf-8?B?ZFpEejBvSWpKOFpyN3JmS0g3NFBHM1ZoYVNSQmJwWjVPMEZvaWtHOFNUVVkw?=
 =?utf-8?B?eWRYVVhXS0ozV1U1U1dOWllsSThuSmhLbERhMGVmLzVwWFlZMXN1U0lISk02?=
 =?utf-8?B?TzVsYTQ0clJIRXBCek8rdHA3Yi93b2J2M3Z6aUI1aWx3ckVwdGtidmFOSUZn?=
 =?utf-8?B?bXNIWDF5ZTN0WlU1em4rcDlyL1o1MmhvV0xiWVc5cVNzRDRuc2JFSlkrRFd5?=
 =?utf-8?B?VEJEbWFwaW5jeXY5aTdwemZJd1hFdk5jTkdIZGJtSExJT09uMS9qQTR1NnFo?=
 =?utf-8?B?YlR6ZjFJaGsyM1RMYjF2SUVaUEsrd3daa3ZWUFRrNkJzVzVCb3hnV0pOdkxI?=
 =?utf-8?Q?iZ37DYiU6445hmXW4NVhi4RNm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3cedd2-022c-499b-319a-08dbcedde58b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:54:23.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTqR6/om2mJ5fvueRreNmUFmYv8rq2oBAfHgAUBoHd7QJ2uIqpE/m8i2M4DaUDvpi1Iur6aQ0Qv9bqYZR37XBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 17.10.2023 00:34, Stefano Stabellini wrote:
> On Mon, 16 Oct 2023, Jan Beulich wrote:
>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>> As stated in rules.rst, functions used only in asm code
>>> are allowed to have no prior declaration visible when being
>>> defined, hence these functions are deviated.
>>> This also fixes violations of MISRA C:2012 Rule 8.4.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>>  xen/arch/x86/hvm/svm/intr.c      | 1 +
>>>  xen/arch/x86/hvm/svm/nestedsvm.c | 1 +
>>>  xen/arch/x86/hvm/svm/svm.c       | 2 ++
>>
>> Once again - why are you not also adjusting the respective VMX code?
>> Iirc it was agreed long ago that scans should be extended to cover as
>> much of the code base as possible.
> 
> 
> Let me summarize here our past discussions on the subject to make sure 
> we are all aligned.
> 
> With my AMD hat on, of course we want to work with the upstream
> community as much as possible and improve the overall codebase. But it
> is not a goal for AMD to improve Intel-specific drivers (VMX and
> others). Our safety configuration for Xen, including the public ECLAIR
> instance currently sponsored by AMD, only includes SVM files, not VMX
> files. MISRA compliance costs time and effort; this was done both
> because of lack of interest in VMX and also as a cost saving measure.
> 
> Upon maintainer's request we can expand the scope of individual patches.
> For example, AMD is not interested in ARM32 either, but in the past we
> did address certain MISRA C issues on ARM32 too, if nothing else for
> consistency of the code base. It comes down to a compromise what we
> should do for consistency of the codebase versus addressing things that
> makes sense for AMD business. For sure we could work on a few violations
> affecting Intel drivers, but overall I don't think AMD could be asked to
> make Intel drivers MISRA compliant.
> 
> 
> In addition to the above, we also discussed during one of the past MISRA
> C working group meetings to have larger-than-usual ECLAIR scans. ECLAIR
> takes a couple of hours to run, so it is a good idea to restrict its
> configuration in the usual runs. However, at least once a week maybe on
> a Sunday, it would be good to run a comprehensive scan including
> components that are not currently targeted for safety. This would help
> us detect regressions and in general spot potential bugs.
> 
> As part of this larger-than-usual ECLAIR scan we could certainly
> include Intel drivers as well as other things currently unsupported.
> 
> 
> Now, concrete action items. Nicola, I think we should look into having a
> larger-than-usual ECLAIR scan every week which includes all of Intel
> files and in general as much as possible of the codebase.
> 
> Jan, for this specific patch, I don't think we have the scan including
> Intel vmx files yet. Nicola please correct me if I am wrong. So Nicola
> wouldn't be able to easily expand this patch to also cover Intel vmx
> violations of this rule because we don't have the list of violations
> affecting those files. 

I'm afraid I disagree: There are likely direct VMX counterparts to the SVM
items adjusted. No scan is needed to spot those. Anything VMX-only can be
left separate, sure.

Jan

