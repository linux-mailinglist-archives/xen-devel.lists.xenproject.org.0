Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96901357ED7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107094.204683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQia-0001dX-0Y; Thu, 08 Apr 2021 09:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107094.204683; Thu, 08 Apr 2021 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQiZ-0001d8-TK; Thu, 08 Apr 2021 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 107094;
 Thu, 08 Apr 2021 09:12:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUQiX-0001d3-LW
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 09:12:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ea8361e-a68e-4343-965a-a069409234fd;
 Thu, 08 Apr 2021 09:12:48 +0000 (UTC)
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
X-Inumbo-ID: 1ea8361e-a68e-4343-965a-a069409234fd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617873168;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7bi+KOjXvGN6dh8Q8sXeJWG409zzSW+6x+gSg8Ly6GY=;
  b=BxdchgMZbRGIjH51tXWrfOA7ZlHQy21KMO4LtinLmsZs79YpvsMUMn0p
   FvMWDkjf7NmfmBNDpXMQKu3jytknrFwTiqE+d4kxXoDtRguxz55qtlFXQ
   3/pne+xYgYv13EBimlpC7BWaBQhxRbL5FLUiLlnkShR4B57fz5nKgjWOC
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 35JU/0WhvlMOJvW5+dD5Y6RIJl6kV8hW/gLg8kmBJlpcO0DogAHt1EDJOXOKD3NoHauKuHBRAf
 4V0PnUP71SdcbUYoTrhfOMS7SRV42q1rrJLD29erVNCV6+uvI04t8uTxYfrWDPph5APSBDl4se
 9ZNK2hJ75uTHVJsZ2dKobX2ltFjo/5RODZXZ77Gj02b0qlQgPzUoA6S5WR+mcSBGcp6V+/IVmK
 b4uqUv6vmRFEGB1cdEbbwUW0L8k9yA3p8vzjn5FQUDcVSmolS6yt6YXZtM3jrdCe8EGkk2VWSW
 CuY=
X-SBRS: 5.2
X-MesageID: 41133437
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Huo4K6+L+SQxzWemtrtuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,205,1613451600"; 
   d="scan'208";a="41133437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl6YvZ7Zdzv6/v70pg+9ZgqkBynmUDM8T+mZUpO67aJyock7/R/jrbb3U6EisDXJ2xhVmeLzvjamqkQQ2echN7J2thPOHGRnNR9yeUejPs2GxMeH5w5RvBFu6DWiJi811/New98lhzp2OF+rrvaKYBSvKcCmsyxJWyhWYXiFw6Bo7jMTe/HcsC+jgMPDOLcWmOAG9rzSx5Tql39kLuJnF7C7VVbyHS+HbwdkCE/kAE+6bSjAnq453+b/f2DwZgyh3vmeQf5OZ2ao/XGIYMyLSvG11vTzjkI6cRzsUJCgAtec3GywguWmZ9vPbTtK4DhiLHbjSJw/raW3EmNB38ZZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKkAWnpbpPsRs/Ipu4daGC3sfX5Mrclb6hJZj1sDClA=;
 b=Ny8nAxMs353MxWxN7A271DDl+gV24wbr2nB87NAfzs6wyFuO87F2D/SxZf2xokBteIPwQeXXZHrmpeHRXNXsrDlPEHLaqxsN844rbwXKGtMbcc1dcovBXH/cRoX+XoxW1fJm/okkBzGd7989hJBpMHJNj78zYIunOsRC7BonQWj49Bp9a0N0IR0tI0hsBN1AMHIvYylP89BfE9Y+A3XOcxVh6Qrn3VMZgDTLxyoyed731gs3kVONsrONfDjHk96eA8dCGAr2S5417CMh1TtSpiQaXtmI+WGQ3CUwpNuNcLouB80w9F3Gbad2FewzLPeBrhpeXaJa351QECukYcOdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKkAWnpbpPsRs/Ipu4daGC3sfX5Mrclb6hJZj1sDClA=;
 b=Lg5swWNisOpcTqHxgw9JTBULrsiVEj8xCeJHBV816hxYD3iLQJUNGOq9Gs1YZvLICjgyF9teAbgtHMak4d1WQ1lUJRJNHy8LziPFlYJNPNV06skXKFZaP7vsQDYKbNArp09AXISOBQhE6LFDpZm2+zSR9OwqODQ+KwUQWcRh7/c=
Date: Thu, 8 Apr 2021 11:12:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <YG7JBXR3znxhNPtv@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
 <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
 <YG3djUEiAd9wqQvv@Air-de-Roger>
 <e5a45339-a79a-a903-0599-86e14f493818@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5a45339-a79a-a903-0599-86e14f493818@suse.com>
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11604609-593c-44c1-adce-08d8fa6e7718
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29239B2B9B1FB7515095EC0F8F749@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VybthF6stpOXUFYyBBy99+euf5gTykzEkhHtmmLi7Qr6cbNRg5hYLR8iHY06qDdeFWWT6HiZDswWPS/Es9VJHlG2ba5O/d2TGetjtJBM/aXR/jdKcx39/p6AqEaKsB6oKqC7xwMjvZuCdr7LGqJRzKooPVF8SYt1CI8bAuMPrYQruP78LUKgrQnVv2iFFdvpu0p6ACB7E87fCnWugJbbHiIzqQnYViuIzdehkc4qBOyFvGtLHNFGpNcuCxSlcdEeq1TStgMh0H3wuqUPzaILPeiodhBKS4UoOpObsbIXB5N00UuBTTChcjiURDEwmY69zFGK3PglIItnJKzkoQFLzLzo/XtmFjk8AF8eFpSs1yXYhc9njETFIjdc0zTEgr0DYTIJ3v8uky4bsEu/b5HammPYGpJ34/KdkTMdQqevgSQ3V0+y88V73xGH/Qs5uDFn/4rX/J+8MP8ti3WN4kzV5mJuK7RK+YSRl8tvgzS2pKkQpr/T0MEkXfiO8qF4D1W13sWfcWf5CumNvJXsnuSIAoN7TqvYezGJdJ+02t84MFSd0peU4n/WeoDPz/1ZGHNAEUzglHekdppkmQZ4u2+SX5KhMx6cFzMqoXXGJ83SrSwHpydxPpmwAZ8VATarc4WJmAqY2Jj1QNOQ6YJjT0pKtIpR7n5r9LyHFbAZtrHwB2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(396003)(366004)(39860400002)(346002)(9686003)(6666004)(83380400001)(38100700001)(4326008)(66946007)(66476007)(66556008)(86362001)(2906002)(5660300002)(85182001)(478600001)(6486002)(54906003)(33716001)(316002)(8676002)(956004)(26005)(8936002)(16526019)(186003)(53546011)(6496006)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHZ0QUM3a0pCS3hsUVo4MCsweVRyU1lOdWhMTU1qQndpMjh4cFZSdDVac3ZB?=
 =?utf-8?B?S3hkakwzMFFia3Jnc3RCdjZTNDZwbUlMSHFXZjNwR3JXWHBma0x0N1JwQVNM?=
 =?utf-8?B?cFR2OTEveFYzYUJzUUk4RTJSVWJMMkIzazc0UDZtM296YnNzd3JuVnVldGN1?=
 =?utf-8?B?MTEyVnlZaERYRGUyUGREZklyRGxmeEhYdlNlM2xXdVdidlpVY2hpUDRXTkht?=
 =?utf-8?B?VFJualpSeHhZeFhVWlJoZDVoQ0Jwalh3YmdrQ3RsZk9PVERSRHlaVGcvbmFV?=
 =?utf-8?B?YmwvLzhCRDBYUDFYWGVyYUZtTzVwc1lNa3Zud2RBcWRmMk9EUUhOV2IzQk1a?=
 =?utf-8?B?eFgwWko5cDV6L3VMOGpkTTdoTGtJZ0ZMVUd3YUxibmx5cnJyQUV5SEtLYkkr?=
 =?utf-8?B?allXU0FnSkg1WmtmcnZMSVVDcTY1WHRBQ0Q0eFJvZnRpVnR4SVVKdjRUMnJY?=
 =?utf-8?B?K3BCWms3eHFiYU1pQ3N0KzlVU3QwOUJJL0Y3MzVmV1hzdFo3UmpFWmNRNWc4?=
 =?utf-8?B?RzBaVVhlMjRaZ2ZFMHRKRXdlSllyTGNudjVKdnh2SWNVQTJKcUJFYVRRQkg4?=
 =?utf-8?B?R2EvTWlIWkJuM0Q5U01vV2xWNnNlcW4ybzRGSWs3OG5wc1NMa3ZNWkdPWmt4?=
 =?utf-8?B?cDV5V1BOSG93OW1qYU1jYlRiNEt6NEJkamF4OFZpL0IvVFlnVVZGRkd5d1RB?=
 =?utf-8?B?OGVDeXpZZXJjMGkya3ZEWmxWbS9wZ0Q4QWJWOEtpOVVsRzdqc1QwNEpNUXZB?=
 =?utf-8?B?RDJDblJIZmNaTExFWW9JYVB1K053WkdhSGk1U2xUTWFEM1VGZ2tsMUp6ZE5O?=
 =?utf-8?B?Q25xRlFoWUxJK3pNNEFTQ2I1T2p4SldsaEowNFFBUnNucmc5Wm52bmVzNjdj?=
 =?utf-8?B?SEpNaHBRMTFLeGRid1RHRWpXaXhmU0V6V3ZtY0JOVFJ1Q01LaFpobkp2QXZ1?=
 =?utf-8?B?R2JXajA2YllkdjAyeW50Zjg4WTJRTUdoM20vUkM3dlBRcWJ0dHdQbjRUaWZT?=
 =?utf-8?B?Lzl5U05CZEZqNm9TanVGM0k0cXpueVlubFlVWXIvM1lZY0JtTTd5dFlBM2Zy?=
 =?utf-8?B?OUh0cFA2RmFvMTFncjN5WXVOWlN3VzduQzlSdmptU09ESTFYZnRzWG1MbkVV?=
 =?utf-8?B?QjBvcHVUVXJkaWM1SnZjaDlrN1VCUEdqYndZSzREQjJPaEFKMTA3WDQvRmFm?=
 =?utf-8?B?V1RCSTRNQ2gyVmpEQjJkTk0yZG5yakJXRWNwdlBOUXd0N1pOeXpyanpoQURU?=
 =?utf-8?B?NERsVEVKQXVsS0ZFNzVROGR0aHdoaFdEQlhyMkNQVEZ6dHdOZ2NGOWZISjBO?=
 =?utf-8?B?b2RtTWdnOU9SSE5sb2hocUk4TXZaWXFXWlhWN3U4cGdzdkwvdVcxaG00alky?=
 =?utf-8?B?Y2xNMTgvVVF5QlRFUmdoY2MveXZQOTNJMmRpYUx5RmZXS1E2L1J0cEZ1Q3NE?=
 =?utf-8?B?TVhjMjk1QkVMbG5OdnpPdk5ibUNDcGFEV0I1dWt5d2NIZ0h0dkRHNVpzNURX?=
 =?utf-8?B?UnZnbU1sNkpwcGFSd0V0QmZ3dlJQU3pTRzZrd0pteCtrZDVML1pHanI0eFc5?=
 =?utf-8?B?ekM2VktzZTBOZmVnMWdnRWxrMEsrNEtNS0NBbmM3SEVKTHhKUHZjV0Zjbk5l?=
 =?utf-8?B?dUMzZzN4WkZRUUFBamhzMy9JSERKOXJRN2xXaFBWQU9iRW56WFUvWDAyS1oy?=
 =?utf-8?B?K1dVeGJjaXc5VFdCMWVjdTZpYSs3QUd2bExuZEJlUWU1MkFtL2I3QmFHOVJU?=
 =?utf-8?Q?lX7GPL8CpyeE7gZkhch6Cz+Mj+yRO70L38Lqqw7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11604609-593c-44c1-adce-08d8fa6e7718
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:12:42.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgzRqJyV+pA2afH+otEPhlRWp65kSubZt/b50B+8Qrz14XwWMAHS9A/EzIGkCmaEIy0u6dtpTDV4P5YTD0plEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Thu, Apr 08, 2021 at 08:20:15AM +0200, Jan Beulich wrote:
> On 07.04.2021 18:27, Roger Pau Monné wrote:
> > On Wed, Apr 07, 2021 at 04:55:43PM +0200, Jan Beulich wrote:
> >> On 31.03.2021 12:32, Roger Pau Monne wrote:
> >>> Add a new vlapic_set_irq_callback helper in order to inject a vector
> >>> and set a callback to be executed when the guest performs the end of
> >>> interrupt acknowledgment.
> >>>
> >>> Such functionality will be used to migrate the current ad hoc handling
> >>> done in vlapic_handle_EOI for the vectors that require some logic to
> >>> be executed when the end of interrupt is performed.
> >>>
> >>> The setter of the callback will be in charge for setting the callback
> >>> again on resume. That is the reason why vlapic_set_callback is not a
> >>> static function.
> >>
> >> I'm struggling with your use of "resume" here: Resuming from S3
> >> doesn't require re-doing anything that's kept in memory, does it?
> >> So what meaning does the word have here?
> > 
> > Right, I can see the confusion. Resume here means a guest being
> > migrated or restored, not Xen itself being resumed. Callbacks are not
> > part of the exported guest state, and hence any emulated device that
> > requires a callback will have to register it as part of loading the
> > saved state.
> > 
> >> Apart from this, and with the xzalloc_array() change requested
> >> by Andrew, this looks good to me.
> 
> In which case with this change and "resume" replaced suitably in the
> description

I've worded it as:

"The setter of the callback will be in charge for setting the callback
again on guest restore or resume, as callbacks are not saved as part
of the vlapic state. That is the reason why vlapic_set_callback is not
a static function."

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks. I also want to make the warning message in vlapic_set_callback
conditional to the vector being pending in ISR or IRR, so I will not
add your RB this time if that's fine.

Roger.

