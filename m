Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD274E9B11
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295497.502869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrEw-0006Yk-L0; Mon, 28 Mar 2022 15:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295497.502869; Mon, 28 Mar 2022 15:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrEw-0006W5-Hr; Mon, 28 Mar 2022 15:25:06 +0000
Received: by outflank-mailman (input) for mailman id 295497;
 Mon, 28 Mar 2022 15:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYrEv-0006Vz-8M
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:25:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c62d5bd-aeab-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:25:03 +0200 (CEST)
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
X-Inumbo-ID: 3c62d5bd-aeab-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648481103;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hfKsfUhUmlVs7CgVHxDKmPJdNrrZlv8VQm9bG2bblzw=;
  b=KNeIO8eIOc9FhpxCIRMZPL3dMHV+PwOn6SMck+wXhUStmePI5tQ/ABFW
   tvvcS/JEHRz/tYaXDgf9P+W/6yW3uRu5oV8Pr9zZYNNZt2FFXSE7J+ERG
   aVCyjIifgvX6OkY8K0FleiTD3uDMtQbCJulFx3A7LYX7reNJR+BWG7pTt
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66792990
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3IMfNqOfUIshttbvrR2xl8FynXyQoLVcMsEvi/4bfWQNrUp20GECz
 WBNCD2FbPfbYmbyf4tyYY3jph5T75/WxtU2HAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2N4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 OpP64KuCiwSNZbKhtYQDwhxTyxbFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlv15ofTK62i
 8wxNiZkYTnRRBN2ZHwsNo87zeOBuiXHfGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla8gRxCRcQTONYx0weT+KeI8i/FC00tG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnFI4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1gRiG2NPdXABb3nARBodtzxor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/LdwIv2skehw3Yq7onAMFh
 meJ42u9A7cJYROXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPXkk0GC7evO3O/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chQwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:xyubVK5GaQVMoC/MFwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.90,217,1643691600"; 
   d="scan'208";a="66792990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0WU9eyMFFnAF/rdMle0XzBCosmNDKqufjStXOg6oZVf/RSEbTBHAxrvAvrclIy6uznrUtHCV0tMVCnGTIPCDpi5cwNtkgNQpM07MIyf56dT8nZOZqCPLk6eAZRGQ6oeNJIY4cV7zMPjfYsotNHR7M9G2jCrOQWZYhux5u5okow1u7MkhZMmmnXt4BpBOID6apH8ASKz0hKyEu6zWZ6w2YwU+2uWEXDZqU2xaqKZyPo6wGHzZG8ECO8qTnJ8+p5SkKg9VcINOBP6Oxxq9wRtMOWh4lYHFt3PTBDYiC5Q6D5RkonNK/pcnn/WN/5KCqnqmeP0kQjNT259ZulptE6hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgmROSTXiNTy1esC4yRGxI90R9ddUU0WVVD76Osf2Zc=;
 b=ZX351bSTBKIDqicGIfMMDsgmsJRNMvERxucs/9005f63+GdNE9BYWHc835I3uIg3E7cdB/cpMIqTyutBrxDxWuhw/GTNqeK11jaRo7wU9JiILTmSd1ngsGESuNhbTTlKrqzPGAimvBT0KfUf6yKPyga2g3hth47Wriv8AZmDAJjUKasN+sG66Pt9H1FVBrJELEGGzNjFaVIqBLhXvjwt+aBzNbAncVLpmE5RA0KxFsFEjOKvcgloyj40J/VDBvd+KZb0Pu4/VPjqZO5EuP7yiGGk0cleN51s+twQYYIa4JzMF9c/Y/q1XRfDDiFmYr+G6Tk3AlAlEPXxPwavA9sOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgmROSTXiNTy1esC4yRGxI90R9ddUU0WVVD76Osf2Zc=;
 b=K74kUkSAA34YTc5pVyjWBaxpyD6l2na4cuCX1UTPVggkz/g/DKujVSL4mME9svT4WWBOqaeuoXLgYALq1MqWiYrC6NnRkrHJclYDGs8yXKL0RVMue8FYfEsi5d6YviqAXARrb9rN2zfT+0NVIviAfjuebsP/MzBA8oJEr55BiLE=
Date: Mon, 28 Mar 2022 17:24:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <YkHTQ47POJe5lpwU@Air-de-Roger>
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-4-roger.pau@citrix.com>
 <81e90bb0-bcc0-563b-eda0-9979164aaad2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81e90bb0-bcc0-563b-eda0-9979164aaad2@suse.com>
X-ClientProxiedBy: LO4P123CA0498.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 154e5c6a-8e4f-42c6-e661-08da10cf1d0e
X-MS-TrafficTypeDiagnostic: CY4PR03MB3061:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3061AFB1A684D226CE687EBD8F1D9@CY4PR03MB3061.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urwyuGTXuduJkAV7oAhwyx0OWNlTo7NcASc2WobAnInMWRzA/aLjoXHYM80260jItE/s+VbzDPTm+ledVNXSZ4oLo95GdGdkY23WoCnAB+nFD5G3gHAjWhJqfGAY6BNXqu5BQ4IGkjx7Ox5wYAnwminSpBrDrthC3e4BM10UtuENsOp0bJaiHDSjXy5AoUbLM0aL5L8Es44SG7+jCbPkaXTkabInZ7E2CkkrGucIZ890lwPJna/iDXKSCEA04CNLCqk/5375nFQhchwJYzG1d4wHq9I9ZbQgMJDM1FjZ2wafqd4FHHT9zZf6B9GbjY8y7afI1M2yOZtjcuHXtapyCPgvrSxlCpmg9O2CcoHujyqZjdxxbAfw9Mp773z69EUvi3DCnjE4Oi1pIdjgwyyGF7303yGEK71lIkvGvOJmVocMcbEPeJ6e8fLtgORRjlo/c8WCQzXC7vUcIeQKAwZkrIKiBwGN60X70MeNKfFkRSacq1tjuVbY838qR0bgBULvjme7+sdvojRcF05iwZW/OEPJNNBbepndhnFTx4jXvB6UhXBYZNuPeq00XSW77Gk1TVesn6iRmY6OsyhRph/KkmK1z/67jRvwVAMk9fn6OpA8Rgm+40HDG0md4PaR1jrn28SbRhGUOShySEOglTgNdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(82960400001)(38100700002)(6506007)(6486002)(66946007)(54906003)(6666004)(4326008)(316002)(2906002)(86362001)(508600001)(9686003)(5660300002)(33716001)(53546011)(85182001)(83380400001)(26005)(8936002)(66556008)(66476007)(186003)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNhbFRsbXRPM2RjcE5wMjlxdWZUVzlhTGFTdEVlbjIwdjk1SFAxdXpGNFd5?=
 =?utf-8?B?YWVFa3M2aUtFVGVqUU1ZNUp3ZFVacnRkZTRWWFZqdVNYbzJwWlJNZDJKUzFj?=
 =?utf-8?B?YzJSQkFXcjFiaUxZZ0FsZ2FBQjM3Ky8xNGU4d0Evc1RESk1CVjIzQk05V0RS?=
 =?utf-8?B?UXMwT0tubjh5MEdkZDdzdzl4MjY3cjR6cXhlMkxsYjV5cVFNVUhjb0psWUZa?=
 =?utf-8?B?YkNSMjVVYWhBNzJsU2VFMFE5RlBKQnlzWllCVGs1bFdsZnFsK0RjZ3BRdnUx?=
 =?utf-8?B?ajFSQkpCNUduNTRSSGtlUkRyNDVuS0QwVlZzRnZBME5iUU5aMnBUdDVqcE5z?=
 =?utf-8?B?Q1VxK0owSVJvN2tGamlyNFcyeitTdzdBTTI0UlJNTE5aRk9XYTBMT3hoMUdP?=
 =?utf-8?B?Z3dKUDhzcjFqNGE4NDdCMXFqMzF0OXl4REFHdDF6QmR0blVBSWt1MUYySlJ5?=
 =?utf-8?B?Ym9WcGRRcFZ2QkJBUjlFb3BMYzdjQitsdlRhb0I3Tlh2N2c0dTNmTUJId2hp?=
 =?utf-8?B?QW5GN1JzUVdXUnpodGRWb2xUR0JBWWRZd21SMmlWbFQ3REJURUxqMnZtOGg0?=
 =?utf-8?B?cE54S1YxSWtxVklUb0p1MzVUSnk4VndIUThBM21xUi9rM29GKzFpVU5xQUVw?=
 =?utf-8?B?R3RpdVhnU2FRVGV5WjhXMW5mRWNxcWpWOTArSXRJRFpxMlhLeUJSdUxhZEdl?=
 =?utf-8?B?dVdFMGxhaCtmUkpDREEwQTNZWlI0bVUrdXlrWEpodDVYM2lsditLVmVJQmN0?=
 =?utf-8?B?Rnp3cE96OWx4cTNzRThJTm5ZVUMyWEc3VnFqU0F6eWdraHJ6RncxclNTQXJt?=
 =?utf-8?B?L3ROc201Q2tGQnJ1cGcrcW9EUlVOWUF3NDhQVGplbW85cjFOSEFaZy9MQ0s5?=
 =?utf-8?B?Wk5uVjd1eW9aUEJYU2ZXRE1tSHlkOFRJNEYzR1EvSjNFcEQrNDZDQTlGRGlI?=
 =?utf-8?B?dVM5cmpIaVpVUXhvcXFvSGRDVWthWTNTTHgvcTNuSDdsaGZPUldaYU5aRTdT?=
 =?utf-8?B?eWhqcWVWMVM5MXBDbktTcEEvSXVJdnpYY1pRaFhwRHV4WGpCUGFQbVA4NkVL?=
 =?utf-8?B?UzBtMHRId3FUWGdoNVJvT2Q0eEZlSmJrRVNVbWVwMWFoTmc1c1o2SGhKYUFp?=
 =?utf-8?B?b2ZJcTNaNTBnU2F2NThjSGlIL0JRTVRpWVNJYStEV0xKZ09CN2JVQ0ZxNU9n?=
 =?utf-8?B?TFZjcVdra2N4M2F2eHVpY2d4TWQ2STlKWlF0RTBWbVowa1d5czRlSHpmMHpB?=
 =?utf-8?B?eXNiNno2dGNXK1RiTzlXMXNQb1RRWXUzVVFoRWVzK3BXUDd3WjRXV3VLNHpL?=
 =?utf-8?B?R01WYXBOenIrRFQ4WC9YcEFYd2NhQnkzTUgveXVKVXErbHBGV2V4ZUJMdnZQ?=
 =?utf-8?B?Vjl1b0xhS2xBNFhGdHZiY2ZSdG1pdlQwL1gwSkVzWDZYTVVWWEx0TkxFRDYx?=
 =?utf-8?B?L2g3NWdUeTd6Nys0V0ZQY2xFdlduVGVRbkVseEI2dnY2bk1xZXZ5OWs1ck1v?=
 =?utf-8?B?Uk44ejJES01tZHFQTkdXZkU5eTJxMldvejhpUFBxSmpkQVFwZDFqZFN6UG1E?=
 =?utf-8?B?SnlhYkJ3eXhRTktxWXN2UHJoNzF5ZFl3TzhvTFMxL3ZzRzc4NGFucFN5ZHRz?=
 =?utf-8?B?alZ5TFhncTM5Wm5UbzhkK2ZQMjFxdGVCYy81N3JoT1gycHlzbUJwLytGUmV3?=
 =?utf-8?B?NVRFOXlkQS83TEo5UVluOU5CMmhsaDhwVkdhMmRyb1RJdlJjSTZ2UmhJa29t?=
 =?utf-8?B?ZzFrMFNVa0l3Q2dKT09YYjk5QzdESjRtZjcrNVVYYUdBdVFXVHVWWDRwcE5D?=
 =?utf-8?B?RGVLTk1zeHZ4SHZtSy8yQkNBQ0Z2bFd4REFXNDlCVTY3Z2R1N0FuNnhnQmxk?=
 =?utf-8?B?eTFHNWlDbnFSMUZ2YXkrdW5CMEovd0N1QUs4TEltWG8rZStvZjQ4MTZFamhM?=
 =?utf-8?B?QW4rYzljQkZDZDdaVGZNRHJqUkV4dU5PNE1nR1FsSnZJS0R5L0k1MnFBbzhy?=
 =?utf-8?B?ejZxMndzcDZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 154e5c6a-8e4f-42c6-e661-08da10cf1d0e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 15:24:55.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iijR/znW1K83Bnz3YFbqHMuSSlm7H/UOWlQZjvgIuvM2Aif9eSx9NYKb4Sk1nVuIB9J9LT8zqUyOj1pOk/Rc+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3061
X-OriginatorOrg: citrix.com

On Mon, Mar 28, 2022 at 04:21:02PM +0200, Jan Beulich wrote:
> On 15.03.2022 15:18, Roger Pau Monne wrote:
> > +void amd_init_ssbd(const struct cpuinfo_x86 *c)
> > +{
> > +	if (cpu_has_ssb_no)
> > +		return;
> > +
> > +	if (cpu_has_amd_ssbd) {
> > +		/* Handled by common MSR_SPEC_CTRL logic */
> > +		return;
> > +	}
> > +
> > +	if (cpu_has_virt_ssbd) {
> > +		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
> > +		return;
> > +	}
> > +
> > +	if (!set_legacy_ssbd(c, opt_ssbd))
> > +	{
> 
> Nit: In this file the brace belongs on the earlier line and ...
> 
> >  		printk_once(XENLOG_ERR "No SSBD controls available\n");
> > +		if (amd_legacy_ssbd)
> > +			panic("CPU feature mismatch: no legacy SSBD\n");
> > +	}
> > +	else if ( c == &boot_cpu_data )
> 
> ... you want to omit the blanks immediately inside the parentheses here.

Ouch, yes.

> > +		amd_legacy_ssbd = true;
> > +}
> > +
> > +static struct ssbd_core {
> > +    spinlock_t lock;
> > +    unsigned int count;
> > +} *ssbd_core;
> > +static unsigned int __ro_after_init ssbd_max_cores;
> > +
> > +bool __init amd_setup_legacy_ssbd(void)
> > +{
> > +	unsigned int i;
> > +
> > +	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
> > +		return true;
> > +
> > +	/*
> > +	 * One could be forgiven for thinking that c->x86_max_cores is the
> > +	 * correct value to use here.
> > +	 *
> > +	 * However, that value is derived from the current configuration, and
> > +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> > +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> > +	 */
> > +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> > +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> > +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> > +	}
> > +	if (!ssbd_max_cores)
> > +		return false;
> > +
> > +	/* Max is two sockets for Fam17h hardware. */
> > +	ssbd_core = xzalloc_array(struct ssbd_core, ssbd_max_cores * 2);
> 
> If I'm not mistaken this literal 2, ...
> 
> > +	if (!ssbd_core)
> > +		return false;
> > +
> > +	for (i = 0; i < ssbd_max_cores * 2; i++) {
> 
> ... this one, and ...
> 
> > +		spin_lock_init(&ssbd_core[i].lock);
> > +		/* Record initial state, also applies to any hotplug CPU. */
> > +		if (opt_ssbd)
> > +			ssbd_core[i].count = boot_cpu_data.x86_num_siblings;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +void amd_set_legacy_ssbd(bool enable)
> > +{
> > +	const struct cpuinfo_x86 *c = &current_cpu_data;
> > +	struct ssbd_core *core;
> > +	unsigned long flags;
> > +
> > +	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
> > +		BUG_ON(!set_legacy_ssbd(c, enable));
> > +		return;
> > +	}
> > +
> > +	BUG_ON(c->phys_proc_id >= 2);
> 
> .. this one are all referring to the same thing. Please use a #define to
> make the connection obvious.

Indeed. That's the maximum number of sockets possible with that CPU
family (2).

> > @@ -677,14 +680,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >          if ( !cp->extd.virt_ssbd )
> >              goto gp_fault;
> >  
> > -        /*
> > -         * Only supports SSBD bit, the rest are ignored. Only modify the SSBD
> > -         * bit in case other bits are set.
> > -         */
> > -        if ( val & SPEC_CTRL_SSBD )
> > -            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
> > +        /* Only supports SSBD bit, the rest are ignored. */
> > +        if ( cpu_has_amd_ssbd )
> > +        {
> > +            /* Only modify the SSBD bit in case other bits are set. */
> 
> While more a comment on the earlier patch introducing this wording, it
> occurred to me only here that this is ambiguous: It can also be read as
> "Only modify the SSBD bit as long as other bits are set."

Hm, no, that's not what I meant. I meant to note that here we are
careful to only modify the SSBD bit of spec_ctrl, because other bits
might be used for other purposes. We can't do:

msrs->spec_ctrl.raw = SPEC_CTRL_SSBD;

But maybe this doesn't require a comment, as it seems to raise more
questions than answer?

> > +            if ( val & SPEC_CTRL_SSBD )
> > +                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
> > +            else
> > +                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> > +        }
> >          else
> > -            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> > +            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
> 
> I also think the comment applies equally to the "else" logic, so perhaps
> the comment would best remain as is (and merely be re-worded in the
> earlier patch)?

Sure, let's see if we can get consensus on a proper wording.

Thanks, Roger.

