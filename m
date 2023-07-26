Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37B762B9F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570064.891353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYAv-00072V-BR; Wed, 26 Jul 2023 06:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570064.891353; Wed, 26 Jul 2023 06:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYAv-0006zb-89; Wed, 26 Jul 2023 06:39:09 +0000
Received: by outflank-mailman (input) for mailman id 570064;
 Wed, 26 Jul 2023 06:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOYAu-0006zS-2d
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:39:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dcf471d-2b7f-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 08:39:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:39:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:39:04 +0000
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
X-Inumbo-ID: 1dcf471d-2b7f-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQoEArJ+Ocb9YQy9/dhJJ6M5YvOoM4xC+tlbEJUCOUW3031NRezEW3JsX8S3iko32rXGxPodJUuj8boJS6B9pE762ZKFzZRFI7tr9dz8R7yhZpMb65tyvDip1qpUDaQVSWnEELQ3qjpR1xqYZoh2mTK9b4r75sliOd0RfZ3W9a1gXu4QW2ev80BvqMtYsrCdqg0un/7SYpAj8RcrGPJvhGq+X0otQ/RkOGb5V2klZdUm7dbwgLmRHbxx34AMXYiV5Sisy9gNVaDhtmRK4oP3HpcFNl07y1+i5J4ca8cktr9QIlLTDhUnJmEsBOrUAAFSh3v/8b7rGGbm+7bglJyRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9AE0Vb4bcT6Fi0slcd1PzH0iQsO5wnomwC2k11hBAw=;
 b=k22UtrDyYNut0KNJ6ShYbCkplfsXiOUN1UiqoyXlayj7Rtg/yLsAuKZC5+UGUp9Q/m2Kd+YAUwDL8zpv2n5kZva61CcHQSNIQjtQ0AsZEkUIWHyOaFLi3AEmCMcuyweMBqqH3O91NuA3lWSrbuYslRrsVzkVlBBHxEaxyFXWTh/Aa8zvO1IcBapQpdTZc1H+X5GfZas8c4YVIPj/JYJb8Ew98075LsotgvmtitV6XfFncQgKB3s6wUI/Hecn1aREkYm0RvtAaxOchpnll46YKMJ8MvXNs6qHzimfjw8k9KgBrdHrSHi4qrTvnK3NprBNDvTz1hPZOf2d9lF45EgDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9AE0Vb4bcT6Fi0slcd1PzH0iQsO5wnomwC2k11hBAw=;
 b=YV6gK24JG8Bmed80umZOXRnYTdl9v9WLCn44sSR82gqvD52orQQZmRV/1VapweKiu/CpvgMaj61CkV+l/kaU2chCZsfk3537PbHk5kGQ45sCNtChju8SUfVKXnmrxKh/bCfpWpjAOJlp68Zne/W86Ir5qdMWh9pC5f2ngSA+KHNGqbqpCHqrnwIo4N2RNlzL+Ah4DK1nyyezcQyStQkIog3k0vXkMEAkDfpNLgg3iR2AMhUyY8NhLA6XOHRzGdVtvdojQkmyc4oSJmIOywgqwt5DGbtEtqRXCBDBflla47ZR/7JrPXr0jojXDdCEMkkTxiNtKhNu4Ufb8iNS4siO1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bef8b24-860c-fbba-fad1-92be1fb7e165@suse.com>
Date: Wed, 26 Jul 2023 08:39:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87ila7cvy2.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c76f31-f747-4c68-02b7-08db8da30124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pFOuZrYE3NjmCl3vfTkCerOAbgxRmo4YkCFbQM2RaRuqFdjbhn28eZehp2xogwbnSWG6MDwDEyeqsd8UW5bFbp2ivuzMcxU7vhrupKQEfeGl3Y42rIVdaQoFj/TAisLgotBVLnHKdWiQJ4hYO8sVEy2hR30LEMqhqkQUKwbBpgbrFPxQv24r2cFHKDqkWY5uLFci5Vj5U1V2Lh3ehaQs6AnvYCkfmHi0VvEXUeUJgTcCiwjpj+XIElt6xjzFwbo3jt43pHa+/V8w3yZBmteb4y5rCeF3X2fkMGSrnYiMZVBPSIDds8wIWtg4wGGLXqY/R7ZMrDH5J7DyBlDHnid11Sz5NxxPO5pOL2CY6cTOTMSVZ9T7YXluLup2pU79MtD20R+UJYP8MI2yqMbYPKxUURjKZ9WFKnlaXPuyYIr2K8RKdsIHt8zWn9vKZUKTSfy+ng2SOy5PJnDEdMUBS4nZJQCgc+HHfJsbPLW7XT9FkfGrsxI7yWrP3Jy2QvtTi5InLGdNo2KXNIe6W6Zu2t5lx1fc8FoJA8UpKCJk4AaPgFTPudfNOFOGAPi9VFQi1s/MLAWk0Na6z2KrwW4KjgQCXWMQGVMy8YN8nahGGmYF46BYCS18JHtxEwN0FZ3uDsOPn3tbowFeEibeHF43k2UYMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(2906002)(6506007)(186003)(26005)(31696002)(53546011)(83380400001)(86362001)(38100700002)(2616005)(478600001)(6486002)(6512007)(6666004)(36756003)(54906003)(66476007)(66556008)(66946007)(41300700001)(316002)(4326008)(6916009)(8676002)(8936002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdHQ2twTHptZEdPVzhYb25MdWpvb3c5ZzIza2JCY0ZiUW42eXdOc0Jla0FS?=
 =?utf-8?B?N2VXTGV6R0ZiZURwMjZ6UEg5eldyOGJoUzlEckxxZS9ybWVKRDJkWUx2VXVU?=
 =?utf-8?B?N3JUMUxhek9IN2V4NWlQWEUwRS9POU9LRnlsYVZyMnk3QVNnOTZIK3cwS2pj?=
 =?utf-8?B?a3lyQUMwMjROajQyOTczSDVmcGNrOGJ1ZWRid1NTUkFGUHdrdnhUZisrUFMy?=
 =?utf-8?B?NWR0aCtpWXdiOFZKL042VUdHMnc0VU1kU1FhMitUNTU5UC9ScWFYUlNOMVMr?=
 =?utf-8?B?dDBCOEVTcXhjQjJ5UWZCaVA4NEJ3Zm04K1NnczJteTJCMkZXQVQvMm9kRGZr?=
 =?utf-8?B?QTluNHRFaUNVTktKM0NnMnJ5Y1BweWdkLzM2dHduWHRaaXFVcnk0TjQ5UkNr?=
 =?utf-8?B?dGQ1VmFWamNQbC9vMW11dDQwVzc1NkdqZ0V3OGVVazcwUG9tT3lXTEVkSGdy?=
 =?utf-8?B?clJOQm53SUN3anFsYTVVaXNJbjRmYnlNcWEyTHYra2VEcHVoTG5QQWpqc0s2?=
 =?utf-8?B?bm1Ha2xxK2RZZmZBL3NrcHhKMEV0ZEIyNlhvT0pvOERqaTNQZUhhNjZvTHhP?=
 =?utf-8?B?QUFtak9HTGg5ZVZLQ3pBVDRraVN3NHM4MjV1R01rNnBaZ0VkYmJNa25ZeFI2?=
 =?utf-8?B?dGNGN2pORHZJUDQ0dzEvQlUzTzg4VzhPekh1UU14MnJoWW13bzFETnZvdHla?=
 =?utf-8?B?M2JhRklVVHA5OWJ6MGFYc2VtOVJ2SStsUzdQM2x4V1FwQWVrOHMxNjRTY0l4?=
 =?utf-8?B?Wm1Oak01UmlaVURLZklZR2k1bzhDR0xhbU1sQmU5VlBNQnRTdzFnRTQxOGFj?=
 =?utf-8?B?bmwvSWhzMUw4L21lcVRDemJvOTZMbkpYTVhJM2h1WXZJSzd2ZzhpNzNSTElC?=
 =?utf-8?B?bm9LZWJkNE1teENIbEw2Y2dHc2ZUOTByYm9MMjdhWEhzcjVpMCtTM2srbjdq?=
 =?utf-8?B?a1Zvc2s0c1QvaWZSZGJkdXJ3MWk5Q3BzRGVVT0VUSlJkck1DRlRaQUx1YUNp?=
 =?utf-8?B?RmRHV3ltai91T2ZyeVF1c1ZCMGVyalg5R256dDRsRDFnbzZmY1pjK1RRZzVy?=
 =?utf-8?B?S3Irc3FMWm9LbzFmYWcyZlBIajNLU3loR2RlaG5icUZZeVJkTVZUcldhUkZ4?=
 =?utf-8?B?dDV6WjhPSjhCSGh5Z0srZXhWVUFQcHlkSWM2bmZBRHFablA5WUJ6QWIzNXFM?=
 =?utf-8?B?VmgxTCsxY0prOGNLVHoreUkyQkhHQ2FsT1pSZDhYeFpjaHkweEsxRTJ6Yk1Q?=
 =?utf-8?B?Vk81cm1kQzF4ZEVjN2Y2eEJWQjdyOVhTditjQkQyS3NMMVU1TVRGSGFNNDBY?=
 =?utf-8?B?eEwyUXlWRVdjcG9WVnp3cWpGQXhCb0lRY0pOa2JTbndxN2hJL2JkM1Bjb0hR?=
 =?utf-8?B?dHJGNGtXNTNmbld3bnREMU5mMjJRdU51d3JCd2tGU3J2NUk3bWJzdzVoT0lM?=
 =?utf-8?B?WS8ybXo2WG1NT2ZqcUZEVnhFbUhrY1gxbmFqQW9aSWVoWVFyMzJsQVRRdFFy?=
 =?utf-8?B?aEtCamQ0MWtaczhHanAzaEkzYTBSSFFzQmI0MmEzWTdNcHExTTNXUEdBZllL?=
 =?utf-8?B?NmFjdzFMMlZsSndMSGp6S0dZc0l6eG1pT3V2NWxTRzYrZU1SbFFJeldtak8r?=
 =?utf-8?B?K1B1aWErTWRKaitxblhkZitqYUxaNStmR0FIbXh2bE5YeHhBSVRrRTZEeVE4?=
 =?utf-8?B?Ulo4LzBLOUlNZC9QeU15NHdsMHNOajN2bUMwT0pTeXJqV3FhY1plNXhGazJS?=
 =?utf-8?B?d3YxQjhiVjc5Ti9aaVNSWis1U1FrNXNqQmxNaGZteENQSkRjMHRpVkJRbnBN?=
 =?utf-8?B?STdKRjRWd1FHeGZXOExpRjFOK3RUYldMMnB0QVBmeVdjUzVCL044VTBjTjBI?=
 =?utf-8?B?UGJJazNBYXBDODc3ZlFKRmdWOXlMY0YyZGMvY1UwVm9aL0FSYlhwdDFVL1F4?=
 =?utf-8?B?dkM4T05QNGlXZHdRNE5OeEFMa3JmM2RxdzhocTUxTFI2ZEd1VUhraVNnMkRL?=
 =?utf-8?B?OXV6K3dsNDRVRTYyWWJIbFI1enZ1bzZxNkdQZzdjTUsvYmcxYmYwbWxwekta?=
 =?utf-8?B?NjRpWWNpYjlJZkRjQmdnS1pxdkYzbFVLMHJrRXZINmVhRmpCOW4wekZRaU1R?=
 =?utf-8?Q?BMSSqAG0H23njEQ93sO/sX+bV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c76f31-f747-4c68-02b7-08db8da30124
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:39:04.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjUIdnII0PnM9OJBKoKOGatiWvPURM2IBCIkGS8llfBBmrWp45ZxmpWFgKkQK9n5Gfnw3rxNE7BLftpoExwGaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604

On 26.07.2023 03:17, Volodymyr Babchuk wrote:
> Roger Pau Monné <roger.pau@citrix.com> writes:
>> On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
>>> --- a/xen/arch/x86/hvm/vmsi.c
>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>> @@ -895,6 +895,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>  {
>>>      unsigned int i;
>>>  
>>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>>> +
>>>      for ( i = 0; i < msix->max_entries; i++ )
>>>      {
>>>          const struct vpci_msix_entry *entry = &msix->entries[i];
>>> @@ -913,7 +915,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>              struct pci_dev *pdev = msix->pdev;
>>>  
>>>              spin_unlock(&msix->pdev->vpci->lock);
>>> +            read_unlock(&pdev->domain->pci_lock);
>>>              process_pending_softirqs();
>>> +            read_lock(&pdev->domain->pci_lock);
>>
>> This should be a read_trylock(), much like the spin_trylock() below.
> 
> vpci_dump_msi() expects that vpci_msix_arch_print() will return holding
> this lock. I can rework both functions, of course. But then we will in
> situation when we need to known exact behavior of vpci_dump_msi() wrt of
> locks in the calling code...

Your reply sounds as if you hadn't seen my earlier suggestion on this
matter (making the behavior match also for the now 2nd lock involved).

Jan

