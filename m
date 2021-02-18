Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FC31EBDC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86698.162951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClcc-00017l-6G; Thu, 18 Feb 2021 15:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86698.162951; Thu, 18 Feb 2021 15:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lClcc-00017L-2d; Thu, 18 Feb 2021 15:53:42 +0000
Received: by outflank-mailman (input) for mailman id 86698;
 Thu, 18 Feb 2021 15:53:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lClca-00017F-PK
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:53:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e0192fe-5015-4943-a8f4-4809c78731e9;
 Thu, 18 Feb 2021 15:53:40 +0000 (UTC)
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
X-Inumbo-ID: 3e0192fe-5015-4943-a8f4-4809c78731e9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613663619;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3NFFt6nzc3+RcweZ/92bmGJ5t6EfgOUhE5axgD1CeVE=;
  b=JWqq8tKTFbClDVSvp4VTLMzAnXyh9yGcYIdvAfLJFczNBhM54hTbGfas
   RXUUhV2dKhinMah+ExKj1U8W8qLhzXGaJzD15xqUcM1EJjFEszkR3xoE9
   BlzXxCVFPDDMT3umFavKMCKwLsZzAegg7T9RYwWhsMhFXaCtjpV68NjOp
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FntlC+WxqKmqkLSwvnmCEbb72x4QGzoLFPCvPmEH1xUuBZsaQihcgJjDxWCxHLr9Z+fGkSuZFw
 0vA7ABCcHZalM5rVQLFD05PFUI2zLZ6Ikg9kEEYw+4Ph9A4ldTiVIqtdT/lBCGEfy20j73I8OP
 hgBzoCTKJ5ALO9tD8JNGsJkcHUiNDXG5HqoNZWGLMN7x92SjpSlcmzfvalP36QJXriyh6/kr6P
 cn9mFnk9O3Jtu+KVE5iS+DcapqnGthTHrFgxoeWD0Y9aEgtJlNI1k021b/EmTLFydZYJ9O8u2E
 bcQ=
X-SBRS: 5.2
X-MesageID: 37460161
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37460161"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmpR7lQ3oEAK3b+F83nevG3fyqFShiq4IKraSRYVVQYbj5Q7lPwYOTJ0GHV5FMLOJLIgVZh0PNmXvEc4cG4Qrzk6aZeo2tB3D9Lim9B6woZrSN4Qs+XnE80PbZzv5hH/s9Qa7yw3UTWWdQfviaGchFyzf0EvnZryt9Gz04fKHEeKJFZolDK+VkDVKOI2VxvcMTTRU2xI+DIf1jjkDzapLujil3Ijb5uwF1XAGKf3wZDmWpsM2KFfh7z2QODq5YJevxlD+ftcPsbqv4EJjtqyUGNhck8miWvE+k783SQaBlktrBRZx0+rDclTVT9llscGEVNFbWZXCyCEFzeU0yITDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z20XgBSmtQH9S2Bv/kNA51nmdRbVFUITvV+X3oM96Y4=;
 b=JqlsBEX13C/44ROoQqlC1Ynlu0vs8ao2KcYeEzP25fU7MorMcYjLKQp/LXTzi/7In1Px53MvwdVq0MHYsDXlU4UOrYqCRh5AM1kGKN4o4L93DQRW1DbwWdLu01lRllEhbIIYGTuo8JZfB42IWJnPXPAKIY2H5Km0g5ke2G9cGsj5DM3Av3c4xnsq9KZkSzvQTFtzY61IZKK9rzkBaKuoU/SPMlmIU1pDf/GE9KWEJ/4aN0v7LpJ9rHa95vhFq9hatyew20gxXAHDz3v/WbaFZ3hak9GvpRtn/ofkmRakB0S1JoVQmQagYne78u7tI5cVKnFSTKqMw5uZDFpLKxdbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z20XgBSmtQH9S2Bv/kNA51nmdRbVFUITvV+X3oM96Y4=;
 b=o6S7cP5nb/1CmShBBSkFHNlNhwmYFJff+uHvsw0Lg0v3gzySaxTFHM5Zx5W6YdNBj5W5R+COFSk6m1TIYE65/cTVQamA23Ejx/6TI7tVocTRQlkvrcZtaDUd2XGDvo5TOuxXza6+CqIPFFoWqgs3g0uRMQCPUPSVT/vFCX5pZSk=
Date: Thu, 18 Feb 2021 16:53:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
Message-ID: <YC6Ne2ZEg5alzRk2@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <YC5OYZOAkx+jutJz@Air-de-Roger>
 <785a4925-31f2-9df1-a4b3-1760ad17e01e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <785a4925-31f2-9df1-a4b3-1760ad17e01e@suse.com>
X-ClientProxiedBy: PR3P189CA0049.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45a25cfe-488f-4309-b441-08d8d42559c7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3577B4F2841BF72470B6704A8F859@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AZUepPXZzoOcNBIOBPm58PuQMMAOqnRV2o4AuHbiHLIz13toTz7EmR7DA71XQv/tuMAMVISOMHD7AXDfcXT4G0Sm+OVdPnw6ko3deo2iZk0mDpwCKW4rw0Uv+mwkXVF/Bm5gngLjFAxsgSjT2vz+elvhSUAGeag8zeLcxQS5UyC2Tz9rkRCRQkfmU7ypcqFlWqeGjeUnGrez9GEcKOu3uR24E25F0KACuOjDlbN/U3bxut1E/SZVG5q5Ncx6Qx5BmzJbowX0qvaKRjaKlbHA7N14AZ36Og+Y1DOlOHTu9NbziRbukTwhr26J+cHt3cPX3RWNrNCIOOjmYcOvVD3gvPGk7s0RNxL+nVxrgmGEUnlQ3prwKtZ011ulItHVucHUK44noLWLGjBVMLFLnDVJowB1nHNJxAu/cKpjEHkYUNJALZqK7t9ML770379FYC+IksjncyejcCY7nM81M2LoDVptPPrmQao9ZwcIDpp/M+Bmx9fA6LrRmxmbdzezvBm71zp1oCa3greH0gMdMZ1jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(186003)(66476007)(66946007)(2906002)(85182001)(478600001)(66556008)(4326008)(6496006)(316002)(9686003)(5660300002)(6916009)(53546011)(6486002)(26005)(83380400001)(956004)(16526019)(33716001)(86362001)(6666004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXZ3N05ieDZpVzdxeDh3MDJwaVV5aW1zU3ZSSTkrNG5MU0U5WHVnd09IcnpG?=
 =?utf-8?B?T0hOeDR4dWdLNTArbmVOcjd0RVA3c005UTRqbEFadmNobkZxMmQ1RDFMS1R2?=
 =?utf-8?B?MDROOXlVZk5nOE03MmJYRllxbk83VXIzZml2K25vd1VhZ29aVkVwOFhDcTlT?=
 =?utf-8?B?UjlkTXlrYjRDUUI1YVZVa0w3RGVlZERXNURWRzBrYlRXOWZ2a0lUNFZXYWxy?=
 =?utf-8?B?Vkg1V1JiQzhRMzZmVGdXd2ErcnBrUXc2UHlvYTg0WDI0RzJycXJsK010VGlW?=
 =?utf-8?B?VGhtN09iK3UxbVZWaE1QYjRXdExKMHVRVUhZS0w4YU5XNGNzTERqWE5ITnF1?=
 =?utf-8?B?cUx0cUFjdEkzVXFSYWNUSmpRampKTml5NE9CbHJrYXQxeXlMOXU3ZWVodHor?=
 =?utf-8?B?SjUzeHNBWEticFY2ZUlhVW5DS1gva2R6c3BXc1NBRzR1K3d0emQwbWtFWlVQ?=
 =?utf-8?B?MHJJMktWdmp1WWdtZnZURWI5d3c0L2g5MGt6UnprV0paOFR6NnFzcjg1QUVV?=
 =?utf-8?B?ZHVuTWpRdmM2bC84QU1CcTZkYTF5QVlzc2RITUFpRnM4T2YyUHF4ZW9yMXRS?=
 =?utf-8?B?eldpYXJmUkZrTjlScGx5MGxYV3k2V1A4a0lmVUZ1WnNmeXBNMUdnWExxSkpX?=
 =?utf-8?B?U1BpcFJsUDNoRUtxVnB2VUJTbGwxRFpkeTRsNTRSNWVBRWYyN0hRM2dROTRy?=
 =?utf-8?B?WnJpUVhIOC9ZQXNQWWN5NlE1MThSdW1RNWRDSVpKM3JQVVMzWFRZbzJpS1c1?=
 =?utf-8?B?SFplaWtiRlFOR2lzUkRvdUVNVmdKTnhCd0Z5Qis2ODFnTTZTMS8yaS9ySmVF?=
 =?utf-8?B?d0lPazQ5YURUa1pZZnJXdHpOeDh0VmRBVmw1WHFmdXNMV0pSUWE2MDJCNUZQ?=
 =?utf-8?B?RnB6K3MyT1hpaXdUNEZkZXozSHNHUkU2RXdjTnNrVURWVTI0ejNHTzZPTHBO?=
 =?utf-8?B?TlNMeEc4L0tTOEk0N25RbndkcDU3ZTMxRE85aWlTdFVDNForL2NTKzV5cUh3?=
 =?utf-8?B?Tm5CUThhL0JzcldDSVFxM0R3Qjl3ZjByK3lKMVFTMmNlcnNlSUczRlljclB4?=
 =?utf-8?B?UXl2VW1pb1JVTGlaUG93NkhKamhKVlB4M2VlZzFoOWRmVGdERUFmUnJLdmZm?=
 =?utf-8?B?bmpJRnRpckpIaEhFeEZCSGVrMmdUWE5QSEZDdWYyQm1RWFVyUjN6NlQwNlZv?=
 =?utf-8?B?V1RZdzYrMFF3bCt3TUJXTk4xdGtvOGc2U0YxNW1JT0RMaXVWdU54WFJqdGJG?=
 =?utf-8?B?cmlBbURxS1J2aDZKYlFaRzhRM1d4VWh2eGRJSDJhSHBFT2g0Z1l0Rm8vOWsy?=
 =?utf-8?B?MWpGVmdLWUJtK3U5TkQ5K1FnbUJmc2szc1J1cGRES0FIbnlvQkRYRHJDaDFy?=
 =?utf-8?B?TUltU1VvMnIyTkFjaEdvV1ZXQmVzNkVxR1RldjRuYUkrNHRLZS9hRGFYN0R1?=
 =?utf-8?B?SDdsaU1SbUdyY25zRm40bE9zNzhSV244cjd0UHUzWTdxUDJHV0hIZEtWdC9D?=
 =?utf-8?B?bzVuczZXVk9MRnBGbHk1cGI1aXlyZkhCZFlDNXJJVUpwRlVsTnFIKytjWk5h?=
 =?utf-8?B?dFJOT3YrcW0rbW5sWFpPbjBqNTlDekpiRHR5MDA0RXptbmxkNUFBTXREMEhE?=
 =?utf-8?B?VExEN3p1b2NWcDluVlJOTkhaSHBQVmhuSno2WkxCOXFyb1A5MHN0UFRJWjJR?=
 =?utf-8?B?Zm1FSkJDSW1rUW80UU1tQ0lPdWNLQnowbUR6dkNjeE1DeVF3WmNKb2NiUWJx?=
 =?utf-8?B?QVdLMVdCdWJjWjFpZGxZaXRhV2c3S3JGZ3ZGSTlEZU1XNU9RSW1FSjZKMjk0?=
 =?utf-8?B?L0N6UUtTYXVvTENreHFNZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a25cfe-488f-4309-b441-08d8d42559c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 15:53:36.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN9bCbUgt+G0tGPr85C7I8O0N4cY99sJVYjx31k+zT2H4frmk5mmUurhXX7A2j+8Rxik2Qzek7hDnLyM8Uj3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

On Thu, Feb 18, 2021 at 12:57:13PM +0100, Jan Beulich wrote:
> On 18.02.2021 12:24, Roger Pau Monné wrote:
> > On Wed, Jan 20, 2021 at 05:49:11PM -0500, Boris Ostrovsky wrote:
> >> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >> @@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >>              break;
> >>          }
> >>  
> >> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
> >> -        goto gp_fault;
> >> +        if ( guest_unhandled_msr(curr, msr, msr_content, false, true) )
> >> +            goto gp_fault;
> >>      }
> >>  
> >>  done:
> >> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >>               is_last_branch_msr(msr) )
> >>              break;
> >>  
> >> -        gdprintk(XENLOG_WARNING,
> >> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> >> -                 msr, msr_content);
> >> -        goto gp_fault;
> >> +        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
> >> +            goto gp_fault;
> >>      }
> > 
> > I think this could be done in hvm_msr_read_intercept instead of having
> > to call guest_unhandled_msr from each vendor specific handler?
> > 
> > Oh, I see, that's likely done to differentiate between guest MSR
> > accesses and emulator ones? I'm not sure we really need to make a
> > difference between guests MSR accesses and emulator ones, surely in
> > the past they would be treated equally?
> 
> We did discuss this before. Even if they were treated the same in
> the past, that's not correct, and hence we shouldn't suppress the
> distinction going forward. A guest explicitly asking to access an
> MSR (via RDMSR/WRMSR) is entirely different from the emulator
> perhaps just probing an MSR, falling back to some default behavior
> if it's unavailable.

Ack, then placing the calls to guest_unhandled_msr in vendor code
seems like the best option.

Thanks, Roger.

