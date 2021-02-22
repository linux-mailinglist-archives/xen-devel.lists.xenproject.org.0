Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047753214CB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87959.165226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE95J-0005aa-1e; Mon, 22 Feb 2021 11:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87959.165226; Mon, 22 Feb 2021 11:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE95I-0005a9-TD; Mon, 22 Feb 2021 11:09:00 +0000
Received: by outflank-mailman (input) for mailman id 87959;
 Mon, 22 Feb 2021 11:08:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lE95G-0005YQ-Lw
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:08:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fea87cd-b6a4-4089-b657-075a8424dbab;
 Mon, 22 Feb 2021 11:08:57 +0000 (UTC)
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
X-Inumbo-ID: 9fea87cd-b6a4-4089-b657-075a8424dbab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613992137;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A2EUgiYFsnqe8RM/X0IvcyhSocV64autWSihTfkL35A=;
  b=LDWC8C/v9WATOo7B0dtmGooPHxEr4EQyYElkgQsFmNBdaVEZz7EoARWG
   ixN9CBffR/zCkp3OzTxDJnXRRJTegD9NFdhPVKaGLQqvfN9re4+W8EBfF
   bEHWe/iRfDHbmO2avJCjSxkkcJFCtSSwSeDK2puxo5vdJfiFKuxJd+RdW
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CuUk7IhEUHwL+qJqZxmF4N5PFOn5+rkvzAysosndqZC5gkk+Fa5BoBSvoaEzZZWhZ5SDfBr34w
 1G9DX5L2wThCHFZgwNYx0dI1oDg1oznjt8z3GKwfgLWoJIAct3lt4TR6xpwllGgMgD2XbXOdgW
 /VI9gRL9DMygviE4jIE6/LZY+puDHx+L/lMKCVVX85skeVww+7QXr6kM8rKRCTW7J+R5Ksbn7M
 zj2ZkF0AF2XoJUWzIeMa2fxG9vt44qTbd4yOGIiiCroG1RVpibqecBYaCUEfkqM/Y5FbvUFo0u
 pO4=
X-SBRS: 5.2
X-MesageID: 37744783
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37744783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr8HfZrXvrJ9UaTwrD6xVMcu5KTgnbQrpEfXGo8x1/6G1o2nXJi+P7Wdu7xcQ4/gyXGNQbAryEAygTrTBBzyEzcOE+jLa8TvBTNRgtXGrExXyQGPsPIzp+xTc8XkxXENRC0SRgbGSl4blPtL5U+IJbyR0FDCXDypIJs1q/xegDnZ64Ho4IIRJDMLuRGBcOfYzH9ew9RBOyr7WcnZQrK4I8Q1htIuDiFYG00xzlLLPG9aImsFmQBPjE1qYgjHb4o+XmGXwFwkAat5L/IkWjzO2m+9xpi6Tz4z9oXwiAgUhSkPuCDdws/cguLll9/ovzlDz2QC6OJmqdd/hXTKGTQBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvQYY4KOH8lL75WEUmYjowiYS7ZA9LVTkSG5qn0uycA=;
 b=L2hBo5Pqf/1ywuOhWwAEZTFh44BAH/PFfDzuG5ZrISP9o59XxY3SRkfa9cSmeLjW3JnP7EUQQUOMpiB8mH/ai20YThiTZLRRjug76Wsqn56qJjbdUpXjOFUQWTy4Z34Se4C2Iz3VMAMk5VCy61mu2Yi9lB83KxlbNtD1ssjT/naK9rclkiFmRsOHvEe2ecjSmuJB1msi7goIwJ/gQq9Il10RywzQEyTboZXpDW4dq5BXXJTPV3+CcGegsdncKssNgR6OPZrtpMtUQBEDJ7Dks8QUtpruj0+48gOS0bgwi/k+bNSSOClU6v0XB8fSGr3RwTVjuqycuKiZZUiclXcwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvQYY4KOH8lL75WEUmYjowiYS7ZA9LVTkSG5qn0uycA=;
 b=xlUs0uywNCDX1hA9PFXHKrnCMHs1XXEjzBLgM8p5kQlKTTAHdVzJ3bqtKuAREHI1rDOZqOpTPnTr1mgFFDX0OeoP8/FRWUCTQXZ/yV95apazZOvL8BlB3alrhLb2tzw1+DZNbdRCjQnVeWCQV3xcr1MooqnM+bT/wvqGmyy+XQI=
Date: Mon, 22 Feb 2021 12:08:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDOQvU1h8zpOv5PH@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
X-ClientProxiedBy: AS8PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14b95bd8-c8ce-4047-e744-08d8d7223c6f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324B3EE7FD6697B2CA8A8828F819@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vtjX76BOv33ZPtyU65YQgoLTcISpRyxee0MoslKB8pUbcRunKh5Wy1EOOgWSowjbKEbaEXQz835yZN3O/MHUCAsSGYq/GaAvxDEz1NivRz3fLA7fef3YKIxblln9S0kSo3TZKsL7qUkjqXbYWx9jQPKdtI868dwTBfKbLdHt6hEuJwW+0cQ7gLaC4mcdz2qr+JvbcSkyXctocHQV3iIWdZSiuPyYXxroVUT9f2dnAJJiQf4a1ao9kGFAl1/xZx4uhKxcT7xXsbk6MXWoIPZ8FpnBOnOHR+HeFFpG+P+EYlRlK2XbXgovPQR5WWZwzoTJeZ/kVlrO1PWeNGOosKY8NJ/Jm0zZqOspeBHCHFIRY1NUZ37/WSs0tEZCWzDIIasog25wbiF7vN4onatRDlPVEf3HLaZxIbfGl2m3d7mB/i6VtKuscTnV/uVctR4Y+Q47CrygPH12pYt+BtgTIxuMh8BXYU3k953HZX2/DnEJCqWsRJ/0QATgj4zJKbfGBbAk9UZ6Off7ghO1FKrJ8tOuXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(83380400001)(956004)(478600001)(316002)(86362001)(33716001)(66476007)(5660300002)(66946007)(26005)(66556008)(4326008)(16526019)(186003)(8676002)(85182001)(2906002)(6916009)(8936002)(6496006)(9686003)(6666004)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VnlkN01zVEpveFdkMW5DOTRDSnhWa29HWXhZcVk3QUR3Mk1mVDhzVXpFVlhr?=
 =?utf-8?B?cDJtVkFRZFdWaDFLbHUvaEZlSWpzUjRnWjJMc00zOFRUdDZkWDVaSFZUSHlH?=
 =?utf-8?B?cElVcnRrN2txSFNWR1pEcmVuTFM1T2FnTDdoTi9FU1ZYV1BtNDBrd3piTXg1?=
 =?utf-8?B?WmR3b21xMlhsRG9CdXB2dnVrYXc0K0t6NXpmZU1ScHdpcjE0UHZQVTFVL0RF?=
 =?utf-8?B?Z3BPMEp4UVN3MVg3dTFzQ3NuaDlvcTBxcWoxdE9ick5zQk1DK3d5Z0o2bDJo?=
 =?utf-8?B?Yy9vYkNqa0tVcHJ5cXhzNzdRZ3c3YkVDYjBYbmRkWWczRFNDZHdzVEF1SW4w?=
 =?utf-8?B?SG9IdXQrT3VQV3FpM3Q4M0RsVXJNV0pwdE1hMnNsRWEvempiL2NDZUZNNVJv?=
 =?utf-8?B?cXQ2K3RGUkR6ZFBHMzFNOTNTRVdLMGE0bGpvRFQveXhGbWNPNndzdjA3N1NR?=
 =?utf-8?B?U2JTcEJRSElsdUsxOXE5Sm5FM25td0twRzhoOENZQzNjR2NEeW01eTdSYWdN?=
 =?utf-8?B?eEd4Q1JoOVJwMWE2andqMG5sUnUyNFdUc1lqYUN3cE1DU3pMS09MeVIvRWpN?=
 =?utf-8?B?QmVhSVZ3blhHSnZHN05sSHFucjQwQktUMGcxbnpPSmNCZ2pta3Y3L2ovV1Y2?=
 =?utf-8?B?cVdaV1BOMUtNbXdvYjY0em42U1AxMUhFa0RHcE1xa2pudzBWYVRqSkpEUnRG?=
 =?utf-8?B?ZW4yTUNKUjU4VFpHQkRaOWtuNjhZWjdqOEhrUE9FRzFHQlJ5amIwNWlrOXRI?=
 =?utf-8?B?QUtQdkZqZUp2NTZwb1FsQzBHRDJRSVBTbzVQRWZSUnVESGdiQnh3Z0NTZ3lh?=
 =?utf-8?B?WWNXcDNKbm4wUGdhM2VFTCszSTBWNjF3VVJ5cDIwcXpxcGFEWHZSdUx3d1ZH?=
 =?utf-8?B?aTk0QXU4MC9qWUxqNytaNWxyWnovZmIxNnFFMnRlRnlTSkUvd0hxcHBieW9s?=
 =?utf-8?B?L3AyL2JRVk5xZmFzRHJjaHNCbTBXazZXNFVmdG1DRU5jZ3pBZmozTWJGZklX?=
 =?utf-8?B?cXcxZmtMUW9QeTErNmttUWZQTVZBR2ZCTUdSOGZ6QjVUM2xzN3dnTGQ1aWNn?=
 =?utf-8?B?aFlpbU4wNEl6dGV6Z1ZFWHByUVQ4Uy9FNzVrNGpScWtmM3I1WlV0dXhXd2gv?=
 =?utf-8?B?VE1wSHZLR0RVNmtENFowT1pGOHF3My9hdzdlaUdsZnRPWkdSRElGVDFZbU55?=
 =?utf-8?B?ZkcvVUlpV3VEbjFYQVcyaXJ0Yzd0L1JTTTJKUGJrVnRXcEdIMTdpSHREQW9M?=
 =?utf-8?B?QlBBTGNyYnQwZEd5RDd5RThkQ1h1UnNGUHQvbzVUd0cvYk5xUm5FSmtYeXdk?=
 =?utf-8?B?SHRXQSsxZWJRcUwvbmh0czV3MU5LdFFubFMrM0tDK29kN2k1czNEanBFcUY5?=
 =?utf-8?B?VGNxZExtSnk3VTdHaDJtMUVHeFJwY24zbU4wanVKdTd2UTljNFRKYmJuMTQ5?=
 =?utf-8?B?RjJFeGNrWlQ0Y3lMcVlnRUM4YmRSdnVaRWk4OWVoSWl1Mm9JSndkb0JRU3B4?=
 =?utf-8?B?TWlUVWRWVC93U2xYL3RNd0l3YkY3SXJjTWRpQ0VueVpuQUdONFNTb2R4U3h3?=
 =?utf-8?B?Rmk5L2RYRjFvU3BxQVA5YzM1Qnp1Sk9pNjVXQk1WR3dsWFA5OUR2a0UrZ0pV?=
 =?utf-8?B?YUR3dmNVdjM2aHJ1bksxTDIrQy9nOUdQdFhSMXdpTHNLSDdKbU1zbWFGSFVs?=
 =?utf-8?B?VE91TTkwMFN1UXVZaytzQnlIMGZwNWtVUU4ydk5PVUlXVlF6YW1NV0xTSUM5?=
 =?utf-8?Q?RJPlGUdDMhYI1ksI/oJnXoZByOptWMHEfiI0xHc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b95bd8-c8ce-4047-e744-08d8d7223c6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 11:08:52.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdeBVKElkeGW8vf48ywLyZzl5beseLPEpGZYYSvBy4jpa2VkjHPRef26AkjExFNCXZzhJTngk3zDNNSUvYSxNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
> 
> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
> > On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
> >> When toolstack updates MSR policy, this MSR offset (which is the last
> >> index in the hypervisor MSR range) is used to indicate hypervisor
> >> behavior when guest accesses an MSR which is not explicitly emulated.
> > It's kind of weird to use an MSR to store this. I assume this is done
> > for migration reasons?
> 
> 
> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?

I agree that using the msr_policy seems like the most suitable place
to convey this information between the toolstack and Xen. I wonder if
it would be fine to have fields in msr_policy that don't directly
translate into an MSR value?

But having such a list of ignored MSRs in msr_policy makes the whole
get/set logic a bit weird, as the user would have to provide a buffer
in order to get the list of ignored MSRs.

> 
> > Isn't is possible to convey this data in the xl migration stream
> > instead of having to pack it with MSRs?
> 
> 
> I haven't looked at this but again --- the feature itself has nothing to do with migration. The fact that folding it into policy makes migration of this information "just work" is just a nice side benefit of this implementation.

IMO it feels slightly weird that we have to use a MSR (MSR_UNHANDLED)
to store this option, seems like wasting an MSR index when there's
really no need for it to be stored in an MSR, as we don't expose it to
guests.

It would seem more natural for such option to live in arch_domain as a
rangeset for example.

Maybe introduce a new DOMCTL to set it?

#define XEN_DOMCTL_msr_set_ignore ...
struct xen_domctl_msr_set_ignore {
    uint32_t index;
    uint32_t size;
};

Thanks, Roger.

