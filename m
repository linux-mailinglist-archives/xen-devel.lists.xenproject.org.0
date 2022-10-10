Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECF5FA225
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 18:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419293.664060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohvta-00053X-Bl; Mon, 10 Oct 2022 16:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419293.664060; Mon, 10 Oct 2022 16:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohvta-000506-8a; Mon, 10 Oct 2022 16:44:50 +0000
Received: by outflank-mailman (input) for mailman id 419293;
 Mon, 10 Oct 2022 16:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ILM/=2L=citrix.com=prvs=2752edee2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ohvtY-000500-Pr
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 16:44:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6f547af-48ba-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 18:44:45 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Oct 2022 12:44:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5927.namprd03.prod.outlook.com (2603:10b6:510:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 16:44:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 16:44:29 +0000
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
X-Inumbo-ID: d6f547af-48ba-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665420285;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mBqbcUYOc9zM9Qw0osksRarxI3Qusap2bfCtB6fbxlU=;
  b=eu+gEZUFgwzHTJI0WSAnnl8T7ZiMlrXtdaKpSOzBCKDvTljIT3VHyMJN
   1VfwAKdlUl9IrO0RPQ/fHiIq0kqchqlhizinb2kzOdjb4CnNbhH9FHuOi
   L0C/5muo9/8Xd6apKMdqoTN+oIzfRO0kVWR7VXzfC32Fj1CYrojnbMQVa
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 81511096
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1oBkkKOs7DAkDhbvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUpz3zcOx
 jEaXmyFbK6OMTCjLtEgao/ioUoAuZCHmoMwHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr4GtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePqgUpd5uGTFy2
 fUeMwxcMQ+ZoN2f3+fuIgVsrpxLwMjDGqo64ygl5xeJSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+BTM+/tfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2iL127aWxXKlMG4UPLuq0Pp3pmes/108NCccZFGQiqS6hFHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoIY38CRA5cut37+tht31TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:fgrLj6D5Cg8hPO3lHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.95,173,1661832000"; 
   d="scan'208";a="81511096"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAkajMTzyOlGP0xqfqzPHowtvjqfgST8S1GC8R/1IK6+NKXHmV5JJd5uWzbZ+/D51c0YwRw05+JgDBh8YazXesm87cc6f/8hQigDQA0lVed4WN/mHEYHZbs9o39KCK4yLEJ9ilnmvHkwAb1m37ef2k2qCDWlKjlyzzkuMQc9szHKrgilaisXf2D8chhC+H45uwSm2EhhAcfDnqfUawT11DwaoGhjj5ty5TUw2DaN9DGJzCcByzTsVGVINVGb1/4eXoDsRQgFsuXDQ1zMJvgAu28JF0VhijofMF/HiOhBFFhsbU9PpeZgdl1eQspsdCthekFfPYQ5I9rAGx7PNvU+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBqbcUYOc9zM9Qw0osksRarxI3Qusap2bfCtB6fbxlU=;
 b=TZC9MLHbzGAGyeXFw6CU9uOcu8yfMqwDGkRmi8YWcTTGz0bftEQefUXIlxQfsgV0TGREdY/wKZ556qHuU/JePzekeOGiZQXQ7DnN9Oimg0a13C5oIlKF+GBzx5kh0EkCjImBGRmpi/JYPMDxUTTdtCmw0iOHjDIcF95381XERpdISezwErzXnMtw4rc1yja3254gqq7e6Nk/m3LkPJ6LuEmapd73WAl169n6518TufOqlp5d4p9G6wgyGWRN5IXpKEF2bOMuthGRDiUQbj+JiY8OJ+ysY8AWrnmgcF9CCVbZgqWH3xNJC1ZZkVvBfV6s0u2iKE1c2HYaHHVQZypA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBqbcUYOc9zM9Qw0osksRarxI3Qusap2bfCtB6fbxlU=;
 b=xe7qzL9x31YgueuZG9T5zVpdTX5vu68xm3AF/Ez0bWlB2BwuG6pEf6HJMJCzoYgyWymn0Btyd8FDR2h+EB0tc57CwnrrnMGNIOSqQKiCEY4zekHm9rdWy7l0/MI3/o6/cbRjAY+WR/14XhFJQ3HsSMhNH9vh9Z1Xwmsx+jerJ84=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: respect NSCB
Thread-Topic: [PATCH] x86emul: respect NSCB
Thread-Index: AQHYyNP7HPEYuhoQC0yvtYIRC5F8064H/XmA
Date: Mon, 10 Oct 2022 16:44:29 +0000
Message-ID: <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
References: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
In-Reply-To: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5927:EE_
x-ms-office365-filtering-correlation-id: b54173e1-43d4-4e83-553a-08daaadeb37b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 atlB1CyMfyYPsEHYMTbynaW5/UdlIcY7Oh+Ap69yVa+djp0UFFJn4DmiSPUKoXSvnz922jGHemuwQD2ARL/x502i0n6UD4wHctZhHYy7L0R/hz5DXcc6KhUzjoESezM/m6uAlB+oXvRsaBnUw9NmYLDv2APfxBGzuAuDYEJSk5lolz40h42/cR9a5eWmkuEGjW9HPjCWd3VPyOzE+m0VhjC7S7asoQ2Y+WYpiVYrWfzRLgpXKJE9ZLAdobQ8TTG1luXyWjLjYhFo9pV8LOurfr+bHkS/7ye8L1312mysX6IULsT8WR1Q+HQdqkKuGYOtTBrdZqWmZbx8KwQCpUAYjSW2mOrGHNrHUedW3oZpGmHk5//+BmfhKFHralE4qXY4HJmY6n0h74iZzUfPQ3gQv0G+wI97gX3S7J1MXhM/5e+0dsXBKqTAGS6/Kb14LVFjdYyUGO6OUU8Cmli+tJB4CsVw08rSSZ1EnqpyV9RZ5qXOER5+4cx4FiDTbyEVPW8DzqMsybGd4bzVNrJVpnbX57+Qmj6+aXxDrsIfaQ+X+y/MZmp5DH7HQURtoU8M2ImAf3DxmyRipKIT9EPrNavCfXS4oyIZMtrc5dQ1UIcNqxJIlUKYXivU4CVrmebfdvj+R+THPxBJ/coPLFBZ/vVOHoCB1EGfD4c92SqFbCXP7FUuwAJIkVfqZzomEmLAAqTpv8TLHoLVJYHxMIB4Ue0ipg296PsOMOqzv5V/q5ufnz5J9MlnMLv+VZCnbfr/PmPrKO6bu7kDikhUY4ry+5mWzKDGGu7QqxZm0EBVZZetRe96Px7j2bkSRLMKbBmZNPXKjGmV1r1R+q7u66sw3uQgNQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(8676002)(5660300002)(54906003)(6486002)(71200400001)(107886003)(86362001)(478600001)(41300700001)(36756003)(110136005)(4326008)(64756008)(31696002)(316002)(66946007)(66556008)(76116006)(66446008)(558084003)(66476007)(2616005)(122000001)(38070700005)(82960400001)(8936002)(38100700002)(186003)(26005)(83380400001)(53546011)(91956017)(6506007)(6512007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1BlY0tkZ3NpRDVJUnJDdVc2ZEhiVXdETlU4QVYxejFxT2dBWm5YWnBMaUQ0?=
 =?utf-8?B?Q01kSHpadjAyZDgwRk8wSWpkdG4rVEpPSFl4SjI4WStOb2xFbjByLzBLaURx?=
 =?utf-8?B?RUR2c1dCV3o3RXMrUFNKVmtvaVVnNEtsTFlkdlIrUEsvMVRSdSsrelJUNXIr?=
 =?utf-8?B?WFJMWGJaYVFSWFFOYml2R1lHVG5wNnd3OUs3c1Q4YVhGZkFQNnVwY3dhcm8z?=
 =?utf-8?B?ZTlrY2VodHdabGptcms1TEU5MmIvY1lWVVJnWld1NnluOXFQRGJsZlp5akdE?=
 =?utf-8?B?V2xLTkhtRmVPQXh6d251U1BoSGI1aU1zVWQ2MFpaVlQ0a0QxdVUwdlNla2xB?=
 =?utf-8?B?QVd4Q2RUL296ZEJGaWIwUHBNUDh2dXR3Q3M5c3BQTUNmOGJTMW1uMFI3TVZJ?=
 =?utf-8?B?MkNjRmxyMHlxOWd0Z0pyNjQ4Sk5RWTRNUlBIR0ZlemhldmpkYnp0SUlPQ25k?=
 =?utf-8?B?UDNBVGtpUHJkdUpWNXdRVkNiQVA3aEJvWFBzOVArL1VNLzZWUG5CUHEyeWFw?=
 =?utf-8?B?UVFqaXl0bkNCajlXcCt6alN2MWoxNUpYdmNiYXE4RzdlYlZ3MW9CeTdpNFVo?=
 =?utf-8?B?WktRL0hqWll6b3Yzbm16NU4yT3pGN2RsMmtwUVFvYnExL3VOdkNzSXh2OVNY?=
 =?utf-8?B?ODlNT3JJNUtrTVRsalQvalhTc3pnK3pZY1d6VEhyVWp3OHRwRHdCcis0aHpZ?=
 =?utf-8?B?ZFVHTkJIR05ZU1EwTWx5NklvWFY2OVIzbmhpRDZLa2ZBcGk1MkxzMnlJZGRL?=
 =?utf-8?B?K0VtR1VQdXVrRldVdjhyOW9IRzFtWFNnQzloK1BPV1FRVTl3Yzg0MDNwMEFo?=
 =?utf-8?B?Tm4yaTJycGtpN1ZFVW9NRnUzeWppcWEzZ2kwcUUwd0ZjTmdXdlZSVTh3RWlx?=
 =?utf-8?B?UVk4WUU1cW9MQ1k3K0pQUGlTM0hPWE9LMmpsZ05lcm92MDQxVEhRUkxPRkVY?=
 =?utf-8?B?RXBKZ05XZzIzYWVtNDZSUXBlVEcrUldqbGhGbis0enI5ZDU5NCtQSEdOQTFs?=
 =?utf-8?B?cC9yMjRxeEJ4QmJ4MklEb2FkZ3d6NForcW1ncGJHTE1vOE92UHBsb2Joemxm?=
 =?utf-8?B?bzdVdGd2a3ZsTzRWWFZsM2xFRlZDWVA1UXhSSis0bS9mTTNzdmdJU2FWZHlN?=
 =?utf-8?B?VTViOWp2SUd5K0ZhLzlaQStXMGduMllKUVN6U0twcDI4Sm50Z2JkdGtKK1pW?=
 =?utf-8?B?bGZwa1RqT0NONTNqWnhQRWRya1JVMkhTbzcxeHYyYllYOGlCRE9BZE11RE5P?=
 =?utf-8?B?VWhUWXBEUlgzNlpCbzd3b2syeXlrZEtjRC96d2thbDNZWHpTaC8rWTlYeHFk?=
 =?utf-8?B?eWY3K24zb3NSancwRmxtYk5ENHJHSVJsdkcyOVRRZHJsSlY4NTJZSnJTYWMz?=
 =?utf-8?B?YVlRcTVPdVU0RXFMb1R1d0tCRnZvYjhYN2NES0NqRVgwQVFodHpZTW8yQTRs?=
 =?utf-8?B?STI2eDFsYjZxZ1JhZVVSMGVKZ1lCd2FORlJBYnFUdU1taW5LdTJ5eG9VeE5w?=
 =?utf-8?B?c3NGOEFIZlhzaTFYTkRhTkI4d2l4K21ibjlPdU9GaGVTTitKY1dDZCtJYmRl?=
 =?utf-8?B?UTRxbzExbE42VlczL1pjQ0tsOVcrdkhDcnJJdlZIUjNFZmdqNmgzZXhNSjZN?=
 =?utf-8?B?OFNGWXpGanh5dkRUajFPcERhVGh2QW5aNEpPYXl5Q3FrVUQvbVEreGRTaXQ2?=
 =?utf-8?B?STJ0YmpmK0lxSDVGMTQ2TFAwbUxrRUZ0YW5Ed2YxTzhyU3YyNlRHVkJULzFi?=
 =?utf-8?B?T1lEQ1p6Ti9vVDdBN3hwVWhuTGlZL3gyMHhKWlhyOG9ZcjNJUXc3Q0NvS2gy?=
 =?utf-8?B?R3JNRGpFZjhOTnlTbkpGUXM3OXQ1cE9vS3FZRXlVWUdMeGorRHhESlEvNUFY?=
 =?utf-8?B?N3puN1U1Wkt0bnBZQktIMDFyZ0hwT1FGejhwaXpaN0ExNDllbkZuSjhIcTBP?=
 =?utf-8?B?SWU1R2xJTVNXaTJUeXJFbDF2QjhJcEc3cmJxRTRSSEtCb01TOHVnRDhQOHlt?=
 =?utf-8?B?WEUrNVlzenhQaFNqV0hFbmN3UExpd0JDQWw2bEh6b0RXNVZOcHVkTEZGb2Yv?=
 =?utf-8?B?UWt2TFREakppUVRQUzhCQmQrSGJHSk9yNWtrbHpaRjM2czYzcndzYlptRU13?=
 =?utf-8?Q?hNFQf0vgxDNkw3O1DmO24fz8w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2378EFE801FCCA4AAE02D6A15F075545@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54173e1-43d4-4e83-553a-08daaadeb37b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 16:44:29.6700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vXzLgYeFoEOMU0OziNuExd6gP8rRSgNwwOcejGgMr4wsKUGx0uWOgL0CAm1NAnyuvlO2HunBYcVZdQ0AOK/Sr+ETUgSo5180PJXniDogMXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927

T24gMTUvMDkvMjAyMiAwODoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IHByb3Rtb2RlX2xvYWRf
c2VnKCkgd291bGQgYmV0dGVyIGFkaGVyZSB0byB0aGF0ICJmZWF0dXJlIiBvZiBjbGVhcmluZw0K
PiBiYXNlIChhbmQgbGltaXQpIGR1cmluZyBOVUxMIHNlbGVjdG9yIGxvYWRzLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

