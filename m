Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD2358133
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 12:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107168.204855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSKz-0003ZO-MO; Thu, 08 Apr 2021 10:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107168.204855; Thu, 08 Apr 2021 10:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSKz-0003Yz-II; Thu, 08 Apr 2021 10:56:37 +0000
Received: by outflank-mailman (input) for mailman id 107168;
 Thu, 08 Apr 2021 10:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUSKx-0003Yu-MA
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 10:56:35 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 779953ab-c188-4517-a064-d92b8e506248;
 Thu, 08 Apr 2021 10:56:34 +0000 (UTC)
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
X-Inumbo-ID: 779953ab-c188-4517-a064-d92b8e506248
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617879394;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qg5zFE0pfMyYoiMUIUPm8aZ0aoT5obvhL+PEw7yKM90=;
  b=TD3uTVD+vHHZ9CTOFtrgNKNa8tMUpE938uuJG0eOmcwNSe9+Z8eLWnxs
   cC/YWdCyiSFf2fo7Doh3muSI0kICMY4ybxUirEWgKtvnz1CcAobIhGGST
   lvZnK8sXPKsFQLLhouzmUlrB4nXnbWfI9Vy/5LT9SK7tP2vU0b2ZFoQEk
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f/BYWX0BW8RZdqw1vOdUiXB05Bxsit6SFSV+MA+Tu+1ty6PQnJ1hz1cBanBAXRbxFVDAFEIONJ
 3wFhwftaaSc60vrg/eF21/U8bYzIHXM5r9Qofdjq/yEVJh4LbI3Zou1o3L/9icsG2Kw43vHENa
 eOA3X15V4uUn5PlP13koiSkiWefRjxzx+A4SE5ms8ZcUtKEdJ5x6q0dkhxypJymhMkERoYf2Zy
 /8PPi3w9ZN1jf+ucNx65e2yBrb62jZe4E16Lp+RKwOdqmE/4NmDxJkYApz80kq6D8uoCTbfTeb
 wZU=
X-SBRS: 5.2
X-MesageID: 41139414
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:I3WvCqGsP6Z/w0hipLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41139414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itKeXGxj7cmzLSVZ5li35DVyAA0VGKMXt+z1Z2wkJVszXt094rHVP0xnT2V0zI5DUc2oSVEPxKe0hDQQaQ4PJYjvhHGdpNr2tHQCGNBzxsv/8RTcNKP947wTteMnyIkRErNRcQcaNcAgOoJXit3eWBLMiS9HPTX9xsHojqGVH/nwnJKu36yTMNJLS1qXf5JLhfyUVmVziuuWwkRMRrlOWEfCuh6T08RFFPhhCe00DnqhjAxOfDxKY6PCAw0o9QSSlJcfwUVlh9RvIJloCLLUlV73gw5C5SDkAnqM3IwoSs0DXYKQrHd+BIdBWfiU8uHCh82MRr13KVP42a07TKZoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4plYT3kwfqlsfaN5Z7x8AP7vWs9lfN2zMHdNyb3d314=;
 b=TzpPYLn+3SeHt35mkCLOuFAAYnp9eBszkxbS6cbcqfsx/Y6RVEr+/9LjbEIHWTBMOsNwh/ROzpD7o/O3B7MbOimOtUI9L7xbayBoiJFhhPFacPqwgdp91ceUTN21enx90IRLYZ9j+COamR9LsXrvM+ptL7hKTURiAAz+8zw1Qqh01EBZv81WSB49Rf/5ii2OqGJbHyDhMG17SH3OTiYqewLZdGV+CpouyxhyKzptvXala3jeseYqRGKBqUOZkZUfPMTvmrDDQ3HQVihBSDsfLjyTdFYEHEiNAMl2dcOTkjM6HHqhR0+eBgWLEHvi1XDQQpGq/FqZovpKe08iPyRBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4plYT3kwfqlsfaN5Z7x8AP7vWs9lfN2zMHdNyb3d314=;
 b=OjsbTWzGMZlj1TpzFAn5h8MLVXFLqB/6Ls5+5ec4GgjPwjoMaV3od0Tf8X2fV8zmdl8B1KJL6B9V/k80N8kKN0I5VCelWp9f7DkHTChOHey6OQXJEbqS0U/mYfG9BbYhw58IaTPRtVw0/fuJ/F8976bhOTdM1FTQ53idw6S56TM=
Date: Thu, 8 Apr 2021 12:56:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <YG7hWfQwDmcuDjaW@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
 <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
 <YG3djUEiAd9wqQvv@Air-de-Roger>
 <e5a45339-a79a-a903-0599-86e14f493818@suse.com>
 <YG7JBXR3znxhNPtv@Air-de-Roger>
 <9ef5ce06-051f-6f05-613e-82612d02f8e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ef5ce06-051f-6f05-613e-82612d02f8e0@suse.com>
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ad4ed8-c57b-481f-f643-08d8fa7cf7e8
X-MS-TrafficTypeDiagnostic: DM4PR03MB5967:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5967E901CF0EC473226176208F749@DM4PR03MB5967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKNlcinp3TLyUIhXB/5B05YmPUYj5u3e4jTghOaVJo3E8CBK6c9DJjO8nD0czcOQ4MkmnDLiPM+dfXV9rfjxK8BolyRzRsiTu0xAPgDKoBiWUty0rlMMXbz7flJeAmob6UcUUyAEt5HqjvEV38j/o6Mzkm6zs6TTOsImaDkN1kov2Y7StnGH0nebGs/o0VjWLU3fbkd09Yyoot7ntLX86HzJUS8YsMigAW7+S0ji0hUyJ6GodY6Bh8gCLiyTNhU4110Rebq9YXNumJ8QLoHEB+G0HMp8Y9Evf2PVNbsW0yCdMTeLh5iV7FfhVPjVSyqDY3ys6pH1TujmWuqX+nlMnMiWFo3KV7VxOvgVKQutn3yxV0FGEuK8+4uSJiDAcz+y3FrPrwCZ8Aq05XA8rYMecVU4PFPmZG9EpGOWNOSfsSoUE+D+UvsngJwoi97sYVM4XIUMqnGENRzHY7tAeUyfJG87txxl8tTaSWSjYjblqhiAnZi6XzQDMjUDp9KwiiQ58MOz2MoN56m9zKy1RbqDkOLQFz6r7OIHpmMP/AZ512dC3eN2YeklT/VpakqXG28CSlLjxyUI03eXfUtMp8MA4eEyaXtn7voNF6RgbXWRv8/Bi59cSl8oDiIXxDP96LY51fsldfjO9qJwo5AyOYIgFAAm+o+g0KIo0ZQWN4j6meA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(8676002)(478600001)(6666004)(6496006)(53546011)(5660300002)(8936002)(6916009)(26005)(66556008)(2906002)(9686003)(66946007)(66476007)(38100700001)(16526019)(186003)(85182001)(33716001)(4326008)(956004)(54906003)(316002)(6486002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mncrb2tESzR1R0g2cE9nOG9aTDNncDBzREtqaC9vZHBZanRpUFZrNUVpSEFo?=
 =?utf-8?B?ZldmT1g4NTlGcFoyQjJpZFowZEdLUEdHTDRYeVJ1cFMySmFJc0pRcWVEeFQx?=
 =?utf-8?B?Vy8vSVdCRTdIdThzNGY1S284dEJBWE0xbkx5aXBtUjVkNldmcTBsQUQzQ1kv?=
 =?utf-8?B?VWFITkNvenVOUC9vcnV3S25Vd1ptejNobmlraFh5OGQ1UHM5YmV2SE8weHB1?=
 =?utf-8?B?UDVESWtxRmdFUnR0VDcrUDBnK1RSMFFxWC9pKzhubnpxRno4b2kyZ2dYMjhG?=
 =?utf-8?B?QTcveG03UndhYUJ0VTU3ZGg3Mm1FUTJBVFJwQWxjYzU1MXpVRk8vcXcxaEtW?=
 =?utf-8?B?UWQ5L2JHMFYwVGg4bDlQNFU4VWZaelJYcmRCR2w2RTYrblRLYzgyNTVCelFo?=
 =?utf-8?B?b0JNWGJ0cUh6ckI4Rk1SOGx6cTNFWFdpaGV6TmFKOEIwYWVQYTlWQWdJbnQ2?=
 =?utf-8?B?MXMvRmx6TG1CNUNjNVZSU1lZNzd1dFZ2ZFRreEpXV3o3SEtqRDI4Q1JKd2Ra?=
 =?utf-8?B?WHNHLzNSM0xnS1VNSVZQWGxvOXFOWGs0T2Z6bnRkLytGdG9nVi9ITUhKMFJZ?=
 =?utf-8?B?TFE3aC9iUS9DSVBabVM2N0N4anJmNzc2OUVKaWZvZGVxaytOeGxuSFYrN2gw?=
 =?utf-8?B?WllXVEw2QkxmelFTa1lIQWJnNHZuQVZPRk1GZHZKRW9IRVJHc2tzYWhYRmly?=
 =?utf-8?B?WEQrQmFWbzB0T0k1akhrelE0cmZEcTlIQUkzK0hXQVVLa2trUzlrcm1McFhn?=
 =?utf-8?B?K2xOZ3NLcmljSlFkMG9uMVlkN2tzemwyOEZ0SGNlU0NsR3FLTHJ1b1QwS0FT?=
 =?utf-8?B?eXNMN3JXZGRTTW94TEF4RmVQbTZoWDBqMWhrZlJWYU9GaURUMFoyb0tvNkZz?=
 =?utf-8?B?azJscTlxWk1tbnp2cllLeEhydzRCd3dWeFJMRGdXMFlsMEhjTms5TDkxb200?=
 =?utf-8?B?TGJGdFhCL3RUZVJ1bnhydUlVUGVJeXRYWTBlbmZheWZTTUEzQW1TUHhkTXNu?=
 =?utf-8?B?S1dVdE9BMFF0K014NEdGK0lLaGpDcGdXN0xUT3RHOWt2MEd0QTM2K2Z3clJv?=
 =?utf-8?B?ajJ5OGZtWGdCdzdXdllJNjNVdDZTSXJHL0I2cVU1SmFKMi9qMmtyMHdxNXNz?=
 =?utf-8?B?TkZGZWpOTlZQOE83WUR1ZlozSGxKNnhaeUlOLzA3Y0cvSU8xeXJsaExBV0Q2?=
 =?utf-8?B?TXFxb1FUaSt2ODRwWElPZHJlMEF4NzdlMFFQQnNRR0I1ZVBGM3ZQbUpaSUkz?=
 =?utf-8?B?NElxUjFobkx2UTFlODc0WDFNWjlBUHJ6aW01aDdFUXdWVndXUW9ZK2pLWURu?=
 =?utf-8?B?UnUrczhCTUZIV1kzL0VFeTVaWUVxV1JBUXVXclpzWlFwZ1lrL2NRS3o5d2Qv?=
 =?utf-8?B?VHQ2SlFZa05vc05FTzg1WXpLeVhoQ29oWnRKbGwrTllNY1dtelZzZksxQ0pT?=
 =?utf-8?B?QXE0a1pVbHY2V1B4RXFjYndITjk0VUFZRnE2Yzk0em9IU3pScitaaGNyYVNX?=
 =?utf-8?B?WGl6NndoZVVzVXpmWStqZXU4bGZ3SU1wZ21HMXE5N0RPVnVmajQ0TUZXNElD?=
 =?utf-8?B?Vk4vREZ0TFRWenVrMTgvZzYzd25NNytTTlZJdmZ2Umk0SFFZZlRWUzY4LzBp?=
 =?utf-8?B?MlJjQkgxR091SVBMb04vWlZvUmpGdVpIQnQvTXc4VHRCejZURGQxYWE4Z0x4?=
 =?utf-8?B?cUdUekdQNnhHTTFjaHY1VTRxNnFWaW1tNkM2Vm5RMGc5aGpDWFNNYnI3azZX?=
 =?utf-8?Q?Z9L2RqQc7azrlpRXfbRwpCBNXanxmabIE4ix+1t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ad4ed8-c57b-481f-f643-08d8fa7cf7e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 10:56:31.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4PTS0dwz9l6nAD+MFwj2gJC5qkj8PKtpoW92iBHs8FFwQfzS6GnnI1wxXTiz62fPMIvGV2V7EK6D9NsAKoi2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5967
X-OriginatorOrg: citrix.com

On Thu, Apr 08, 2021 at 12:49:44PM +0200, Jan Beulich wrote:
> On 08.04.2021 11:12, Roger Pau Monné wrote:
> > On Thu, Apr 08, 2021 at 08:20:15AM +0200, Jan Beulich wrote:
> >> On 07.04.2021 18:27, Roger Pau Monné wrote:
> >>> On Wed, Apr 07, 2021 at 04:55:43PM +0200, Jan Beulich wrote:
> >>>> On 31.03.2021 12:32, Roger Pau Monne wrote:
> >>>>> Add a new vlapic_set_irq_callback helper in order to inject a vector
> >>>>> and set a callback to be executed when the guest performs the end of
> >>>>> interrupt acknowledgment.
> >>>>>
> >>>>> Such functionality will be used to migrate the current ad hoc handling
> >>>>> done in vlapic_handle_EOI for the vectors that require some logic to
> >>>>> be executed when the end of interrupt is performed.
> >>>>>
> >>>>> The setter of the callback will be in charge for setting the callback
> >>>>> again on resume. That is the reason why vlapic_set_callback is not a
> >>>>> static function.
> >>>>
> >>>> I'm struggling with your use of "resume" here: Resuming from S3
> >>>> doesn't require re-doing anything that's kept in memory, does it?
> >>>> So what meaning does the word have here?
> >>>
> >>> Right, I can see the confusion. Resume here means a guest being
> >>> migrated or restored, not Xen itself being resumed. Callbacks are not
> >>> part of the exported guest state, and hence any emulated device that
> >>> requires a callback will have to register it as part of loading the
> >>> saved state.
> >>>
> >>>> Apart from this, and with the xzalloc_array() change requested
> >>>> by Andrew, this looks good to me.
> >>
> >> In which case with this change and "resume" replaced suitably in the
> >> description
> > 
> > I've worded it as:
> > 
> > "The setter of the callback will be in charge for setting the callback
> > again on guest restore or resume, as callbacks are not saved as part
> > of the vlapic state. That is the reason why vlapic_set_callback is not
> > a static function."
> 
> Hmm, you still mention "resume", which makes me continue to wonder
> what you're thinking of beyond guest restore.

Urg, yes, let me remove that resume.

Thanks, Roger.

