Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B13314FCA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83236.154384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SkT-0000x7-H8; Tue, 09 Feb 2021 13:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83236.154384; Tue, 09 Feb 2021 13:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SkT-0000wi-Dv; Tue, 09 Feb 2021 13:08:09 +0000
Received: by outflank-mailman (input) for mailman id 83236;
 Tue, 09 Feb 2021 13:08:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9SkR-0000wd-Oa
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:08:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a9cba1f-80ea-4359-8e9c-a0cc52912175;
 Tue, 09 Feb 2021 13:08:06 +0000 (UTC)
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
X-Inumbo-ID: 9a9cba1f-80ea-4359-8e9c-a0cc52912175
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612876086;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vQpef0QdBfkairhatvK4xR4ldSyHqiim2peurgDoeIY=;
  b=D9iUiej96UbWzhHJqtDSMPGXgH6AGc7FzCEamBxPaYo978bNNktMQsNq
   gASx93FdjPtHxHZuGkPBk0/OqI5fF+8P7zmMPzszeWDxlsFCd+SoIKu3S
   FV3ZU563mJxH6sMFM3JnoBdInJRY0ikIbvbpdTIpWZ2drbS9EPpFf4FY+
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wr6s/gR6zUAVhVe1bXo7R05s2lXo99PNjpLUZZyABs0ThrvrBDgYRCXRsYHE7HczKh86Ba88Gg
 LursSQgwYIZUw6oD3jN18zuS1hEei1jaWbQ35GGnjS5eAMhBh4s12IB8vDyAAhRAwx5b39Z49r
 3ELcfrdqrzblMC9y+95rNj5OVYmRfhgiqBXWyeFR6g1djrbUi/MPDCMrWrxNOLaIgCnLNUQsqG
 pVXZAh/dLIFuLNpSkrsmtUtb5GvVnxw/BpM6zKfmOSniQW9WKwnhN970kynoZPuw9+K7cPI88u
 +CA=
X-SBRS: 5.2
X-MesageID: 37051619
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,164,1610427600"; 
   d="scan'208";a="37051619"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeSAhYFQsoNTNd3p92BFXfpMIEnE0lgBMvl7IrByoSZd1EDs746cPJRiVhxshA+2Np8EeJb72OoiO2e0FnoG3tsAmbY485iTKnGcOn5eOkp54RywJJQ35Uv8DPPLeg3lXCVivR0XYd/LiDKMWtcO7cunhZNcs5l4srosMXFp7Dc7PgGCi+weeps3RWFH9iZgVBdjSR/6q0ZdGfGwpCLssrX/2b/HrFJQye+cyun/rcXAjSuqqNr95aS4rno3gThI6L4qDEQw/bLo2++hnm0pZYn/rT+w9rAkdf/yCN8LYS6r/+0NKpNv8DCSg/3NQ7m2UJk7mHTLyi8Yf4XGE+xkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Ro2D7jldwfZhO1uG8tJx5GLxNvI7eDcL3+eU7nxCU=;
 b=IxFeZiN8Y/TmClsQMY1vSz+mgO9Xiq2liszRqlZ6ls/jbfaN5o0+CbJmocrXQ1Ev7KTXHlJjzttTirSPrtbuFRXYyqY2t5AuJq+0nyd+Nm81i0waxqu0lC+dcIS0WrDkSDxRks7yjBXz+b5E50xezOhcAKJ0WhfE7R37q7T6Zt7trFej2W2ogc1pRZR2PvcyVx+X7+ktTa+oT6kEOJU+3+inNUt3xB8n/FqahEjh2I+JwybWpiVrC0TnZA1aqMYEoMogZ9WL9CvAy/QdKDe0yFt9V89Cb1/0IZdllgntbvwbs8kIe7q7qofDP9a8ueDLBcw0LF/IrC7Zy7afN5oPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Ro2D7jldwfZhO1uG8tJx5GLxNvI7eDcL3+eU7nxCU=;
 b=MVm2u2MPjDATdrw/wgPn1IydFcEZ8RMz5S/pT67FUCPwLE23nK7a7j+sWyz5tY569JTPf74PH2tx5i2Iwvjs9/FdvL+MzqLnZPOyLVyGVWC5TMSpv9/KrUeYnQSMqPObribk1qrFKnEJKODF7WUcaL3w/kdYJioKNReEuYphZUM=
Date: Tue, 9 Feb 2021 14:07:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YCKJLbaTzD6YF/g5@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
 <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
 <YB1v60CuOdhxFwNy@Air-de-Roger>
 <199d2681-9704-8804-d3c3-d8ad24fca137@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <199d2681-9704-8804-d3c3-d8ad24fca137@suse.com>
X-ClientProxiedBy: PR0P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6177d926-3e45-4975-52a6-08d8ccfbbbc4
X-MS-TrafficTypeDiagnostic: DM5PR03MB3211:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3211F6FE212F5F66A4E6ECDC8F8E9@DM5PR03MB3211.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDGjuVk+lw7TndSAvO4vu9PQTRejQOdUwpUgaoZjjidXn8WGD032Eg2M5FYR+1Hj0g6o/2/E1ICc8f/4FPFmOKGNHeXjkvfqXt6OUR9MWMQeA2UoGjqTb/0bsJ+9El8CnJ0HhQ1iTzFIZ+Zhq6iX+lixRLyu0Zas5xtpjzrkqnrZJwhs7xxt4sMSMCtziWc0sdwjZ2E6cygiZGt73aNEXeQfS0u9z3FkbppTFg4aLDx7TsM9cUGCrMyccsgP317d1tkF6d7KfIwcGCLcYPUvgBq0u6DhNGNVcP/q2+2G4K7k3GCzpntumiM/8YRyQXgnOghNXLMRkC+iWuydZD6STeMFWLJjhF69P7ZZgFGTLxtpKVzPqIEs/ie5CSpsYqlGA+E8Fjktncg67UcdpWBrECxu/biAQfccGozeL1/uhRU6AyiRiL82XEHI2gCMdLJj9WygRrKUH8TL87JBH5tOUAhkVJ7H/DAo4JYa12fGGIhD4jpYH7LrNstP/cVVxvSqTWgIurVFhsNsbQ3GNouVMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(8936002)(83380400001)(186003)(66556008)(6486002)(26005)(4326008)(956004)(5660300002)(8676002)(6496006)(9686003)(316002)(478600001)(53546011)(107886003)(2906002)(54906003)(66946007)(6666004)(86362001)(6916009)(16526019)(66476007)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzhqWmY3TXNaaFJOZmo2MWYzU01SQUNVNjJxTXZoOHRRME9na2I2dWhrK1ky?=
 =?utf-8?B?WkNETldYczFDTkVhTWhGbW8yNkpZZmhjRS9QblowM0oxNm05Y3YzQmRoU3lG?=
 =?utf-8?B?SmRsbWROQURYcTFBaVBjWi80SUpkRE81ZUliVFpidnFkM2RqZzFEdlAyL2Zy?=
 =?utf-8?B?Qk5JVXhreHQ3SkhHWlJ1WVU4cW8relYycStPZmYyS3dxVEpXR3V6SmxmaHAv?=
 =?utf-8?B?aWliWkNmMHpFdFZOTVk4eFVBNlpDOC9XSmdjWlZuenQ1dlJjbGxoQmdDd2Nn?=
 =?utf-8?B?M0lNMlgwc24xSWoydFErWHpuRDZCcVAxakdVOG4xNlhlVzlXdmVpUnA3M2Fs?=
 =?utf-8?B?VklyYUQyYUZOZ2R0K1hRSHpldG4yNEpBT2gxLzBHeS9NUFZ3WHdzb0lPanIx?=
 =?utf-8?B?T2NJVXpOS0FtTTBmWVgwNDhsQ3pzZUhJdXlwd204MlJPL1VZOG96VGxRaFo1?=
 =?utf-8?B?aW1lb3dGNVF4R1BLbEttOExRQVRvMW1EbTJwbVg3TDRDL05ZZ2k0UzN5RjFo?=
 =?utf-8?B?azVvejJXNTVxUE83TTlMSFl6S0xnLzZaM01LQWlQM0hmK2lHYzVQUHg1WFI3?=
 =?utf-8?B?dE9ydFVpVElxT2tUZkNLVFlOTjRjSUFPUGJwTjdLNC96aGoySnBObGl4bFd0?=
 =?utf-8?B?c3kwcnR5bzZVd25hTUpUMDBaKy9ZVEsyaEF5eGg1N2xwandCL09kNXdlU0pi?=
 =?utf-8?B?Ymc3bXA5QmJXRHErZ0IzMW90UTNzSHBBZVl2Mmt0UlFjcGJPd1ZDY1U2aGMr?=
 =?utf-8?B?akxtMEZCVU5zTmFJU2lPSmRMUWhiRWJYaURIOXNXNTNUTEZLOEF3NDFRZ1Ra?=
 =?utf-8?B?NFc1dWZlTFhuQlgwbmlqTm9XdzVmK2JkSEhmSkNuUnBMck0yZnNOeUVjOFRT?=
 =?utf-8?B?RHpkT0VPNituTFB2c0U0aUY0ZG5mZkpUa2k1SFRScmR2SFA2SEFFM1M2dzBk?=
 =?utf-8?B?OGc3MUNQbTAwc0JUU0oxRjdBcUtVaE5lN21aSGNSYWpyTjBQV2VaTzBiTTNL?=
 =?utf-8?B?djJ0bTFCZGxlVnBPZXJBY3l1NTYzSDJYWmhIRlRwcExSbTZnS1ZrV2t2bWFB?=
 =?utf-8?B?LzlOMGl4VXpOWUFIM3Q1bHhERFJOck5KOFU0SC9iSm1JTzlPY1JNa2Z4NVc3?=
 =?utf-8?B?UXluY2pKQytXYjBvc0RCR2lOUmpobGNXN3VCcWlmZnJaMHl6SUFGZGE5cnZx?=
 =?utf-8?B?dCtmZTBSdldDNWRuTzhPNFJKL0dKZGsvNGE4M3BGZFVDV2t0ajF3ZFlzbk5p?=
 =?utf-8?B?eCthb0hXZTg4OVhNNTNrTW9lTHljL01OWnNOQWpNano4YWx6TzNpRmltckNw?=
 =?utf-8?B?OC9aN0svVlJvRHBoUmt6L3ZONWl1QnVSbHA5ZExVam9XUzh1dVE4SmlFNW91?=
 =?utf-8?B?QVVVdldVMGd6NDN3SmlEMGxzUi84NUIzTlhUamhoclMveEhjaGx2OFF0M3Yz?=
 =?utf-8?B?QTNzcldDa2YrOTdsdUd1MXdweGVGWS93UHZpS0I1NWpaZWt0cHpjQWExMFNC?=
 =?utf-8?B?U0NqazVEbWl1MlhLMWVQb25wMXpXUGNyaUZGKzBsVHVFSU1OZ2lRQnREWkFU?=
 =?utf-8?B?THFkbEcrbGhhWS8yT3d2OUZUWHVhY1JuZXhFbncyMjQ4eGpFVHRIdHVTbU95?=
 =?utf-8?B?czZ3SEFQb3RyWGhsazZPeGQwZGtGVEJmQVNXSVI2MGtYTTRNU2E0RGErRS9y?=
 =?utf-8?B?YjFKamNQMmNkNk5ucWJRUFJDbG5sODE0Z1ZaZ0FPeTA0c0hqbGNTTXI1U0li?=
 =?utf-8?Q?vFYK8CiE7L/DO4sgdU4OBkX55lv1cK7a9j4O3gZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6177d926-3e45-4975-52a6-08d8ccfbbbc4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 13:08:03.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emXKLM/LQi3Nv5NU0kVfvWVryQcp4eR0t5ptO+4Xm8B3Ss7EzWvUo+6XSQVyQ92z4dmnmCQqfA3X7iZjWuqurw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3211
X-OriginatorOrg: citrix.com

On Fri, Feb 05, 2021 at 05:26:33PM +0100, Jan Beulich wrote:
> On 05.02.2021 17:18, Roger Pau Monné wrote:
> > On Fri, Feb 05, 2021 at 05:13:22PM +0100, Jan Beulich wrote:
> >> On 05.02.2021 16:43, Roger Pau Monné wrote:
> >>> On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> >>>> The "guest" variants are intended to work with (potentially) fully guest
> >>>> controlled addresses, while the "unsafe" variants are not.
> >>>
> >>> Just to clarify, both work against user addresses, but guest variants
> >>> need to be more careful because the guest provided address can also be
> >>> modified?
> >>>
> >>> I'm trying to understand the difference between "fully guest
> >>> controlled" and "guest controlled".
> >>
> >> Not exactly, not. "unsafe" means access to anything which may
> >> fault, guest controlled or not. do_invalid_op()'s reading of
> >> the insn stream is a good example - the faulting insn there
> >> isn't guest controlled at all, but we still want to be careful
> >> when trying to read these bytes, as we don't want to fully
> >> trust %rip there.

Oh, I see. It's possible that %rip points to an unmapped address
there, and we need to be careful when reading, even if the value of
%rip cannot be controlled by the guest and can legitimacy point to
Xen's address space.

> > Would it make sense to threat everything as 'guest' accesses for the
> > sake of not having this difference?
> 
> That's what we've been doing until now. It is the purpose of
> this change to allow the two to behave differently.
> 
> > I think having two accessors it's likely to cause confusion and could
> > possibly lead to the wrong one being used in unexpected contexts. Does
> > it add a too big performance penalty to always use the most
> > restrictive one?
> 
> The problem is the most restrictive one is going to be too
> restrictive - we wouldn't be able to access Xen space anymore
> e.g. from the place pointed at above as example. This is
> because for guest accesses (but not for "unsafe" ones) we're
> going to divert them into non-canonical space (and hence make
> speculation impossible, as such an access would fault) if it
> would touch Xen space.

Yes, I understand now. I think it would have been helpful (for me) to
have the first sentence as:

The "guest" variants are intended to work with (potentially) fully guest
controlled addresses, while the "unsafe" variants are expected to be
used in order to access addresses not under the guest control, but
that could trigger faults anyway (like accessing the instruction
stream in do_invalid_op).

Thanks, Roger.

