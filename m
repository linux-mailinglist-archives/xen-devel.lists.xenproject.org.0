Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB036C96D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118721.224961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQYY-00011a-9d; Tue, 27 Apr 2021 16:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118721.224961; Tue, 27 Apr 2021 16:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQYY-00011B-66; Tue, 27 Apr 2021 16:27:26 +0000
Received: by outflank-mailman (input) for mailman id 118721;
 Tue, 27 Apr 2021 16:27:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbQYW-000116-Lh
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:27:24 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c003f525-04bc-46ab-9c3e-2f0a1fe80b49;
 Tue, 27 Apr 2021 16:27:23 +0000 (UTC)
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
X-Inumbo-ID: c003f525-04bc-46ab-9c3e-2f0a1fe80b49
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619540843;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bV0mfb941fe4d/uke03OXZCDUbgJbx6pjGuucBkrI7A=;
  b=IqhvLWXqi4dNEynH2QEcW0jfJBX6Hmf5BsVXH2+uECRJ9mm3mR4PCI9J
   TLIdibaNfbNy7+rL+JFsyNJsAfmQ+Dmbp1cyyj1McjNm4mWHAM7EosQ9+
   o5rOv1oMcARrE5xHB5mo9tLNIx6Hff2jbXJewZUPh8AeRPZyWJt9uIYUj
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Sd1pSDfj37GY7Oe+pIwBawbygO+D74GEwl+X4ZNRo9BIOBu1OMQcxk90ZIm8eE8QHq+NG180C7
 BLRu6bzJ9+18JgqVgM7Emy6Z5SxfWzO2vpikIm9YdzHRgAYXbfptl7Twm+qLel3jMJQkv2nefD
 iWaaNkEpMf6UyIA8fUbTQhDeHo8qc/+NqXZfYjSriXRCKFLPbdspKgs1GGbouPvNUge0K11THD
 sVlFsp1TLHmju6yWEDtJosl5Oxs90XFrpI7VmqKw42lchjN9ah52gPIf9rZPWOe8h6+uUFPwhP
 K/Q=
X-SBRS: 5.1
X-MesageID: 44032189
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rFnuR695HJc3KAYgOvhuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="44032189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwWs2eTAODuv0hJBY6W0uMNBkF9FK2N8nBiaGC5bMnLuaNXsHO2LGLh0JGaeSR6IR/YIe+lH+MXHgs9TXwsOQ9qVIrKbfIlH5HOeRzTWYfLMdmSHpv122wJWfWg9s5gvUiHQz/ARolscqYbgIwXSzLBvmxBKlI1nynllW0l1Y0+nEVaCdg60+HFYiAwwQQfzH5CZIdQvLYnttQTZ3RnvFFyuZCujmZEv36938WcrHtL5iOLERHKB0t0zwZtcE3SpTiJqxjSBiGLzbj9XljBDoZMHpKlQ519OQHDc+3mNAJKBIym3dCLHjfKono0tQ2tGwZu8dminYRVYi+8U3efZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWOmSjSkEwI1z9Uzn9NpaSo1L4nV4SOTyRWOmQR/87s=;
 b=PnRCFBO6a6N59gqT9VNtHmNMIv8PEHalBQ21005Egn2ZKaOcbPD5/mdjayr67uB9+PZzetdFQFWckYjmRYSU/wL7rg7rEvv2WN9X75i/QRaMnPl09b0WmMA+6jcXGvEen99itF1g0Sgic6rWYIvstLcMPRQQlqYHHsrRgUtSSpRoSGzDPGtWGNKUwgUCpemBXJhtxhoLxP6i7RFh67PeJEYiYiDPhMPNLI7dwCHe2FQqCjtm2+34XKqAxOWy0wcdIXVdAEGl0NBgGwl/qZFeeKr6/uuEIY6tiZ3Q1B4C43KzdPyFBe22gWFxWH//JRfEmTJFvo0PDUhfZWV6JPLJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWOmSjSkEwI1z9Uzn9NpaSo1L4nV4SOTyRWOmQR/87s=;
 b=d2QzQ7lMMmy+8tWsaOWy9nXiTG3+QWKpJGdtph6JRIFX6tI1UtYguBp2QyI9saVteiZN+pNF0GYRowuyE02/3OI7Vy2TqxM8z6MCwH+0R854TLdPxGKUDjXDyZ+OtJdZiNa3niMTpQAdAoiYsDb86XcGLNFsFBt98tScE3sBxr4=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-4-andrew.cooper3@citrix.com>
 <d5ae2cf3-1157-d589-6c1d-8717a45a2753@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/VT-x: Enumeration for CET
Message-ID: <0cebcfeb-68d2-f225-11a2-6d39a4a353dd@citrix.com>
Date: Tue, 27 Apr 2021 17:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d5ae2cf3-1157-d589-6c1d-8717a45a2753@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a79213-cb60-4040-12e7-08d9099952f6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3990:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3990FC7E31100B3D349DEDEEBA419@BYAPR03MB3990.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txJwTPn1W8fhgYOlBpKmmg1i1wbASND7OL58Az0Ie5t/ioR5Kyih2f1WkVEwfMf9r1xg1/XyH1i0uFr6XX6QeF8kbHMGsmyJaNoyLM0b8orMxKLhw3q3KZ3UZ7Jjtngf1ZH4FsJIB5fsWL3rBVGim3hBkPjgTBjRUNk1QMYijltcLH2smEsbaXJ4+bhJvOjHZZCdCdjITPlvKnYHzaOzU6/DdDl8usjFFStbIfTI+R674GDmtgNGv3KTwqpzf5RCelhSEFQ5ND+9wrF+TtpsfGoTJUSQuSUp9hqNStQP6yV1vpDGBQDEukpmfFVKGLh+WWZVcX8JCt/BtXfFVB+dD17wBAttSY/W8zwXYTV/KQSWvwZFarMBmNmIgr/O9vVVx8fxuxdUueUer8q3NGg2LH7c0n/9mKZWm2hxvLIr57q8vYc/G/eyq2bujBXT2e7GeO1492TmP7fNDEUtMBp3qjUj0WIgw6cLcOmlYHbsaBzTe+MPhv0TLyRtpLHQGxj/Tn36uqhpkkWQwllDnaqAUM1IomULSbGiIvSdU5aZvOESKERzhzweM+htVCtXVHTjFbndxY5N6+DspAiTVhZhRdsieo7RGZBT7y/UxP6QShzzqzMWpL5GhroOsmTlt2Mzgiz8JoTZF2qTIYN5IJE+eA4KPCl0k3G8c00wEyyuwoxGDxievu3FTsvSiLu6bnbq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(8936002)(16526019)(956004)(86362001)(2616005)(6666004)(478600001)(186003)(53546011)(66946007)(8676002)(6486002)(66476007)(31696002)(38100700002)(66556008)(4326008)(31686004)(26005)(36756003)(54906003)(6916009)(2906002)(316002)(16576012)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1NRSVRHYVdSeW9JNmNGUkl2QWVSb0k2b1RndXVLV2trMG1HUHVybXYxMnJ0?=
 =?utf-8?B?N04xVDJlK3JpRUxwbFRRa3NyQlhQZ3lzUllDSDk4RENybGNoTFA0QjVJSmVV?=
 =?utf-8?B?bmNTTkRMWnMrUTV5Z21SSE1iTk5hRWFjN25EeGNEUVFSL3ljeE9mUHBJYmkr?=
 =?utf-8?B?Rm8wTWVXRHZMYXRIYVAxMjlpMXhmTTQ0dCtRZ2s4cFpncVpKaExRSGpURHIx?=
 =?utf-8?B?NWpObGk3ZlY0bXl0REl3Y3paV1hNNDRzRVZXMmlDU1J2VFV0R2ZKVFVqZnI5?=
 =?utf-8?B?MlhaUGYxY2VXRXVabUxKdGV1WFRlcDUwRGVnZW9SbzA1Ukxxa1QzWnFZSHl0?=
 =?utf-8?B?MEpOWm5rck9kL1FmVktkNWZMcDlYUEgyOXpPMXZIa01IeGRsUWx4UnpSZzhC?=
 =?utf-8?B?UnJoRmd0eHoyWVJZWXh5MzltcGgvZ3E2ZkJjbm51MVU3aGdnMjJsNzAva1Fa?=
 =?utf-8?B?eXYxcFdsRnk2OU9iNFhlRVMvWFFlWWZxNW5YS0N0VEEwcldEQjNMWG9zbTlz?=
 =?utf-8?B?TGhkSUk5Z1k1a29HYWtoTVUrNHRxNS9xOWQxL3FxSWw1OWpTOTJ4WlUyKzlF?=
 =?utf-8?B?MDFIL3QwcFhQWkFXZXMxWEtyREZUNjNlT0pTZ1MyMzVGNG5uc0NBN296bEVi?=
 =?utf-8?B?SjlWMnk3dVQraTBocEIzeUxDRUd5eDdVWlkxRk5BdHd6RC9hejI4b0Z2YjlZ?=
 =?utf-8?B?S1RPSlNIVVc3bDVxVzdWL1BCTm8vWnhLU2hsYldXNGM0YUJwZTdtaThlbEFk?=
 =?utf-8?B?SVB5enNaYmROaXUza3M3OUlkUnlrY0Uwbyt6WnVRc1FxSm0wZm5sdU03TFJY?=
 =?utf-8?B?MnlTd3U0Uk5Gd2VQaXg5MUdSYk5pbm9LaFg3VkNOTWdDSlVURTUvNHhodU9N?=
 =?utf-8?B?clBIT21QTnhEYk9JZjNybk9nQ0tCSnpBN251T2hQNzhTaTdTaENMelZsNmI0?=
 =?utf-8?B?RXVwRGFJTThkcktLL2NFK3ZYdDNRK1VzbFlmV3BJQTROY0pQekVDN2J1QndU?=
 =?utf-8?B?MzhTenRPVnVtTnBBMU9zR1U0SUp3QmptdWNmVW12ZGM0TXYvVE9OQi9ZM3BE?=
 =?utf-8?B?NHh1WndTQXRFM3V4YkR5S21zMm5sZFE3bkJzamtXNEhsbTZzUHlvZkpvVGV2?=
 =?utf-8?B?OHRETitsZHg1TUZ3WmFZRVFqcUxXemRVY2xkcWtDRmxCQW8vOGMySjVYSDNH?=
 =?utf-8?B?dnltOVlrbHVTSzJ6bDMwUFRndHdja0xuYWpVaXJoM3lwaTk5NFJBMzZVOHh3?=
 =?utf-8?B?aUZGYmNsdDRFZDJsVytmZGdRdHpLbjJEWnFSNmVVYmZpbm5LclZ3azQzZDZI?=
 =?utf-8?B?RzdUeU4xcXhqVlFwRHp4RVhSRVo0U1p5b0V6dE14WVhRQ2J1NnZsdXB2Ukdi?=
 =?utf-8?B?Vm5GN3FlMi83Um5PNzNPUTVxRTdPMCs3WjZwMTNvaWhMNlFsaWRLWVVZdVVD?=
 =?utf-8?B?NHEyZm0zNisxdHNWdVAyaTNhcnp2RVF0VWNwa0VscWRkVXB3Q2loSmhEd1VD?=
 =?utf-8?B?d2lzalNDT0ppYWNLOGR6bVpmSXc0ektZWDl2cVZqQjNZQ2p1RkZXTDl6WThF?=
 =?utf-8?B?UzQ0WDJIOUk2OW9yTjVrQlRTNUMzQXRWcW55VHpuVkVhRXB2MGo0UHgra2N5?=
 =?utf-8?B?d2J6ei9Ua3NDbE1xT0x6WXdnTFFZTHJjYzgvQ0tycmZJRzRsYWlDSHRqdURS?=
 =?utf-8?B?VDAvN0NjQ25uZ1RONmNhWW1wK05XazRuNGdpcDdzTUh5Rk9YY2tUcXhpSWxH?=
 =?utf-8?Q?2WhmHfRCJ0D+XdN1gWjE5BDRf5/io0vxAm9Vbzh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a79213-cb60-4040-12e7-08d9099952f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 16:27:17.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z6D/i3mzCSAO+KZVNMLebccK0uHkaZ88/mwmVQUDhLJ1WO+aBjOEqNEIWUja8S9PRQ48nJOpYaz5AsckPAn4YRK2eozsV87c/rViZbMfW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3990
X-OriginatorOrg: citrix.com

On 27/04/2021 16:56, Jan Beulich wrote:
> On 26.04.2021 19:54, Andrew Cooper wrote:
>> VT-x has separate entry/exit control for loading guest/host state.  Savi=
ng
>> guest state on vmexit is performed unconditionally.
> With the latter I find ...
>
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -2014,6 +2014,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
>>      printk("RFLAGS=3D0x%08lx (0x%08lx)  DR7 =3D 0x%016lx\n",
>>             vmr(GUEST_RFLAGS), regs->rflags,
>>             vmr(GUEST_DR7));
>> +    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_CET )
>> +        printk("SSP =3D 0x%016lx S_CET =3D 0x%016lx ISST =3D 0x%016lx\n=
",
>> +               vmr(GUEST_SSP), vmr(GUEST_S_CET), vmr(GUEST_ISST));
> ... the conditional here a little odd, but I expect the plan is
> to have the various bits all set consistently once actually
> enabling the functionality.

TBH, the general behaviour here is poor.

What happens now, as Xen does use CET itself, is that Xen's values
propagate into guest context, and are written back into the VMCS on
VMExit.=C2=A0 There is no way to turn this behaviour off AFAICT.

Therefore, we must not print the guest values when the vCPU isn't
configured for CET, because otherwise we'd be rendering what is actually
Xen state, in the guest state area.

Once a VM is using CET, we'll have both VM_ENTRY_LOAD_GUEST_CET and
VM_EXIT_LOAD_HOST_CET set.


There is theoretically an optimisations to be had for a hypervisor not
using CET, to only use the VM_ENTRY_LOAD_GUEST_CET control and leave
VM_EXIT_LOAD_HOST_CET clear, but getting this optimisation wrong will
leave the VMM running with guest controlled values.

Personally, I think it was be a far safer interface for there only to be
a single bit to control "switch CET state" or not.

~Andrew


