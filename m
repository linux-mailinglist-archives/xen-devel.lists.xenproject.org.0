Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4FnBKc1TMGp3RgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:34:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E852468972D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="P4dj4c/T";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338556.1599619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZD4f-0003zy-T3; Mon, 15 Jun 2026 19:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338556.1599619; Mon, 15 Jun 2026 19:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZD4f-0003xu-QF; Mon, 15 Jun 2026 19:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1338556;
 Mon, 15 Jun 2026 19:34:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wZD4d-0003xo-Hx
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZD4c-007Xdr-RJ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 21:34:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3053b1-e002-0a2a0a5209dd-0a2a450bd870-10
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:34:18 +0200
Received: from [52.101.43.5]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3053b8-212f-0a2a450b0019-34652b055f93-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:34:18 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV1PR03MB989609.namprd03.prod.outlook.com (2603:10b6:408:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:34:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 19:34:14 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amrqswVXF17eZ5Gx2w86j4TMmFblloCE20EV4Zc1UXj1gMTDi+uchI8EjFKZmKux0vmii/5+h12a7Gg2HwsDenYCE76gi5amBsOlwrz/fI3op8XfF+A42y+1dTqex/keh3BqauL5MIW9sM8UZkeSKpOuq5u+3HnnL4PG7h0wiP5MknW2sgGfyGfe59Y6we5QC3cY4MGfbxFSwlFoR2ERT17ZAo1VjMq4UyxORdhNO2VGRmqg2VWbw/LFz7fdm8z0WY7HeqNnRpR1BjJeUszuRlghPZgpivvUHhXDDJ4QxgJwz1XQeA6ZOxwCd5N28Ys3K1WwBeUcUoLK6wx3lgK34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6aSlzydHYF9pgKPn1kSt8F5KMI/Y5LhfNx96QOGIvU=;
 b=vl8ujNFWM4l41hTbNCtAH0fvl6SWNviPSKqXkASl/Y7EiS4ASZdHIaFyDJuPKV54iHCbhJI3zBzYDlQSBfbjriOPJ9Fr8OJPsjEzpmzCV8xWGSOL7TxwgP8sS8KFzRc7S4W+AIMGsJELzLQ6JI3nzZDTAXsVSF0l2z0odnEJlVIgaC53zPfqXOjTS1DToxGrAyz/VbDqdGxVL8K+f7skAKoFgAupDNC7d8IX/di7t7J4K0IPRvMtjAyvpoS/nHj4fUZj9SiJzlzS6OeDgEJrYY3C095W5VIoRP1JUVao6Yy3m4MzVOb5VGA7RB3IygoXBOtJW0ZP6kEX1YGp9kLs6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6aSlzydHYF9pgKPn1kSt8F5KMI/Y5LhfNx96QOGIvU=;
 b=P4dj4c/TqdSxWAowdXSmj78lpc2E7+Mzv+uLuSnQtTsofIlzq326CAg/Yf/5FhFrHdpPOXvPL69ggNPUhRDYMYPOqPEzgaT5JVR2Y5/YUFaVzxBZ5rtuj6pVzF32Got1inaXmRqfKL05O0T6lh63lN1uFFMH1bKKn2IJosNpPDM=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Gerald
 Elder-Vass <gerald.elder-vass@cloud.com>
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
Thread-Topic: [PATCH 5/7] x86/kexec: Implement new EFI load types
Thread-Index: AQHc+CbxFmOq1F1kZkKmEXG/eV0SdLY/euqAgACCoWM=
Date: Mon, 15 Jun 2026 19:34:14 +0000
Message-ID:
 <BY1PR03MB7996FE744B091E767809F62BF3E62@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
 <1224fa79-d1df-4382-9829-aa2eabe60d5a@citrix.com>
In-Reply-To: <1224fa79-d1df-4382-9829-aa2eabe60d5a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|LV1PR03MB989609:EE_
x-ms-office365-filtering-correlation-id: fd2ca36b-8b88-4350-bf6f-08decb151511
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|8096899003|38070700021|56012099006|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info:
 JwLnMrcAEY5/sRCc1LWS42h+QNgg+2UENmVXIYVStIIBzbelOi//gPX4so1B59uxr+/PxvXd+/BJbUHfjZFuaK0yYteITeylbkjBE8Q8g2r9P7z1XAwJ4Y+OABQ38OLQHxLJODSMCAonRelh1GLNCJ8Pd4IW9vgO77b0GuaYoCk2uiTaeY+RHAVzmUaQ7jv5cFWkXV80ISe/reGX3iAyK7YqZnIw66FtUNx/8LkVGVuY8elArENgdFOlphg1/Kzk5P4w2/wSJFy5vWiR/q0dP5qPSfUmRwxiDexBjaAW5NQd/Yk+NqAayzbU6AcgrrtSV1VABwgtE2UkzZRPfSKVcPdtstF5fpPMkJmHIv7hJwnqlb+PCBxFHfLm6EUyYea6XV/tRkj8U7OKPNvx3MuPT3XxjRVZFPb55USxDbi9fFUi6xjgn5JwptA09qSKPQbfGhRCIj7JSXAGuYaKlEzvEtKfHr7vw2xy8NhG7Cl3CTM39Vwdv9htd/VFeuQ1pQNQNrlMX44yQjOKinHwxWgX6wDzs80uf2nTLAdQilOm2/wD9mJsxyoZVdHNWogtyf94GDuDlVueMIlHgdmZQ8my4cIDcYAKGmr2Bd7tYDoJPFUD3OpZhBn9jmInaRVhbiENRThGftygCZmYUSnux8mRe+p4Ch0QShhZhnrN4oV4mqw7ayjm4qeS4Jh2A+9HGRELdEH9NlTTpWghoxZtBJefG9YGgwEKywmN+8znDmUp25Yi97Bl+9EmoUSGBsxNjqgB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(8096899003)(38070700021)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mFANomf1qmm4pileElkwEKVSopPILUp/uBy3jiYYsPyyGheCvMSuU8rHMj?=
 =?iso-8859-1?Q?jcKQXiSrbCvWCzK1/g5TCZFLtQ+T0jjRvAyNr1J/AITbJeQ95HC5C4ScEW?=
 =?iso-8859-1?Q?aWAfnwVg0kjg06uXnZcYTVhfYW4x+2AI1J3vC+agebksuvYVH/alx3uxnK?=
 =?iso-8859-1?Q?ofOmTKVQaS7pfplrGHBVhBucLQdVl0K5+DJaQyFRvRhBKgdgTRLUGg4ovw?=
 =?iso-8859-1?Q?H1SAp8GX9PebhXvQ4noSUq91/fnppdxi2hMwSQKKVnMaisutjRqDgjipWS?=
 =?iso-8859-1?Q?leH/47Of8SfDQrM2NRQv2raFZuh62Fyn2SQqGQlq9xRxmV7h8xjldZGcea?=
 =?iso-8859-1?Q?+5aCiX2G/lwCgejfRSQZpOP7HJ2L5wPQEd6eBLVTOWckxH3GfRcHokzKPJ?=
 =?iso-8859-1?Q?nD+6+vTw/FGYGMgYUzRFmFplCMzSHwBdC8JvXrKWFjXwcegejHghSGkqfH?=
 =?iso-8859-1?Q?f/FCJ/2bC1RPGTby2/gqPnhZixP69hv3xNdEnJLI4TVJDOKicwV1kBEXEE?=
 =?iso-8859-1?Q?XzYoNwAm7pXelpiPNyRcNpaTgdQCNyF03znahBMn4nzxmVlq86GatPUGzN?=
 =?iso-8859-1?Q?q5h8Vuv7IWX9Iv5fUDKxoxiZeahgRldxWc6pA7tglmrc6Gps/Z7nwWFHj4?=
 =?iso-8859-1?Q?65afnb5nyUe/BhNBBUH0XU/8ro1PkBwNk8zQqNtSRVZwYRFXr51uYlzfn7?=
 =?iso-8859-1?Q?g2vK5zUwoPBJTFx4hmtH4a1WEr85fVI4eXpY/5JWwxmWzBtjPupSHHpTvQ?=
 =?iso-8859-1?Q?qFpIwptJdjoaWs3YeYUryX8Sqh87wJpPbooGCk6+S7VlW90EoGptYD6HXk?=
 =?iso-8859-1?Q?5F3+TMYlhh8aHGBiBDVkl9nuLrnR4O97KDN7fptydK14lmreILSKuPTxHs?=
 =?iso-8859-1?Q?3W6dTnZuLHZvcZr+dDcRBoUUrqq1rxEU2vTPbi02lm1/tMLaw+LBMuk3yE?=
 =?iso-8859-1?Q?EKxg5UbMwsqKVaZfM5vHZw/STR6VP5Cr/3pP4bX27LkjWAYGgtq5Ipru1F?=
 =?iso-8859-1?Q?YPGeHl48BmmDRaMqDYusBPSMv1ZSCFy1YfaXshi/OjGWR1K0rZ//VoPwJD?=
 =?iso-8859-1?Q?rDeteOJvM+Ty/5hdPeLhWXytoKjeSxuPYmUKyu8wOn+IwpItZCykycT6G9?=
 =?iso-8859-1?Q?FztLjFDa9AiRNnVEQjBUDWsIEiiM5ifIIIdRJazL6G3kSbFmFG8Me++e7y?=
 =?iso-8859-1?Q?Pzekujt8ri68frjR8Hec12pn84USLDb474Bdr+1vnIiW/+sgDXh/tzkbkU?=
 =?iso-8859-1?Q?gWEgoBdmpC5Dxak4YhzgIkGbU3DdoN7UIKtvHB3WXVsXiaWymD24r+VRgA?=
 =?iso-8859-1?Q?+bd1nv7AK0PXdNVE3lA0sd77qCh8O7H6NoQChauU0zvybuzZNWiCvDU8un?=
 =?iso-8859-1?Q?WtwR3k0A0tXDDjDg+MKLaALEHLUrVlzcwAQQ4FYFG8e4VTY6+MVihBsUvv?=
 =?iso-8859-1?Q?txFzwyC9ONvh4WRU5BZQuQ1IVDi5EE5gDg2uuvP3lxga+ds+ui/jA+nFXI?=
 =?iso-8859-1?Q?IcnZOxggZgMsniBligTVh9P4zDTfIWT4jIlhp9goeJzDVnCmFe9vI0gJia?=
 =?iso-8859-1?Q?BbiJvZcsolPWDAyZJA5RXxCl1Kz4xxNKUbEZJrAdfbrplNAqKPoYmjCEsq?=
 =?iso-8859-1?Q?mGNyTJR1W06FRokJdsEFpGIQOTtz6BaSkJZEfkQw+yJiyn7AUP8jCtqsrA?=
 =?iso-8859-1?Q?2nu2AFoTqQPBlV+v90RL77A2HD5EZ0S6x2Y22Kf3OYVdfmUwJkYAZSw+BW?=
 =?iso-8859-1?Q?eFJBHGvdj/7gotAq+pz4lA041NWC6jFvD9gpEVYWfXpKiy?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR03MB7996FE744B091E767809F62BF3E62BY1PR03MB7996namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2ca36b-8b88-4350-bf6f-08decb151511
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 19:34:14.1120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RqWcorRBXRept/ShYDq/W8mROUr7dN2FKjioMQ66Sx/zT+zSrvVHxZ4H9lEbrOdMUEajRhEU435GDxsM2skBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989609
X-purgate-ID: tlsNG-42698a/1781552058-19364F3B-BFBC810B/0/0
X-purgate-type: clean
X-purgate-size: 6913
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:gerald.elder-vass@cloud.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,BY1PR03MB7996.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E852468972D

--_000_BY1PR03MB7996FE744B091E767809F62BF3E62BY1PR03MB7996namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>Ok, so here is startup_64, hidden as a magic constant.
>... you're applying the alignment to the pointer and picking
>startup_64 out of thin air.

I'm going to be cheeky and play the Linux-does-it-too card.
https://github.com/torvalds/linux/blob/master/arch/x86/kernel/kexec-bzimage=
64.c#L660

>Either it was loaded correctly (and the alignment is correct), or it was
>loaded incorrectly and this is unsafe to do, is it not?

This is what the kernel kexec segment looks like in memory

                                          .- dest_maddr + alignment
   .-dest_maddr                           |
   v                                      v
   +--------------------------------------+--------------------...
   | padding            | real-mode setup | kernel
   +--------------------------------------+--------------------...
0x000000                               0x200000

In the old non-EFI kexec the 16-bit real-mode setup portion is
chopped off by the userspace tools and the segment buffer that Xen
receives is just the "kernel" part. But we need to pass both the
real-mode setup + kernel to kexec_load to pass Secure Boot
verification. And add padding so it straddles a 2M boundary like this.

What the 0x200000 "alignment" variable is doing is skipping over the
real-mode setup and padding.

It won't necessarily be 0x200000 though which is why we need to read
the value from Linux's setup_header->kernel_alignment.

If you're hinting that perhaps userspace should take care of all this
and just tell Xen where startup_64 is then perhaps. That would be a
bigger change we need to get input from Ross on though.


--_000_BY1PR03MB7996FE744B091E767809F62BF3E62BY1PR03MB7996namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>&gt;Ok, so here is startup_64, hidden as a magic constant.</div>
<div>&gt;... you're applying the alignment to the pointer and picking</div>
<div>&gt;startup_64 out of thin air.</div>
<div><br>
</div>
<div>I'm going to be cheeky and play the Linux-does-it-too card.</div>
<div>https://github.com/torvalds/linux/blob/master/arch/x86/kernel/kexec-bz=
image64.c#L660</div>
<div><br>
</div>
<div>&gt;Either it was loaded correctly (and the alignment is correct), or =
it was</div>
<div>&gt;loaded incorrectly and this is unsafe to do, is it not?</div>
<div><br>
</div>
<div>This is what the kernel kexec segment looks like in memory</div>
<div><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; .- dest_maddr + alignment</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp;.-dest_maddr &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</=
span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp;v &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;v</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp;+-------------------------------=
-------+--------------------...</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp;| padding &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;| real-mode setup | kernel</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">&nbsp; &nbsp;+-------------------------------=
-------+--------------------...</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Aptos Mono&quot;, Aptos_EmbeddedFont, Apt=
os_MSFontService, monospace;">0x000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x2000=
00</span></div>
<div><br>
</div>
<div>In the old non-EFI kexec the 16-bit real-mode setup portion is</div>
<div>chopped off by the userspace tools and the segment buffer that Xen</di=
v>
<div>receives is just the &quot;kernel&quot; part. But we need to pass both=
 the</div>
<div>real-mode setup + kernel to kexec_load to pass Secure Boot</div>
<div>verification. And add padding so it straddles a 2M boundary like this.=
</div>
<div><br>
</div>
<div>What the 0x200000 &quot;alignment&quot; variable is doing is skipping =
over the</div>
<div>real-mode setup and padding.</div>
<div><br>
</div>
<div>It won't necessarily be 0x200000 though which is why we need to read</=
div>
<div>the value from Linux's setup_header-&gt;kernel_alignment.</div>
<div><br>
</div>
<div>If you're hinting that perhaps userspace should take care of all this<=
/div>
<div>and just tell Xen where startup_64 is then perhaps. That would be a</d=
iv>
<div>bigger change we need to get input from Ross on though.</div>
<div><br>
</div>
</body>
</html>

--_000_BY1PR03MB7996FE744B091E767809F62BF3E62BY1PR03MB7996namp_--

