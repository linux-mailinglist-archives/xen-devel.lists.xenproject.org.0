Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0E87CC34
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693809.1082403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5bc-0007Vl-UA; Fri, 15 Mar 2024 11:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693809.1082403; Fri, 15 Mar 2024 11:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5bc-0007UB-Ra; Fri, 15 Mar 2024 11:20:08 +0000
Received: by outflank-mailman (input) for mailman id 693809;
 Fri, 15 Mar 2024 11:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0HQ=KV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rl5ba-0007Nv-Sg
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:20:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f996eb03-e2bd-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 12:20:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CAD784EE073C;
 Fri, 15 Mar 2024 12:20:05 +0100 (CET)
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
X-Inumbo-ID: f996eb03-e2bd-11ee-afdd-a90da7624cb6
MIME-Version: 1.0
Date: Fri, 15 Mar 2024 12:20:05 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Maria Celeste
 Cesario <maria.celeste.cesario@bugseng.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012 Rule
 14.4
In-Reply-To: <ZfA1_pYQi-aKXH3A@macbook>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
 <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
 <ZfA1_pYQi-aKXH3A@macbook>
Message-ID: <acc151da8a42215bccfb2e5408fd8e9f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-03-12 12:01, Roger Pau Monné wrote:
> On Wed, Dec 13, 2023 at 05:10:50PM +0100, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>> 
>> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
>> headline states:
>> "The controlling expression of an if statement and the controlling
>> expression of an iteration-statement shall have essentially Boolean 
>> type".
>> 
>> Add comparisons to avoid using enum constants as controlling 
>> expressions
>> to comply with Rule 14.4.
> 
> If we really want to go this route, we also need to amend the comment
> in iommu_intremap definition, as it's no longer valid:
> 
> extern enum __packed iommu_intremap {
>    /*
>     * In order to allow traditional boolean uses of the iommu_intremap
>     * variable, the "off" value has to come first (yielding a value of 
> zero).
>     */
>    iommu_intremap_off,
> 
> We no longer allow traditional boolean uses of iommu_intremap.
> 
> Thanks, Roger.

Noted, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

