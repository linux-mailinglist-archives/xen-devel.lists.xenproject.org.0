Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E42EF492
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63615.112908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtQU-00034X-1P; Fri, 08 Jan 2021 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63615.112908; Fri, 08 Jan 2021 15:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtQT-000348-UD; Fri, 08 Jan 2021 15:11:41 +0000
Received: by outflank-mailman (input) for mailman id 63615;
 Fri, 08 Jan 2021 15:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxtQS-000343-IG
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:11:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2c10307-6e9a-49ad-b293-bbf582325dbf;
 Fri, 08 Jan 2021 15:11:39 +0000 (UTC)
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
X-Inumbo-ID: e2c10307-6e9a-49ad-b293-bbf582325dbf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610118699;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=86mz/2t+35ODUGeaFGdx4IO/2VmxxNP3nb+XbotB7cw=;
  b=gXzKWZbksC+A8Kg9gpM4uKNmPFBKlJMSMSI5VKJAbIy37AC5guZnlgnO
   vHkTmqHB8MnoBrahrH932nQQUapoxkCn8il9IsTMli6L1eGuanN6DZzgh
   lnhtXj013Mv/lnb801IQSsy1GXElrMXCeAisTSpl3GLCo1VJ/RY+9lFXw
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6KRGf6fQfcTpLhxi8sxknETLHQMa77zL+B9lX76KevOYfZ9VcSMRrgD53kUGRRcldUpGXIhooz
 78LoKNiBqd11+eEulVJE3+G0PbhrhXemauUiu9oKWaDrj7r9De1d67s4gPXjcM0o0xRnI1MAHI
 wqMfswaemvQakdRFzF/7xJS5sl3dBu/l76vv6kxQCauyHtTpCICqDdZijVmlMhmdufy79RsUju
 GIVZBfB53sA9kagqRlb7Sthg6qdwXX5wGASJ5g1gBh8jqyjJj+vS1UUi9gPWrGJ03wd8tGpbiY
 /EI=
X-SBRS: 5.2
X-MesageID: 34701199
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="34701199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDG1Zv8hsn/NSzPrKVmMOHBWrPQMbglEYYMeD+wWH75gclNHdF9++61IdVYBG1AjEBcYYTGnQaUXRBUqtPQtFnjeJXLeDz1Oj3axmd+352I2lV9NNWoYA+mLuIKuVGvstaxzNZgWXU10zuqEHoVes13Dc8it3uO+X2uWxW+0NwKgSyDr4X/kfbhIvQTuuYUHj8fqbjWcsek339mcu7y9mkK5IGBq9Dt4KQJP7BsYJc4AKRSDTHWnvM16D2+/2tHd1n0C5RiwruJA/rpkvc16UDymG1jcQJSb1XEGAJlIuqO1XEeNsMSJDbJbdWEQABPuJrEZ580iXSklW7n0SC7mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg8k+cQbJ9xk+PBFxSqw538V6lWlpCSoNTKIOsRlFHU=;
 b=h4WDnNSsQ2BnqerLQb8mtRm8tF7dWaeNnsHijxYtOJZXM+6FjGEO7z2iAvEzB3QaSpzZaI3WQ5eVDMOKE6UiXWiCgpypFFfFhW6kmZXgDzlaB5x1/ltkzHXJsX5fhA4Gevhs47q0z+XNjAztF220wErphdT72KQtOJizrp6pwePLwRo7kf6YtIo5ajVn5KUMND9haHOoU2ZC+c4SD1+kte5EKIKjb1fcXVp4b9XV39DLyDBSIp8wGqLGKwbXx2zC6ijiruAwh8HxJe+QjNtJlS63mgKi/TxF+T8DuytfD95HA0qoS9RMwlAjJ3bzV08zWFRISNXp0IFCvHa5YCKVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg8k+cQbJ9xk+PBFxSqw538V6lWlpCSoNTKIOsRlFHU=;
 b=TtR0tCQ56iWrUAKduKTGR6Z/9Oi0IRzf0K0dTtgbhK0IPFHtBllxqtMh9v9fuNmgPcFpcjRruKI3eEqcxx/WmrAhyAbQJ7Y6g87yX5dIpF01x54kWNRqJAvD18y7790vw9ayWYxTAa2AjYUXgBG0DUx7m65mHqLi962YKXV0QwQ=
Date: Fri, 8 Jan 2021 16:11:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hypercall: fix gnttab hypercall args conditional
 build on pvshim
Message-ID: <20210108151127.k5esycwouj2k57kx@Air-de-Roger>
References: <20210108144123.58546-1-roger.pau@citrix.com>
 <26f9456f-6741-1bc0-053c-9cb4733515e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26f9456f-6741-1bc0-053c-9cb4733515e5@suse.com>
X-ClientProxiedBy: ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f84036c4-fd6c-4389-cd13-08d8b3e7b012
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525A88E7BEC1971C734CB9A8FAE0@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9ZOsHSsjVitXbOoICC55gHZWFatTFZcmTRE/kTFFKBWgyKMHFJ3V3gVKjTUkHhYz5LxD/J9Ldj1L2pe40uAMqovpN9026AvJ30uKay/EYlVNn7dqklCqRIGx2r0nMTDraWBepfFcAyv8Kdhb23BtCi/3eNBkGLLjW6X2UIOrekSbraYTI0FRZtt1VGuor+1tWzGfKt/lych8CxN+nX82VX/o4hWrmqvHjJ8HAzd17EB/go0LS53+4sSlbo6LgqV1NoFoeBiunmF/G4wEpc2+J88aj5cFG69cmWHcMOCYGA72ofdkln6XuE+WMy9d5+X1EQUm8AfICth9fJTs9vZtZyRwsHsbS/4PGFi7nnc8vhv7iZ2gfQiDjhBihprym8q2+ByHiAhb1xo39of7BJ/tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(86362001)(6916009)(8936002)(33716001)(6666004)(6496006)(1076003)(956004)(316002)(5660300002)(8676002)(4326008)(54906003)(66946007)(6486002)(66476007)(9686003)(2906002)(16526019)(53546011)(85182001)(478600001)(66556008)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFRpVDNZR3lIZXd1TnY0bmlZMFcremdIZ1J6S3g1WUZvYnlpcHN3ejJLMWRK?=
 =?utf-8?B?ekRnZmNxV0NQWHJyNUs0QlZMeVpYRzNqOHNpOFprdkxTU3VhTTFLZ2hiK0ta?=
 =?utf-8?B?TmFQa1JWc25CZ2tUeVk0VjFmQ0ZCWTlvMWs1VS9vd09WeFFVeVFhTzQ0WHBv?=
 =?utf-8?B?UGV5T2JrNGg4RStJdFo0YWljM2FxcHJsYXovR1lQZHNaT2ZMcG9FbmRzWVB6?=
 =?utf-8?B?aSs3TVF1ZUFPODhoZ0NzK3ZUQ1F2TWhMMTcwblA2QzFIeEdCa3M4bTRmQ2c0?=
 =?utf-8?B?UmYzL2piU3ZkYnlpMFhUaWU0WUJKRWQzNmVTZ1prTnIxbUkwMnR2bEV2K21N?=
 =?utf-8?B?TXRyUnZZRFVtTjNXd3RyTnVpWXd3WE5MWXN4cXloTFAvSmhnV1VlRXJ0aXNi?=
 =?utf-8?B?Q1NuL1VqVXVIUTVtdXhSYjBYUS94cUFvT3ByUFEvV0xXbDN1THlHS2VLcUhy?=
 =?utf-8?B?aytscTRlaVUxeEt3OTF0ZmlMZzVSNzRvSjZLc29vUVhySnN0aXNNcXpCY3JH?=
 =?utf-8?B?cEprcGdVd2JBTGxnS1B5ODhMR2hjVTVGYUhhNkFuZW1iV0JqUjVOM0RXQ3Qr?=
 =?utf-8?B?TWpEZFlRZXFoaG5VemtST2xXSzZQbFloenNtUktMWi9sTW4vaVBUeDQ2NUVT?=
 =?utf-8?B?Q3hIV3Z4V1NML2lUOWRMajdMMHh6NXlGcHdyVVhBNFpqR1gyem5Kd1hDbWJs?=
 =?utf-8?B?bXFTcDZwVi9kTmJseER4SXJocHRZS0UwRTNsTVdpdFY2WFMxMFhkY0FvWlVE?=
 =?utf-8?B?MEZGQzQxOGJidG1ZWUVndDVyNGJES1hzeWhtOWRyakZERXJnaVdkOU1Dck9C?=
 =?utf-8?B?TmwwZm9uVjFCQjl3TU9ZWkcwN0FLWkNqQVgzZnhiMDFSc0MxVWoxOFEwOUpY?=
 =?utf-8?B?aG9TYTJnZTd3dUpPZG9QK1NZaElKRnlSUDJLdm1aQ1FQRngreXBEQVdTZlhv?=
 =?utf-8?B?ZzRyZnhnb1BGQUo1YWdnVjRneC9FL1VRTHdVU243b1VxdTJrMkZISVFqOWZ2?=
 =?utf-8?B?WFU2cnRXVE51ejRJeWZQdUg1Mkp5TGhrN3pLZ0g3NTdoZy9SY2p4NDh3TzE4?=
 =?utf-8?B?ZHpiY2srS0tFMkRaMk9KNjZzODBFSXc0VkVBWklaWlI0cHNBOFA4aTcwL1pv?=
 =?utf-8?B?UW1Cc1hXanphd1Qyb3BvazJYQkZabGh6TUpPcjFSaXhtTXBLM3V1NVZSRnFS?=
 =?utf-8?B?OUM1KzNmaWxPc2NNNmZMakZESW1QNWJ6azNNaVZ2NkNWejhFdGlrSFZZQ21F?=
 =?utf-8?B?U25DNGNnZXJFOXNDYWhCZS9SaWVtT1BUR003UldDODFGRk5CMnovSVJGRlpu?=
 =?utf-8?Q?z5lgCL/btFkvF6P+GIT94hEOreznhyeJTW?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 15:11:34.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f84036c4-fd6c-4389-cd13-08d8b3e7b012
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq11bXpx091rHVISvDqRrrWvRnUqg30Ubt0s0eitHm90Sh5/KapJ2ui4UsIVHvZqxMd1vuUTCYmcIGIFpKmG4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Fri, Jan 08, 2021 at 04:01:52PM +0100, Jan Beulich wrote:
> On 08.01.2021 15:41, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hypercall.c
> > +++ b/xen/arch/x86/hypercall.c
> > @@ -47,7 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
> >      ARGS(xen_version, 2),
> >      ARGS(console_io, 3),
> >      ARGS(physdev_op_compat, 1),
> > -#ifdef CONFIG_GRANT_TABLE
> > +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
> >      ARGS(grant_table_op, 3),
> >  #endif
> >      ARGS(vm_assist, 2),
> 
> This is correct when a shim-enabled build runs as shim, but
> not when it runs as normal hypervisor. Just like the hypercall
> handler gets patched into the hypercall table (in
> pv_shim_setup_dom()), the argument count will also want
> updating there, I think.

Having the argument count set when the hypercall handler is NULL is
fine, as Xen won't get into processing hypercall_args_table if the
handler is NULL. While it's true that can be fixed at run time in the
same way that we patch the handler it seems more cumbersome, that's
why I went for this IMO simpler fix.

Thanks, Roger.

