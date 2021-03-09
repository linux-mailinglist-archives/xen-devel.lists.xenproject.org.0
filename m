Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA31332317
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:33:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95311.179887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZfl-00021o-5I; Tue, 09 Mar 2021 10:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95311.179887; Tue, 09 Mar 2021 10:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZfl-00021P-2D; Tue, 09 Mar 2021 10:33:05 +0000
Received: by outflank-mailman (input) for mailman id 95311;
 Tue, 09 Mar 2021 10:33:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJZfk-00021J-49
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:33:04 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0c1e427-6464-450e-b8bf-ca6af61566da;
 Tue, 09 Mar 2021 10:33:02 +0000 (UTC)
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
X-Inumbo-ID: a0c1e427-6464-450e-b8bf-ca6af61566da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615285982;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3ZqSyUh2mO57bo7ulExPFKnz487wyKo/M9T7fWWtUvA=;
  b=HCFHyQp8ZQG/JPX4VQDjiWuErMOyikxeI+qy1g+RuXh6cBu1d320RwS5
   6+C4ccuomrnvf0Z1B4+dG2AgnZFPaD+/ahS7Qwj5DkW/d1BQ8ryuTOmJS
   87OPDou/yb72zFakesMhVigt53HkFR193vYknbjW4r8kY98U4oaQyHfLe
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LRagkpW4dziRmi7pp+0YoEGYbkda+LOmMv8k+O8lmOf86KQss5NdARY4dusaN2HEz/wNi2fT/I
 Eexg1WvcoaQqJwWloZEIqrbKqVYC8Ar3xHWadE48OOAZ1PxjIU7sMek2z+KN1MMB3hl7vjTfgu
 C+rpESfhnAuwTjuJnZjdnA1OATJjWGnuQpje5e0O9mljlL8W8FTD2i4eGdhneMCu9P2WEPIwG/
 0wvKsPr60P1ZgeM4kGVKKQcfvAG3nFsmUmx+ScA3leojFzEmWn4JFUcVCtB9aNAndFHxgMKRta
 I3I=
X-SBRS: 5.2
X-MesageID: 38838476
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38838476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkyEOfLOPJlDVHpxVi43qK1AxaVb4rn9FGmiAbHpp35bllblUvkkvJrwv/8toZhnK1ttmnZxvbpCEkLcJvLCzD1xHpSWWfQzS8/XqWu+tZ4+3j4rVEfoLn5JNc8XqA6jDbsrC3zkwyDbA33ASsyh9OV+ZRtMWmjfEVl+yp6lGymjrNbNWyhB14Coaqlk12F+CRzYInQK4xowDKq+q+0eqmugM7PAIWPHSCJ5dB+oYBulGf6hVo8JtIj0JHxzPGp5uiWEvG8a7pmSiW0IwrEXpArnVbn4RrJT5eDvZwx4WB1/SAQAm+aAUEc4n2tJMb6Iwz3mvVTUh6BidBv7T4mxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPNW8Ne7ZAqm2RuRdr8HcWsoLQpHtARH16WwuuXyI+E=;
 b=XTl1NTOntew9TmeqgY7l6Bj8Xp5XmA+29oxM91Hav9zFQxU/JLTukY7AnHUcJGJ1k+Q+wCCZc8Uz75IGmbG0r5eYAi/D69+dSr3IIJjZYFaCJ7QlaOrSAxJFngy+2LxBQg8sluF2sVlgX20xzpTa3vmShdoLI+ClSi7gyxVPIsDRG0bqV/5TIcoddqZD3amp6R5niIPs41DDDHkpCbvYe5DNlUCXQvZlw0b0pKo1rF6C5SwpBv1GiFkEPVKQQXSLpl5GK1ygwMWa8UCnnjVwysxP5ZIZ5YXmlxawhARfyLpj7QWlChVqK7iCBXCSYaLwzgTWJxO3gdb/Nt5vEKjnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPNW8Ne7ZAqm2RuRdr8HcWsoLQpHtARH16WwuuXyI+E=;
 b=pKrP+nG5K9qoJEaDVQrZBx/54sndHmJkXsn1b9YONIBfe8HN8fcS8bYXthhyXLfgwAHljQGCwP8wmI4Fef61frjRfBf+RuEbot0yG3ZLaAg5GLv25tRQzNFDRzV8Ev4KYqSgvYTMm2850wI6iAIZIOzbg7ePWrbfEKw6CUu319I=
Date: Tue, 9 Mar 2021 11:32:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <famzheng@amazon.com>, <cardoe@cardoe.com>,
	<wl@xen.org>, <Bertrand.Marquis@arm.com>, <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@eu.citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
Message-ID: <YEdOz4B4rtXbjKOS@Air-de-Roger>
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
 <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
 <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
 <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04927fa9-d124-46b4-e025-08d8e2e6b195
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2777CCFC6C1A6F9F19CA09B48F929@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vz12Aoz5JT8OdI5WTOrZ/DQvJ/HWsIImKDUltMW0o6GamOaYq6hdn8gjET+UvfF5JpyxaiOauCZWXFzlTDasYRK46SOExsIpfxe9jFZMvPaSeG25Hl5xSlwTP1bV2oRYdk8qfG1TlrR7M+sSQRmgxAIPHNbtwWwKjLUMiDEe+Obg3kaecYwpV2Un59Bvxf5FVgw2rbpTpMSXyAZWTjhOD4vFhSTixL/dQprONkVlNJtnP31umS8EgN6jqRvJ9zVAO5UGNYj4Op9r1qrBK/tGpYnV5FBZdR10wqA7dbTuJuQHtusEfqN1tPGbzhTAS0oGBc3YnCE/Vzd5AVB0JhFK5b2pzOBRew0YzBs2hu0owplhOJ4W+mhPG/jQrQVcyvtMjGFf9BYcqFCeaVX0zeO5lt7r9z7U5G9521A7cnnOyH/G3tPlpxITKUoyhfXoz7V/3yByGq91Jhg1KwkgO8lXTqjW0/QdD6skbUfloQzdL3AIBPmq4p/ATvSg/zF4K7oooeiL95K4F4eH2s3l2KXITQv+OrIRRveGgrRZ/ZwfDhPtAyXsaPwJd5QGgjpN8tX29e10E3JNokYSpARvQuVjsWE2C1SXOW8q5jookATxkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(107886003)(316002)(966005)(4326008)(6486002)(956004)(83380400001)(54906003)(5660300002)(86362001)(186003)(16526019)(6496006)(6666004)(478600001)(66556008)(66476007)(53546011)(66946007)(33716001)(2906002)(85182001)(8936002)(26005)(6916009)(9686003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGx4d3RBMm5VM1krUXg3MVREWnlDWDJqRThNVmpqNTYwQTJkWWVBWjZxazNu?=
 =?utf-8?B?SWpQeTJzWGpRV3hIcy9naWtudU41RS9TdDFqaW9ULzFpT24xNzhyVytKWUFi?=
 =?utf-8?B?eUJnbHV4WE5Jb2xWWDFueDN2cVptOEt4ZzlsVm9hQi9VKzNFTlpXMGQxSVkx?=
 =?utf-8?B?cmFxbFJmR1ZGSUJhTTRZMWJlbFljQlFCVmxXVEpjUkk5eUl5TUhOQnlKd0k2?=
 =?utf-8?B?ZExjdGVYZC83bUpUVloyWERHd2UyRGlERi8xSWxXZkRKUEhEVzNrZ00xejA5?=
 =?utf-8?B?bHNmZUczeWY3QitIV21tcXoxSXBtYjZIYkRNblRvM3N1V2wwRXEyMHprazFT?=
 =?utf-8?B?c042My83YzBGdDJ4c3VJWUFuZWxzOUk0cTRsR2ZZMkVGblh5cStFN1pmQXdR?=
 =?utf-8?B?UFJKemgrMWp0SUkrMWNLQlpNTlRiKzFzbUZRNk1xdEd0emxvV1NNaUNiam1E?=
 =?utf-8?B?cngwdXVJZkdHMTU4M1dFbXhQcHlpb1ZGeUFtVDYrK0pUczgxazFkVzV2eFo3?=
 =?utf-8?B?YXBaQlEvLzVZdUc3WWxqeXhGK0Y3YlNRM2x2SlRMZ2ltUG9KSTFwUndGamFF?=
 =?utf-8?B?alY3QmpVS1htTG5LTzBsakJyR1IwUzBTd3lOc3dhUE80KzFlWFNMRXBOeW41?=
 =?utf-8?B?QkZjRHFGbXdrTjAzNG1wUVREV3pGZmVYeHorTGdvSWdIa0plSjBTblV1aEtG?=
 =?utf-8?B?cFRUUGQ4ZHJFMUE4VTlZUmRsSm53U2VDN0JVU01MRXZPcWM4UDMrQWFJQ092?=
 =?utf-8?B?UVUxYVhZWHVnaE96WEJzMm5zY1ZzdlFrbDVHVkxYcWdaZi9nRlUyQm1aLytj?=
 =?utf-8?B?ZzNSeTkxckxrNnlQRmluRGlzUUJKQUpMS2RhMk0zT1h4VzhlMTM1SXl6NzRY?=
 =?utf-8?B?Z2h1RklGRkNxMURNc01GcGhQa1lMak1QRHlLZHNFTUxNTjhSMS9GYlZrSUht?=
 =?utf-8?B?bCt4RG1sRzZSM3hNb0JGcktDbTI4aXpHSjNmN1dDWm1yMFNmeEFVQ2RUcWZw?=
 =?utf-8?B?WWhqSVc4WVA4enQ1WnFnSHlhZ2hnMFQ5OEJkS3k3ZVlyekM4Qkx6NHIyM3ZX?=
 =?utf-8?B?WUErMzBBU1VCc0NpVDc3MEd4RG1BRXJlb1daRWxKVzRFYXlSTml1clN4czZU?=
 =?utf-8?B?WTdYaFNyS2JRU282TWJLTEM4UWtpbjdEM3BMQ2pFemplRFlBbHVqMUUwUTBP?=
 =?utf-8?B?R1RPbkk0cERHT0w3M2tvc3VsTHdjVkNVWkoxRDV3U1hrdnN3RW9PdzR2cjRL?=
 =?utf-8?B?ZkdndG9Vd201QTBmcDhiL1BYcHFZRWlja2xKKzh2UkJFOHpHc0IzalRaL0Q5?=
 =?utf-8?B?OU5nUnY1T05uL00yOWVmWnZVZXhiQ2QvWjVoUDdyUHVjM1VGcEFlOEoxbzRL?=
 =?utf-8?B?NHJkZ2dPMm5RY0hDOWExM2dhVW5oZFpxRG5lUFg2UmJKRWVWdnJnZGxnc1ll?=
 =?utf-8?B?TmV2RldKYnp0MTlGcnRvcm5QV2w5bDhUS3hma1g1UGtQZnhzYVVnWS95NXhX?=
 =?utf-8?B?NHc5aE1QYmk2WHkxSnVJcDdDMGRpQ0ZMbXRXRHpISzBPWXJOZVlDNmwyVE04?=
 =?utf-8?B?VWF2TDN2eTlrRjc2eU5tRU4xcm82M0dIUWNlcW55UG9ncmlwd2tjcVlqK2VM?=
 =?utf-8?B?ZnRsN1FRakd5blpSVTJYU0UxNmFlMitHTEJEdjdsS0NXVFNaeVd2UmlBdUI2?=
 =?utf-8?B?TzRyMlF1UklCc0tsaG83TTZLY1hxdDNoNFlNMXpsWExqYllEZjRFNTB6Qk9P?=
 =?utf-8?B?ZHhxbjdqS1F3MjFPUTZ5RjJjSHJkcXlhWStrdzl6aTdQLzBIYktqaDljem0r?=
 =?utf-8?B?dGZiVXVwRDJnRWhCU3RXZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04927fa9-d124-46b4-e025-08d8e2e6b195
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:32:52.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLNUPZRy7HLA4r0v6UdxgkaYkfbx7SYfX5nw6X9+PLm+/D028vBKYUt68SSC4gmmDg5fmsOnXlHQdTizMjfloQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 10:05:18AM +0000, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/03/2021 00:59, Stefano Stabellini wrote:
> > On Sun, 7 Mar 2021, Julien Grall wrote:
> > > On 06/03/2021 23:04, no-reply@patchew.org wrote:

Where does one has to register to get the patchew build failures?

> > > > Hi,
> > > > 
> > > > Patchew automatically ran gitlab-ci pipeline with this patch (series)
> > > > applied, but the job failed. Maybe there's a bug in the patches?
> > > > 
> > > > You can find the link to the pipeline near the end of the report below:
> > > > 
> > > > Type: series
> > > > Message-id: 20210306214148.27021-1-julien@xen.org
> > > > Subject: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to
> > > > 4.9 (5.1 on arm64)
> > > > 
> > > > === TEST SCRIPT BEGIN ===
> > > > #!/bin/bash
> > > > sleep 10
> > > > patchew gitlab-pipeline-check -p xen-project/patchew/xen
> > > > === TEST SCRIPT END ===
> > > > 
> > > > warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> > > > warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> > > >   From https://gitlab.com/xen-project/patchew/xen
> > > >    * [new tag]               patchew/20210306214148.27021-1-julien@xen.org ->
> > > > patchew/20210306214148.27021-1-julien@xen.org
> > > > Switched to a new branch 'test'
> > > > f332859b88 xen: Bump the minimum version of GCC supported to 4.9 (5.1 on
> > > > arm64)
> > > > 
> > > > === OUTPUT BEGIN ===
> > > > [2021-03-06 21:45:17] Looking up pipeline...
> > > > [2021-03-06 21:45:18] Found pipeline 266507477:
> > > > 
> > > > https://gitlab.com/xen-project/patchew/xen/-/pipelines/266507477
> > > > 
> > > > [2021-03-06 21:45:18] Waiting for pipeline to finish...
> > > > [2021-03-06 22:00:21] Still waiting...
> > > > [2021-03-06 22:15:26] Still waiting...
> > > > [2021-03-06 22:30:31] Still waiting...
> > > > [2021-03-06 22:45:35] Still waiting...
> > > > [2021-03-06 23:00:41] Still waiting...
> > > > [2021-03-06 23:04:42] Pipeline failed
> > > > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is
> > > > skipped
> > > > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is
> > > > skipped
> > > > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang' in stage 'test' is
> > > > skipped
> > > > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> > > > [2021-03-06 23:04:42] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
> > > > [2021-03-06 23:04:42] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
> > > > [2021-03-06 23:04:42] Job 'build-each-commit-gcc' in stage 'test' is skipped
> > > > [2021-03-06 23:04:42] Job 'alpine-3.12-clang' in stage 'build' is failed
> > > 
> > > The following jobs are failing:
> > > 
> > > alpine-3.12-clang [1]
> > > debian-unstable-32-gcc-debug
> > > debian-unstable-clang
> > > debian-unstable-gcc-randconfig
> > > ubuntu-bionic-clang
> > > 
> > > Cloning into 'qemu-xen-dir-remote.tmp'...
> > > error: inflate: data stream error (incorrect data check)
> > > fatal: serious inflate inconsistency
> > > fatal: index-pack failed
> > > 
> > > This looks unrelated to my patch. Possibly a network error?
> > 
> > Yeah.
> > 
> > 
> > > =========
> > > 
> > > centos-7-2-gcc [2]
> > > centos-7-2-gcc-debug
> > > centos-7-gcc
> > > centos-7-gcc-debug
> > > 
> > > Centos 7 is using GCC 4.8.5. This patch is bumping the minimum version to 4.9.
> > > So the failure is expected.
> > > 
> > > We may have to disable the jobs if my patch goes ahead. May I ask why we chose
> > > to build on Centos 7?
> > 
> > CentOS 7 is still the latest and it is maintained until 2024:
> > 
> > https://wiki.centos.org/About/Product
> > 
> > I don't have a lot of direct experience with x86 users any longer, but
> > this seems to be problematic?
> 
> The last full updates was on the Q3 2020, so it looks unlikely that Centos 7
> will upgrade to a new Xen.
> 
> So this is only going to be a problem for anyone that decides to build there
> own Xen.
> 
> I can't tell whether someone may want to build upstream Xen on Centos 7.
> What I can say is the Arm64 bug in GCC 4.9 will lead to corruption, the bug
> in GCC < 4.8 looks somewhat less problematic.
> 
> So, I am sure any user would appreciate if we tell (e.g. throw an error)
> them when there is a risk that GCC X.Y may miscompile Xen.
> 
> In the ideal world (e.g if we had unlimited time), we should workaround it
> in Xen. But this doesn't look easy/possible here.
> 
> Therefore, for now, I think dropping support for GCC < 4.9 (< 5.1 for Arm)
> is the best approach. The support can be revived when someone is willing to
> spend time on it.

Does CentOS has something like Debian backports to get updated major
versions of packages?

Also, I think we do maintain Xen on CentOS using a separate
repository, so newer versions of Xen will be added to CentOS. Adding
George and Anthony since they know about that.

Thanks, Roger.

