Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9E698E57
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 09:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496394.767113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZMY-0001KJ-4b; Thu, 16 Feb 2023 08:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496394.767113; Thu, 16 Feb 2023 08:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZMY-0001H8-1s; Thu, 16 Feb 2023 08:11:30 +0000
Received: by outflank-mailman (input) for mailman id 496394;
 Thu, 16 Feb 2023 08:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSZMW-0001H2-PV
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 08:11:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8285f098-add1-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 09:11:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 08:11:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 08:11:24 +0000
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
X-Inumbo-ID: 8285f098-add1-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGpU4pi/d1hRWtFjYwmOo4OFyiPe6KvTEJZ1qdspZqAvm1wcSJdFrOC2qx8Zn1fbLGyL3ZTXgWts+lTu/qdn9M01/T1bwJgmuaYO25A9IxuzEPfIXZ4T8E+yl7DIw662fX+4iv4nAWf7FD9WAtyg9FwCel5z9nxjGxEWIRDeTcEs7gl4Qx5HFsjnIWTCDH7l/xmgxUAKMR9pTsZCQaZkEzPLrL3pUag0GmvMNocNgGfqZ67U2W9gC7ZDdS99jPObMP10S5GyksHiqU00UdE9j+ORTK9YXl9HNPpldBxrFoSC7EoQhfmPl+z33BzAl3nPvg65SHIIciMah/WxRzKDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yXqgqX4yIGOYHYwEaB9Le7yDcnV8ZNjBxa1s0lOlJY=;
 b=Xii9d0Ht8lcNgzmezXkFDTOumPF2weVgKmyqXrK+PDFrenp2zLWkkVOGsFGviuws7I4Ibp8TluquNjVRLem6n1iymkx+i/3FkRe5wfUUPXLIt8RLRyRZaDrO6fsJr0xvU1yh89d7ZRct5DLSXW/G7GS7gSZPBWgGMDVyM9M8OfzVD8IZ46INfm3+Bt7gZCM/54ZEbyISSc4gMKbh2SfaORNmrelkXGUBAH45rkcswsVggJ7MPbciPNrq+dXYdtWotRWMb0FfmO48nB2jGgReLmiuYISDATQG4S2lrl3ibx+xr6q/awYv5TMmiR9jV8uq3M2pSxBXxBrFEdFJ4J9KlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yXqgqX4yIGOYHYwEaB9Le7yDcnV8ZNjBxa1s0lOlJY=;
 b=ikH0bsBrUZRi1f87jmKMam8yfyKLmb5E3aFkYBD3n67wC1vVP0nmqPLL6wr6fiGwmlGkhPexE2eVx+q2AU2nyFWamPhLUmZFMxV7KyCAkIdHl5KkEuWfU+ZF7v5fOfFGTLBcbp4NRrL/K3XtnNeMqRO+7+XVhSZgq6U18Q91KHq64UaMGx694RCSGFRbpTK5e1A9AR4mtucCwAStNFikMSZIFhG6BF/6XPnn29BrWyTawqCFyuS35To6ApGfsFURtzXqqkuH1SDlSXEQdlcFoezTrSz8ySsTdjaMj9qby3yE3s7J/lqUhjqMghmhzzI5biJeAtInS4f9xoaq+PtwFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12b26fbf-922d-3289-121f-f570365b1d9f@suse.com>
Date: Thu, 16 Feb 2023 09:11:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [XEN PATCH] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230215152111.51218-1-anthony.perard@citrix.com>
 <b105cc38-315a-f3f5-0f8e-f3501d31a76c@suse.com> <Y+0ZZb9VYOsyeaUj@l14>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+0ZZb9VYOsyeaUj@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2747de8f-7270-4c67-d7c3-08db0ff564f3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lRjPDSYmGNMBdZkMSk79Cufh2C3eaHj3bbIKF2PftyawI5dwacEdGGqU2BdW+TSuTuEzbDk0baD1XaFpXV8clMIU7BaTDVi/52LgXSPS5opygF3StQQCIrELIiEPWJpptmjVJjYsJwjdY12wF8Mo6cccQDMjtmwy7uK4nVPBegOPOwMb1WwhlAiMGAGkTsmKkU8utYWMgDM3AgvHkGJWL1nTm0S2KClmmJDis9xXWEAwTUlW4ABJUF34+yIW/w1/WaQeUgW1DDQz0bib3gQSX4w8diF8WBWLxuH8P8aR2+dNuM8yacOMuYT4gPv9d7f755iQfXIUB61wl/AAGftn/oywFl4hMQSsr7Xyovqx2F8k7YdLNfhSL7FI3DTcT70f+Ol/6CQP/CkJgvDatcTjhLZIlF4Uapc5SCVamP3HIyNPYvv4lkW+ZeQsCJm+jWKhiHOf6Dyvq+bs4OYBG6eg2cdVXv4aCtE27CMh1vGy3BBd03tuLjncgeLyfaFCKInyMLIYT51zz+qc3XhlUUrJH+YkCA+rkoh4oqJPJvlOdI3qenwchFBQDjx/qYpz7JDJpmBvqWngA2BvxPh9Bjf+aTdXEpjtA+Dd2csfeW2G4uEsalKAlG80Ysp9wbaY7CTMlI5/LO/+3PXhmgKzwYDeAbxRrBaNJfoyJVoQKQGOUyvDkEeM9b5a1pcg+BlUBxw5Tpr/p5bJ72KQMpE/9ujLAreJ0YlaRbW42YpOAZSjhTk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(316002)(66946007)(53546011)(66556008)(41300700001)(66476007)(66899018)(6506007)(186003)(26005)(6512007)(31686004)(8676002)(6916009)(5660300002)(8936002)(54906003)(4326008)(6666004)(478600001)(6486002)(36756003)(2616005)(31696002)(2906002)(86362001)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVAyVm9IMEtuOGlsYUFqZUtRblpZT0Q4M3paaVYzR05IZGt1VXJwTWVHSzlk?=
 =?utf-8?B?Y25CUFJQMmQ3V3R4b3EwZVl6ZGpFNS9vYnovdWMwMFRMT2IrSEFqSXJzTUdX?=
 =?utf-8?B?Qzc1V1dsQXR3a3dxZ09VaXhpT01DQWFPKy83TlhPeUdTbEN3NTlvZWc3RXlx?=
 =?utf-8?B?ZTNUUzNuVmNER1dKMkltU0pCblRPc3F3NDgyTkZzQWhQdDJUSE1qbFNodE1a?=
 =?utf-8?B?YU51WGRmNjEyUXludTBKK3VMUHFVUTBHamVvUEVMWDhvblNhcVBOS1QvYUtN?=
 =?utf-8?B?Tnc3dUJZYlZZT2FacCtxK2QrNEE2NlByNFREL2trTUdmZ3VaVDBsakt0Yjhs?=
 =?utf-8?B?NUFQNjd0S0tHOXpYdDdGQngwcldYTEg3aFByZ1AvRG5jdXFEdUQwdk80bGxH?=
 =?utf-8?B?VEZ5cUQrcTJ1alg0NUtJeUlneHFzNVdLeExiWFBnNklEaHR5cWFtVXQwUTJw?=
 =?utf-8?B?UFVUSG9oUVBaaENhbktZbUNxWU9jYnJ3SGgyRHd2MTdrR0prYk44cmNETmdj?=
 =?utf-8?B?Z0RpbmwrcW5OMlhmaWZvREF3bUo1OEt5K2hLV1cvNjVaRytwTHRDYmVpaEVk?=
 =?utf-8?B?TTNTSWFTa3duZURZd01CRGZPK09PRGlJSE5zeHpZTkVZOVgvSU1XSVZpY0p1?=
 =?utf-8?B?NUtBOUltcVhVQ011dk84dzFYVVVqbi9vV3gyVEVQN3h6ays5ck1wWStPTC9V?=
 =?utf-8?B?RTNES3RMWHh5YUxXSndLeHZvLy9pSUpHOHlFeGZoRkJaTVk4TkJnNitEWG9i?=
 =?utf-8?B?SW9TZEZ0UCtQNmNoS3lDNzRrQm91dFdHdjM3Z1U2cjQwWG5yVzFEZzJhZ2RO?=
 =?utf-8?B?ZWZxTXJNY1BTZktHRkxPTDhuUGpjRE1LSk9VcFJsM01NY3JIQVdtdzhwUmt3?=
 =?utf-8?B?VFI4OC9qYnFPMVJwZ091M1BYb1dNLzAxb1B5cTlmWFpCMVJjMmJTbGV2bnIw?=
 =?utf-8?B?SWd0VmlPbTYxYlIzUkFVaWdwc1k3RFhwMVdqV2J0STVjMWVyaWtIZU5tajhQ?=
 =?utf-8?B?WExGTDQxQmRsR3phTVVOVVF2cGdhRTNHb0VrRWVKMXI4eXBiVXZoRUZ2bTRy?=
 =?utf-8?B?REVKZ3BoNXNMN2krcGtmSlFDcWxkeHkwKzQ3bk9QS05vMFpCdHY5NEsvanVv?=
 =?utf-8?B?ZEl1S21HakpFcE9HUDBzRlMxLyt2NlFiSjc2OWVVR0oxdUFFODBGV0U3Vmw5?=
 =?utf-8?B?QzFDamErSkFMMXpKVGlsYUdUYlFpRlh0dFBxRDhiM1I1eFFpcUhzcDNVRHVW?=
 =?utf-8?B?WmxDODhpSVREUzZqVGdqcE9NMWN0cGNSdHF6ZWJrWkRiSzhRSFJHdXU1czZG?=
 =?utf-8?B?SGE5bzNiUXl0bnAxa3BSVWhZQTBBQlhsSklPWlRDRWQ2dzRiTng0MGZXZVRa?=
 =?utf-8?B?c0p1amFzWGtGTkJIRmUvLzRuZ3B3Z05Pb0owUXVpdXd6SGp4NllqV25MVmYy?=
 =?utf-8?B?WDRHVHB2czUrWXhNeE1ienQzV0h0d2dMMWNjNGZpYk9YV2J3TFE1dEJORno3?=
 =?utf-8?B?QlkyenlCK0dFaVRMTXhxc01IYjFjSFZZb2d2TGtUanliYWRUcVVFMWtWR2c5?=
 =?utf-8?B?V0pyOVJBdFpYNVhBcmpRLzBZa3RIWXdYZ1VpbUk1SFNDTUllMkhJSStDQTls?=
 =?utf-8?B?KzRwL0NtOFhSdXM4REE1aTEydFFqSmdVUmRTanp4N2hqZlJLc1dWQUFQaE5p?=
 =?utf-8?B?L0VBb3M5VHRDckpHK0JyRkYvTFNGRlo3dWFWRTZpOHBZVU8xTW8vU3JMMkRM?=
 =?utf-8?B?aFZUaFZKRXFYS2RxQTZoUCtocXkrTWZoc1V3djd1TmJTdFQ0Ym0yS1kyL1g1?=
 =?utf-8?B?S0ZJV3VjcEZGRzFzR1l5TEF1aktURVp6NnFzN0o4dTl4aEwxM3haSWxWRlpV?=
 =?utf-8?B?ZVl4YllNSys3VnlIU01rUDMxaGhsSFFtYThrY1B3bWkxN2dHNi9vWWNGNjJn?=
 =?utf-8?B?L2VzdDRDd3dyNnFsSWdPSTYyUDYwQ29kMmZFclBWWGg0RkxCWEFhZTBIME9s?=
 =?utf-8?B?Mlg1MkJhd3U5bUhENnN6Nk1lTHI5WFNNWk1TQ3ltZTRRVkJpeElZQzdpQXhE?=
 =?utf-8?B?Y054V0Vha2drV2UxYmR2RllTSlArNk83NWhuMFloUlNJUWN5dnZoYTBCR1BY?=
 =?utf-8?Q?6DwFvW2ix+2B/PPqdodjBlg7V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2747de8f-7270-4c67-d7c3-08db0ff564f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 08:11:23.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8svDhPx4C6wO/bv+ios2WMdnSj/mahtZ3NyckYFnSNs63JbC8t6l5w/wKZg+N+UT4dKafi1YRlAcrCQlC0Rs8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030

On 15.02.2023 18:41, Anthony PERARD wrote:
> On Wed, Feb 15, 2023 at 04:30:43PM +0100, Jan Beulich wrote:
>> On 15.02.2023 16:21, Anthony PERARD wrote:
>>> @@ -13,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>>>  endif
>>>  MINOR ?= 0
>>>  
>>> +ifeq ($(origin version-script), undefined)
>>> +version-script := libxen$(LIBNAME).map.tmp
>>> +endif
>>
>> Such a use of $(origin ...) is pretty fragile. Maybe better use ?= ?
> 
> I'm not sure why I used $(origin), I've written that more than 6 month
> ago, but this way of using it is actually described in the manual, when
> documenting ?= but with a = instead of := .
> So, maybe I wanted to have ?= but with immediate evaluation rather than
> deferred. Maybe I had issue with $(version-script) evaluating to
> different values.

What's wrong with using deferred evaluation for this macro? $(LIBNAME) (and
$(LIB_FILE_NAME)) don't vary over time, do they? Plus ...

>>>  lib$(LIB_FILE_NAME).a: $(OBJS-y)
>>
>> Seeing this right adjacent in context - any reason you use libxen$(LIBNAME)
>> and not the same lib$(LIB_FILE_NAME) for the base file name?
> 
> That was the name used before, I guess it would be fine to rename. I
> just need to set $(version-script) later as $(LIB_FILE_NAME) would not
> be defined yet.

... you'd likely deal with that issue as well, unless there's a "too early"
use of $(version-script) somewhere.

Jan

