Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462EB2F614C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 13:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66989.119215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l029d-0008KK-MM; Thu, 14 Jan 2021 12:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66989.119215; Thu, 14 Jan 2021 12:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l029d-0008Jv-J6; Thu, 14 Jan 2021 12:55:09 +0000
Received: by outflank-mailman (input) for mailman id 66989;
 Thu, 14 Jan 2021 12:55:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l029c-0008Jq-Tg
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 12:55:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d05a158-df0f-4160-ad90-e35b625eafd2;
 Thu, 14 Jan 2021 12:55:07 +0000 (UTC)
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
X-Inumbo-ID: 5d05a158-df0f-4160-ad90-e35b625eafd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610628907;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pZul0yYDwBgkLBnRiPMIvv7j6Qxua810T5oklMAhCiM=;
  b=M9P1w592DBKqwRvg7PfH5eVbcYqVpDauQFr13Pmm6YcbG2uCuIQ2Qnx7
   Zr/YhyGz8eMD0MprA3nTqlWsGCzXJBWM9OMjQx74qXjCgzUoZj16esQst
   BH7yaYUCa7oDeEzLUC0ehnl81OAnJ502qEwfNY3xG80LMonjcEQrMxNrm
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ROlhKfctUnotbOsCSeZ98OzxaMfG4SZd3ByGklL2cbVJQI9xKGl0Ue+l8k+/XBd231UJjNHd6C
 SruljDSX+xWpVQES7ZCDbz5MSdfIVohw0AdTksu6Zdg0/MEYredSGl+MN5b7mRIGyZ+mq+jqyV
 nBF6g3onn1KhTqWOYpBuZ6MwrQhl01INUhn77TNXeKX6dZHqiNn/HSnpwobqyU2fdLk0mr1E3P
 lwnTZxLNeU9d5u/JU9lZeyUDdEJXFtkPUuwqqiD1g5hoae5mt+gDG0W7apIoxTuTDpukEIc6GI
 Sds=
X-SBRS: 5.2
X-MesageID: 35078030
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35078030"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hwyp10F9yJYTfwEWTPMG9kpokN/LIl1TCJtIRt4V2tyGNJyVxIj4JxG28Rbp5zTUw6YTQAxzHiBrBJ9fHQvEV1wXCwNJlyT9EqkE/Vlh2jcCmCJ8hEiSNXkGfDAkycVtD0V11ArgmNJZI5ZKipJmv6izPPwD52mlyiSsiTxQpkRPoHz1F6EVX99Fzp+shAcP2aEIEhjAd2Idd5F0kBGAf/cQP65Hfj4sztITrNyriLg92/ldWub6O8z9fL26Tp5sbvhdz9dRZXjea+6cQsthxFRBUNPZz3PkALMGOKyMGjTSaq0TMPHTd8IrgHzFTxEsHgo5NqpEo6mgfeXyGc+C8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlPfXJ2cOEixFyXS871Bk4g+RTjbY56o1Awr3H6kcW0=;
 b=CAgTW8djDQvzOFgp1dv+CoVy0zXLWNHbw05+gzSjlQKHPNswi6l4s+1MZOha6QfS+v0k06I+lyydZ/FWbZr29K/bJBfd/7thUYT418+NvIuW5V3N3YOeE4rB34Hm8jY9k4qxHlOuXfSNKWtu7r+jeWxYfEXZ/q3TqrJ0pgCmoRyt86WMzxgTMmMTa9MlcLAEXkvVlsyEsB2BAvX6zkxBtsta+nOQjEfuL3Oy7Z8XBO8qp9KN+aKgOE8skglL2pgIYe0UXMyiB0QJ3gOBzN+6bvB35LDE9nKxkvb+OXEcqI7EWGlTFA/ycBGa/PV/COzyIo0II5MGGiAFFp/ZPLIP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlPfXJ2cOEixFyXS871Bk4g+RTjbY56o1Awr3H6kcW0=;
 b=pNZLzmGe8epks/ka8+y4lEY7bDNk/aKE7n0rSkYfN/uv5yk0ufFMYg5zUGe8rTTfISe32a7jSpbrehNdkGHSf5YdatwJWGOj95FZKtYVJQs+Q0neZAlmE9/kCztsd0iXO/EXP6Za11yLoXZxHqq9lNERkNbdOQKpQ5ldUOVPTuk=
Date: Thu, 14 Jan 2021 13:54:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114125447.ob453h3avcug7pkc@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4041c97-df26-48d7-e22f-08d8b88b95c2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2843:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB28431A8F125F29191B335C148FA80@DM5PR03MB2843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H31kdt9U31o94+o4x1tZSH5Y0S5/keE05SBHbjfjvz4brjT0JBt7Apzanx1Ik0McrUabZuoYWsLGgQyO5jy+Lskx3h7AUNSU2uJWAMkk/mXEvSrzczvtcmimachxjUMawC6c+01G6Uyvj1zLl0jr2RFhm2c+EwAPmDujdAe/fLRh8Q1YFWLznee0EtaDj4UFWj2RCQJovO6k5dBIdgMDkUArsDqksdVC5G92tESPaeogtZtsuvl7zuLsxODTXYdqOM5TVaYrGZw1ulTqVtEAT7ArgKS2sbTsQ/1KslLBwCssabuQ8jd1nRs8Hz27AuJoe8T7+G1qCla+jM9r0s2oPYdeUixl2LeVBBL/49h/QZWSWRV4VTM6WweS8oJsmCnJuSp+HLuGcDT86yJOxbjltQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(85182001)(6486002)(956004)(6666004)(53546011)(478600001)(1076003)(186003)(8676002)(316002)(66556008)(26005)(83380400001)(6916009)(66946007)(6496006)(16526019)(4326008)(2906002)(86362001)(8936002)(33716001)(5660300002)(9686003)(66476007)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXBOdFpGNXBGVUNZTzUzanFjRTJuS3pMRDkvWUtTMWpidERTZS8zMnNKVDBF?=
 =?utf-8?B?UEJSTmI0M0ozN2l4MGFiY1lobkcxVzJpS0U0VGJUYUpWd3doRnFySldGQzVG?=
 =?utf-8?B?MDhCTjF5YTZSeWx1dkY4dVdRNlU2YmpJVjc4bjlYSTdhdmFPdzdVVnhPMXVQ?=
 =?utf-8?B?K01NQWUzelVnM1RsajRybEhLc3lwMGxjb1ZleDMrQk5iTkJTMTVjNWI4Tkpy?=
 =?utf-8?B?TmpEQjUyRCtsaUU1amFHNDR2VVJSTHpnczA5bkZ5QWd1Nmt4dEVtYittVmRN?=
 =?utf-8?B?TVdZTmMwSnF2eDJkcTdxN1M2RktJTDFsa0x1clBjSTBXV2RhTm5yaGlrMVFl?=
 =?utf-8?B?NmZJME43K1A0VVc4N25IMlVTNDJ4SHVlYktJWjVrWnh6b3Q2cVg4UjVwMk9o?=
 =?utf-8?B?Ti9LbzZiSEZDaE5aNXVZWGw3OXpCQSs2OVEydWpjdHJIeXI5YXBqeG85N2E2?=
 =?utf-8?B?Wmp6cXhVNXhGK0VGL09JTlk3cVptWSt3VUNKRFdReE5ZVVpZNzVNZVNkOXdP?=
 =?utf-8?B?MDM1MkhNcXYzdS9jVHIwMjFCUVc4Wk4xdDJVNFd0WTIxc2diclNjdXpqUy9t?=
 =?utf-8?B?azFidTRTWnY5ZFBEaEFabm92QlE2V1NtQ1Mxd0htWm4wTUR0eTA1cHZ6dHls?=
 =?utf-8?B?RVFaajdmQi9vOXVMYmZldXBwTFptL3NzVnVNWkpCSEw1UXY2cldRdi9NN1ZV?=
 =?utf-8?B?M3lYS3RHVGJibjhUaW52STNITXRwQ24vRERkOTRjOUtOL1JpdHUzVlJWQUVQ?=
 =?utf-8?B?alU2NkRaSFRaUThDWUhmS3haZXZVWUYzWXFJbXNQaFY0bzhIRWU4RjZBVm10?=
 =?utf-8?B?eVhGVjJlV2pnT09YQzhONENETGw1QkdvejEvZEVtNHkxWVRBSVRxanB4RE9D?=
 =?utf-8?B?Ly9UN3Z6SW5KT0dpbXo1QUlaaTgvNmRJYW5XUndMM1FFTDk0UUlEYnpTa2hZ?=
 =?utf-8?B?WkFTdGtFUXNRcWNQaFNUbEYwa3FBMjZhMjc2TFgrNlZtcTE5d3k3SEErSWxt?=
 =?utf-8?B?S05QS05wOTg1MXYzZ0U0YzNBMFZOeHF6amZ0dlAzYTJVTTZOWUtqV1I3UWsy?=
 =?utf-8?B?ZU0zMDBCV28rTERqaTRDWmFEMHJpVTZQckxBb2lPbS9kODBNaGFNOFBMYlo3?=
 =?utf-8?B?RG5JWisyeGRaUWZXMnNteDFONk1yZWk4aGF6WGxHL2hwV2h0U0piNTlSY0Yz?=
 =?utf-8?B?RjZFcmswazI4WGZ2U2xYb1llTmhwR3NCcmZzVXQzaGRSQVplNng1Vm55ZWZ3?=
 =?utf-8?B?dlhtRmg2Rjl6MVFldDJTVnoybDZrQVRyWEtUeWNybyt6bzlNQVBUbzJNYWRt?=
 =?utf-8?Q?bt/3q2xGURDpuu13j8oEUeheSGYMoybWSp?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:54:52.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: e4041c97-df26-48d7-e22f-08d8b88b95c2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOc638mIcPN+wXnSvzAp2XbWoL9MUv6NwcvI4nPjLjO+MIcJPxKC5+t4wtbfYO9brfVDBUltvCCtCuRLy/1mZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2843
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 12:48:59PM +0100, Jan Beulich wrote:
> On 13.01.2021 14:11, Roger Pau Monné wrote:
> > On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> >>> From: Roger Pau Monne <roger.pau@citrix.com>
> >>> As with previous patches, I'm having a hard time figuring out why this
> >>> was required in the first place. I see no reason for Xen to be
> >>> deasserting the guest virtual line. There's a comment:
> >>>
> >>> /*
> >>>  * Set a timer to see if the guest can finish the interrupt or not. For
> >>>  * example, the guest OS may unmask the PIC during boot, before the
> >>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> >>>  * guest will never deal with the irq, then the physical interrupt line
> >>>  * will never be deasserted.
> >>>  */
> >>>
> >>> Did this happen because the device was passed through in a bogus state
> >>> where it would generate interrupts without the guest requesting
> >>
> >> It could be a case where two devices share the same interrupt line and
> >> are assigned to different domains. In this case, the interrupt activity of 
> >> two devices interfere with each other.
> > 
> > This would also seem to be problematic if the device decides to use
> > MSI instead of INTx, but due to the shared nature of the INTx line we
> > would continue to inject INTx (generated from another device not
> > passed through to the guest) to the guest even if the device has
> > switched to MSI.
> 
> I'm having trouble with this: How does the INTx line matter when
> a device is using MSI? I don't see why we should inject INTx when
> the guest has configured a device for MSI; if we do, this would
> indeed look like a bug (but aiui we bind either the MSI IRQ or
> the pin based one, but not both).

If the IRQ is shared between multiple devices Xen could continue to
receive interrupts on that IRQ, and thus inject them to the guest?
Even if the device passed through to that specific guest has switched
to use MSI.

Maybe I'm missing something, but I don't see QEMU removing the INTx
PIRQ binding when MSI(-X) is enabled for a guest device passed
through.

Thanks, Roger.

