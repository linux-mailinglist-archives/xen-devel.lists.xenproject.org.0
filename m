Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F3969389
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788606.1198026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMuE-00019i-Qv; Tue, 03 Sep 2024 06:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788606.1198026; Tue, 03 Sep 2024 06:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMuE-00017d-OJ; Tue, 03 Sep 2024 06:20:46 +0000
Received: by outflank-mailman (input) for mailman id 788606;
 Tue, 03 Sep 2024 06:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slMuD-00017W-2V
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 06:20:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:200a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e32195-69bc-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 08:20:39 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 06:20:37 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 06:20:37 +0000
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
X-Inumbo-ID: a2e32195-69bc-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZja0t3SqrDn2UQ3qnJpZBKP3m/m4OlBnvuo+uUTP5D48tq2A2F2FoNfVO7hGNpZwi2imF0KDOnQAZEQEDDlVreLI4nYtfg7V+ALgvi7Bsfyc9bEbuzciJXeq8L9M8l0/Jtdwzflx6GMfJe6617UgBgzo30PPl8r6rgBtt0wYUj+5bxl8fv2ocjarLcAeflxY0NLX/AhB/dqJsPgoB1tTPH+Mm6Qe3cPUsKhlncIqMlsQFU2YzzO0fgaAnZpMpLlU0tfJ3AogbMfDpAwPhGoHft9TOtZ3r+pbneMi8BPoC3L8LzgwJMnMMLH6FdaIIOdXpNwHpgihjPkIB0EN+zM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luQBnLgaBEVlcBQ1m058lzuBAPrcnDd6kHP8mjZUDxM=;
 b=dASsIEJzVSQ0FZ46xOBGX6qDCaI+gIMzmfMm8VLBAKCskVkhL2dukDvw0kdf7xFX4hMHTVmq7eILzSZmro4u6NPNWU8z54meaHDYygp3E4nXeS1zpoQToZHqqe1Zizo8o4V/5DYqLwII0fSyrAe5uDirKB00r/MuE9acF/vc41DpEM+vwXEvffy04oFRNPbRGeFiZBq27m9btBWqrNXjBBFFd3bn2ZbjYWYcPncMizkwP9zR0AHFCnQWBqUUlXe9NNiXuYKqX297UEbz0R8sOkHwPZDza5xS2zIxa46d3HcP/E3m10ENbP0Cfz7Nsc0wQC9vVz6Bi4QWzAw7HfAugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luQBnLgaBEVlcBQ1m058lzuBAPrcnDd6kHP8mjZUDxM=;
 b=alw0qqbsL7hAra/zllluZ145INvOuRXeS/RjToZw1lNgXdQ7WuUE0EhSEpN1a57hjNyzD4sAOxs5YGORC8sLQQ9gJkXmbJkkBDxLomhEmzzeS01MpT3va3YXhTxle9DuEKQz7qvKVQ8BK6xC/QUk2QAKRo0kWHjPs+9YWdURuXM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa78ytu3Dw7+A5rUaTPQAvAsIAxbIuTvuAgAHk7QD//4uogIAWUUQA//+fTQCAAIfWAA==
Date: Tue, 3 Sep 2024 06:20:37 +0000
Message-ID:
 <PH7PR12MB5854D96C51A37B384F0A022DE7932@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
 <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
 <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <216ebf5e-75d2-40f2-bc79-65fe67e54bed@suse.com>
 <BL1PR12MB58490FB991A0851286858DE4E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <29326771-8e5a-4bf5-86b9-971be5edab75@suse.com>
In-Reply-To: <29326771-8e5a-4bf5-86b9-971be5edab75@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|SJ0PR12MB6806:EE_
x-ms-office365-filtering-correlation-id: b431d291-21d6-4e37-0e23-08dccbe0868f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEUrNXIwcDZ5dW5rd3I1d081NnlqMDFqcE9pZGY0bVU2NytLRDVoQy9OZnNC?=
 =?utf-8?B?emQ3UldYOUVWT1Z5SXdQdEQ3djlBTGZjeFdEN1orUEdERmlMdm1TVE9WU0N1?=
 =?utf-8?B?cnRDTEpZL2FxV0dWWjlBdEZjTjVBMk1RYlR1REloSjlReVZJN2hJUU9QV2M5?=
 =?utf-8?B?eEdRRWlCcFowT0xtcmdXdnJiZWlwQ0tjU1dmbEpVaVl6U2xrR0FyOXU3UVRx?=
 =?utf-8?B?WVVaRWllMjlvcnkzemVmbWltTURFcUZyT1o3Qjl2Q2MxLyswUTQwMmI2V2FM?=
 =?utf-8?B?cWtSS2UzT3dvUFFnd1lkRDk0MEt6SjA3cWZkWFJTL043d2dWYmEyTGc2bS9x?=
 =?utf-8?B?SEpQRmkyeWorQjRaRmt5bjJlajdlelppNEs5emVVWVNDR1YvOUdmWlZ3K0cr?=
 =?utf-8?B?MzVTSzUrWHBvLzZPZkdiUmNYMGRRWERseklaNFhJRWU3bVRLS3ZML2hWTjBv?=
 =?utf-8?B?anNFd1NxZTBQNEUyQ2FrajRaeEd3L2NzaGFHZzN0ZEk0YUZiTDNja0RFZ3du?=
 =?utf-8?B?QnhORUEySjNmV2VMTllmZkQybS9UQmhadWp5Q3JCSE1Fd1d3N2Z1WWIvS3V1?=
 =?utf-8?B?TG1FMzhmek9YL2liWUZtMEYzdjQwZGNhVnZuWFBlQVFVd0VDcjdPcXQrVHZD?=
 =?utf-8?B?cjBremJjVklVR3pZb3NzWVYzdVdIMlgrQk1JVm94dUdSWE5tM09vUTRmN0dy?=
 =?utf-8?B?dFlSbExPTmptSnlKem14dS9UNmpLNEJoRkpPMk04M3dJeS9RdkUzeXZ4SkRQ?=
 =?utf-8?B?bCttUHE3VGNpemZHOEZ5OUVOc2ZtRE1ZbHh4cHQ2czVJQkNMbEo5ZW93QkVr?=
 =?utf-8?B?d1lseGlqVTFLUlhhTlRmYUhYMXJvL1lXMWNQdmxuUDQvM3VIalhqOG5FRWY2?=
 =?utf-8?B?TCtLQi9CZi9aTEdqdktrVGUwdW91MDNLMytKZVRkdkVqUjFURG9ZTXNSU3pR?=
 =?utf-8?B?YVZjb1RoUlZnbnk1clNvNStVTzFqSVpaQ0J4MGgrQTU0WllxcXIrSE13VTFN?=
 =?utf-8?B?akZGbXdLSlQrVnB5UU9heC9RR2dpRDcyRUp3ZmFaVG5NMW5yM2h0VEtCSnNs?=
 =?utf-8?B?UWovNHVKSk9YUmVYNEgxUFlFc0pNcFRKaFAyL1dtYno5aXJJQ0NTNGFxU2My?=
 =?utf-8?B?MTZLRy9XMTFuNnFqTHQyN1ZpNDdCK3BMTGV0RGJqSmNvWDNXdVlqSmJVc1Yr?=
 =?utf-8?B?cUNJZEtpdTV6NkZTMU0xaWpRVDlVSTRrTWNHQTJGa3dlbXh0ZENPZzJPSlF1?=
 =?utf-8?B?N1pFUmtZWDJTbEFKVFdaUFpJYU9xTzNkNXVGMEtsVHFEdzBHQjZMSy8xTkcw?=
 =?utf-8?B?UWVhQk9kdkFYZ0JJYVVGT3ZEcjVmUEozSlVlTFVENWdBQW5LS1p3UXJiMDdQ?=
 =?utf-8?B?M25HSEFJdTJxOGNHdG1BY2VPOURSNUxUY2YrVzdHV2c5ZG8zV29jOGdZZ1Nz?=
 =?utf-8?B?NElXNmxGTGhuTkl2aGJlS3d2UW1wck1RT0JzNDRYL2k3ZVVDVFdHWUlUVGY0?=
 =?utf-8?B?UFBiekozV0FVRDltSURxUytWdTFiVStuT2o4OXIrbEZoSko2endXWFVIc1do?=
 =?utf-8?B?T1NGbndRZ0VrWU9TOGhoVlluQ24vUUU0N3VsWDg2N0U5TW5yNVhkb0VVbTYr?=
 =?utf-8?B?THlOSUFPNm5GOHl2R053ZE1tbFNCRVdpUXhBVitLdWJLUXBmMlJsVDFkaDRi?=
 =?utf-8?B?WGtSRitubVYraUtsZ3VQNk15dW0vbmFOVkY0b2hEZ0d4bUtwSTZlTWplbUt5?=
 =?utf-8?B?bkxDUXNTNWhuNE1FUEJWRVo3TGJKQTVzczdYRVpaSm5jMkV0V1VCcjdRMFdG?=
 =?utf-8?B?dGo0M0U2Y3liVTJQQ0ZOZjZsNzZhTjNvdDFBOWdNbVpqRG5JbHVSTDFPd0VD?=
 =?utf-8?B?UnVpaVlpa0NBb1V0ZCtZaHlxNCtkWThic0V6M2k1MDVnRXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUhaY1dXdEFWYTJGd2pkZHFlNDNrczd0L0lXdTRZWVF5YlV3cTVkR3E3OENX?=
 =?utf-8?B?d0xnb2VzblNwTmxSTXl5ZXA0aVZDWjZwRU5QUUpQeXpPYk90L2QwSEdBc2Ry?=
 =?utf-8?B?VGJEcDRXVnZWWGV2K3dtdkZUdjJlZ2VROEk5VE1TTDBuTUk0UTRYQ2liOC9l?=
 =?utf-8?B?WlNOdmtYTDdNVkRlMVFGSWlsYTlKc2dHeVpWQndLK1YralVZTWh6OTJZSVZX?=
 =?utf-8?B?TDRMT1FHZ3BITGY1dlZ3dExEd1JwYllVN2JLV1FoSzJhbFkwQStPY0hWdm4z?=
 =?utf-8?B?Y0lqOHhveWZnVCs0S2JRODdMSmJIQ3AyWDM0VGhPNzROZGprRmRCaktVV0Zq?=
 =?utf-8?B?RiszNEpTK2tpY1dxclRjam1EME0rSjlIMFFmR3IxOEpIZkRnT2RMc3BhTFJm?=
 =?utf-8?B?NDREWmFiVnlSMERiQmZIb1ZmM3g0RC8zNE94ci9BRkhkbEl4c2NzTnM2V3Ja?=
 =?utf-8?B?Yy96Yi94MC8rL04zN2ZaWlVLWG5HSG9JK3M4NHd1bHp5aFI2c3h5alQrdVF6?=
 =?utf-8?B?cGM4MFBUbCtIQ3BDZklXZ2QwNWYyZExHUjdvQ0tRVGlWaGZMcmxFZ3dPdk1r?=
 =?utf-8?B?S1VZd1VZUDE4cjlZeXRDeENacTZ3OXZMY2ZpdGd0ZkEyNEtDdFRsYStCbFc3?=
 =?utf-8?B?OUQ5a1RzQ3AvcEViUU1JWldRRis3VjVuemFyWTMvT2EvOHBrR3RwT0kxYyty?=
 =?utf-8?B?RVhxQklia0FsVjV3UzJDZmx3MmJCTElsZ3VGZTdPeDd1cjlVNWtKMGUvSHph?=
 =?utf-8?B?UmxDUWZENU1DS2RheC9NVDdkcERCQS91U0IvNkxaL3ViMEYwKzErcSt4bkdY?=
 =?utf-8?B?d3VrcTZYemxLbFF4ZnJnVERIa1BuQ3h0MWFoL21MNTJRKzBzYm5UaWZ1bDNV?=
 =?utf-8?B?cFIvRzJuZ2N1TStTbVhuMnpHNWJIdVo0N3Buc2FySFFNYnZXSFJnbE9vWHUr?=
 =?utf-8?B?ZEV0dmxacDhXQUFST0l4cDliUmZkNXoxdDczd3IycGZuQ09OMmhkTkFTMEsy?=
 =?utf-8?B?QlBmaFJNSGNKZTRaMjcrcFR1VUJDdHRYbENVaEIrTlBqNDBUZ1d2dTc5QUFi?=
 =?utf-8?B?Sm1yR1hPcVl1V2Y1S3JGMEc1WkhIRjdFWmZRYjdCV05QTFI2STRRYS9FN1ds?=
 =?utf-8?B?ZmFWb3VsMGk4OWNGRXhZWi9xSVFvYTdud0U2dG9nMFViamVDSHJDTDFQa3Iz?=
 =?utf-8?B?cElxanRpZ20yZG9uc0JLU1dSMXJ6bDlEVGJudjl1cTF0b1JxVk53bHd0aGNv?=
 =?utf-8?B?ZCsxNFZkOXRDSEVPSm5adTNrVUppeFJFR2ZjTWRUQkVuWVVQOW9GalZxczdz?=
 =?utf-8?B?TkN2SUZXTTF3ZE5HaklHalFJcVVvQlpBdWhObHBkZEc3SkU3SENXZktQaE9q?=
 =?utf-8?B?QktpVDVjUjZrdjJHVnJMU0s4eXJVUDcwcTVBTFpnNDhJVU4xRDlUWGZFTzFj?=
 =?utf-8?B?YmFhMXJ2KzNKNjhCT2szeGtCc0oxZlRyTU9GdnptdjdNWGJZcEIzM2ZRQ1Z1?=
 =?utf-8?B?TXBDTHNvWmRURTVFMGRSWFFQQVZ0dWw1bWlMSkU2K0ZZeUpqS0JhQkFjOGEw?=
 =?utf-8?B?Yi9nQlR0cmFRam9XZWU2WWZnb05VaThpbUdSVnczY2xTUnNIVHhMK1dYejJv?=
 =?utf-8?B?WUNCUXVKNTkvV0MzTGtlTDUwNG92UmFTWEZBMTJkTWhsM0hRQmZQZUdwbGp4?=
 =?utf-8?B?eEo2eTVxRk5Za3hCTDc1cFRZOVZQUGJySVQ1TDRCTmQzQzcybHF2STB2T3Ez?=
 =?utf-8?B?N0lzMTlHZUdDcmhNUE8yNy9nc1AwWjE0OVZWbGxvQ3JaL1JjdjQ4RkNpckg1?=
 =?utf-8?B?ME5mMHV2UmRlVmc0ZGdXZWZ3Y21iVkVWaThyeGhHUmR0MHhpVmc3UUExQ2JL?=
 =?utf-8?B?d3RuZ3QzZ1pvZzI5YXNyRWs2SXpNT1RpQUo5dElQc3hmZUlxb0hRSlNkMG91?=
 =?utf-8?B?dmE5YStFVEZFaWxjNDFCS0puSHBLUUNxRXBSRGh1ZUl5bjNEMWxTRDhQUmFB?=
 =?utf-8?B?ZVc2ViszOEhzZFFueSswbFNWWjdVWXpEM1EranNOeTAvelhzSXRJNkZsaHE5?=
 =?utf-8?B?ME50eXdhSVJGSW9jbXIrTncwcVoyd1N0Uytma3g1V0tYNVhmYVlzRmtXdmxB?=
 =?utf-8?Q?/zLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8F2F2E9537DAC4083C37ECB22477226@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b431d291-21d6-4e37-0e23-08dccbe0868f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 06:20:37.0328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muwSFyoK1OC9NMWi4TIYXr+fwBjzAmWAb2trjPlQz7v2b5k78BujHNIpsBT2+9fl2kqvQtRJhz6zX525VA2tLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

T24gMjAyNC85LzMgMTQ6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wOS4yMDI0IDA2
OjAxLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzgvMjAgMTU6MDcsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDIwLjA4LjIwMjQgMDg6MTIsIENoZW4sIEppcWlhbiB3cm90ZToN
Cj4+Pj4gT24gMjAyNC84LzE5IDE3OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDE2
LjA4LjIwMjQgMTM6MDgsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4+IElmIHJ1biBYZW4gd2l0
aCBQVkggZG9tMCBhbmQgaHZtIGRvbVUsIGh2bSB3aWxsIG1hcCBhIHBpcnEgZm9yDQo+Pj4+Pj4g
YSBwYXNzdGhyb3VnaCBkZXZpY2UgYnkgdXNpbmcgZ3NpLCBzZWUgcWVtdSBjb2RlDQo+Pj4+Pj4g
eGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUNCj4+Pj4+
PiBwY2lfYWRkX2RtX2RvbmUtPnhjX3BoeXNkZXZfbWFwX3BpcnEuIFRoZW4geGNfcGh5c2Rldl9t
YXBfcGlycQ0KPj4+Pj4+IHdpbGwgY2FsbCBpbnRvIFhlbiwgYnV0IGluIGh2bV9waHlzZGV2X29w
LCBQSFlTREVWT1BfbWFwX3BpcnENCj4+Pj4+PiBpcyBub3QgYWxsb3dlZCBiZWNhdXNlIGN1cnJk
IGlzIFBWSCBkb20wIGFuZCBQVkggaGFzIG5vDQo+Pj4+Pj4gWDg2X0VNVV9VU0VfUElSUSBmbGFn
LCBpdCB3aWxsIGZhaWwgYXQgaGFzX3BpcnEgY2hlY2suDQo+Pj4+Pj4NCj4+Pj4+PiBTbywgYWxs
b3cgUEhZU0RFVk9QX21hcF9waXJxIHdoZW4gZG9tMCBpcyBQVkggYW5kIGFsc28gYWxsb3cNCj4+
Pj4+PiBpUEhZU0RFVk9QX3VubWFwX3BpcnEgZm9yIHRoZSByZW1vdmFsIGRldmljZSBwYXRoIHRv
IHVubWFwIHBpcnEuDQo+Pj4+Pj4gU28gdGhhdCB0aGUgaW50ZXJydXB0IG9mIGEgcGFzc3Rocm91
Z2ggZGV2aWNlIGNhbiBiZSBzdWNjZXNzZnVsbHkNCj4+Pj4+PiBtYXBwZWQgdG8gcGlycSBmb3Ig
ZG9tVSB3aXRoIGEgbm90aW9uIG9mIFBJUlEgd2hlbiBkb20wIGlzIFBWSC4NCj4+Pj4+Pg0KPj4+
Pj4+IFRvIGV4cG9zaW5nIHRoZSBmdW5jdGlvbmFsaXR5IHRvIHdpZGVyIHRoYW4gKHByZXNlbnRs
eSkgbmVjZXNzYXJ5DQo+Pj4+Pj4gYXVkaWVuY2UobGlrZSBQVkggZG9tVSksIHNvIGl0IGRvZXNu
J3QgYWRkIGFueSBmdXRoZXIgcmVzdHJpY3Rpb25zLg0KPj4+Pj4NCj4+Pj4+IFRoZSBjb2RlIGNo
YW5nZSBpcyBmaW5lLCBidXQgSSdtIHN0cnVnZ2xpbmcgd2l0aCB0aGlzIHNlbnRlbmNlLiBJIGNh
bid0DQo+Pj4+PiByZWFsbHkgZGVyaXZlIHdoYXQgeW91J3JlIHRyeWluZyB0byBzYXkuDQo+Pj4+
IEFoLCBJIHdhbnRlZCB0byBleHBsYWluIHdoeSB0aGlzIHBhdGggbm90IGFkZCBhbnkgZnVydGhl
ciByZXN0cmljdGlvbnMsIHRoZW4gdXNlZCB5b3VyIGNvbW1lbnRzIG9mIGxhc3QgdmVyc2lvbi4N
Cj4+Pj4gSG93IGRvIEkgbmVlZCB0byBjaGFuZ2UgdGhpcyBleHBsYW5hdGlvbj8NCj4+Pg0KPj4+
IEkgdGhpbmsgeW91IHdhbnQgdG8gdGFrZSBSb2dlcidzIGVhcmxpZXIgY29tbWVudHMgKHdoZW4g
aGUgcmVxdWVzdGVkDQo+Pj4gdGhlIHJlbGF4YXRpb24pIGFzIGJhc2lzIHRvIHJlLXdyaXRlIChj
b21iaW5lKSBib3RoIG9mIHRoZSBsYXR0ZXIgdHdvDQo+Pj4gcGFyYWdyYXBocyBhYm92ZSAob3Ig
bWF5YmUgZXZlbiBhbGwgdGhyZWUgb2YgdGhlbSkuIEl0J3Mgb2RkIHRvIGZpcnN0DQo+Pj4gdGFs
ayBhYm91dCBEb20wLCBhcyBpZiB0aGUgb3BlcmF0aW9ucyB3ZXJlIHRvIGJlIGV4cG9zZWQganVz
dCB0aGVyZSwNCj4+PiBhbmQgb25seSB0aGVuIGFkZCBEb21VLXMuDQo+Pg0KPj4gSSB0cmllZCB0
byB1bmRlcnN0YW5kIGFuZCBzdW1tYXJpemUgUm9nZXIncyBwcmV2aW91cyBjb21tZW50cyBhbmQg
Y2hhbmdlZCBjb21taXQgbWVzc2FnZSB0byB0aGUgZm9sbG93aW5nLiBEbyB5b3UgdGhpbmsgaXQg
aXMgZmluZT8NCj4gDQo+IFdoYXQgYXJlIHdlIHRhbGtpbmcgYWJvdXQgaGVyZT8gDQpZb3UgaGFk
IHNvbWUgY29uY2VybiBhYm91dCB0aGUgZGVzY3JpcHRpb24gb2YgY29tbWl0IG1lc3NhZ2Ugb2Yg
dGhpcyBwYXRjaC4NClNvIEkgc2VuZCBhIGRyYWZ0IGJlbG93IHRvIGdldCB5b3VyIG9waW5pb24u
DQpJZiB5b3UgZm9yZ290LCBJIHdpbGwgZGlyZWN0bHkgc2VuZCBhIG5ldyB2ZXJzaW9uKHYxNCkg
bGF0ZXIgdG9kYXkuDQoNCj4gVGhlIHBhdGNoIHdhcyBjb21taXR0ZWQgb3ZlciBhIG1vbnRoIGFn
bz8NClllcywgSSBzZW50IHRoaXMgdjEzIGluIEF1ZyAxNiwgYW5kIHNvcnJ5IHRvIHJlcGx5IGxh
dGUuDQoNCj4gDQo+IEphbg0KPiANCj4+IHg4Ni9wdmg6IEFsbG93ICh1biltYXBfcGlycSB3aGVu
IGRvbTAgaXMgUFZIDQo+Pg0KPj4gV2hlbiBkb20wIGlzIFBWSCB0eXBlIGFuZCBwYXNzdGhyb3Vn
aCBhIGRldmljZSB0byBIVk0gZG9tVSwgUWVtdSBjb2RlDQo+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNf
cGh5c2Rldl9tYXBfcGlycSBhbmQgbGlieGwgY29kZSBwY2lfYWRkX2RtX2RvbmUtPg0KPj4geGNf
cGh5c2Rldl9tYXBfcGlycSBtYXAgYSBwaXJxIGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzLg0KPj4g
SW4geGNfcGh5c2Rldl9tYXBfcGlycSBjYWxsIHN0YWNrLCBmdW5jdGlvbiBodm1fcGh5c2Rldl9v
cCBoYXMgYSBjaGVjaw0KPj4gaGFzX3BpcnEoY3VycmQpLCBidXQgY3VycmQgaXMgUFZIIGRvbTAs
IFBWSCBoYXMgbm8gWDg2X0VNVV9VU0VfUElSUSBmbGFnLA0KPj4gc28gaXQgZmFpbHMsIFBIWVNE
RVZPUF9tYXBfcGlycSBpcyBub3QgYWxsb3dlZCBmb3IgUFZIIGRvbTAgaW4gY3VycmVudA0KPj4g
Y29kZXMuDQo+Pg0KPj4gQnV0IGl0IGlzIGZpbmUgdG8gbWFwIGludGVycnVwdHMgdGhyb3VnaCBw
aXJxIHRvIGEgSFZNIGRvbWFpbiB3aG9zZQ0KPj4gWEVORkVBVF9odm1fcGlycXMgaXMgbm90IGVu
YWJsZWQuIEJlY2F1c2UgcGlycSBmaWVsZCBpcyB1c2VkIGFzIGEgd2F5IHRvDQo+PiByZWZlcmVu
Y2UgaW50ZXJydXB0cyBhbmQgaXQgaXMganVzdCB0aGUgd2F5IGZvciB0aGUgZGV2aWNlIG1vZGVs
IHRvDQo+PiBpZGVudGlmeSB3aGljaCBpbnRlcnJ1cHQgc2hvdWxkIGJlIG1hcHBlZCB0byB3aGlj
aCBkb21haW4sIGhvd2V2ZXINCj4+IGhhc19waXJxKCkgaXMganVzdCB0byBjaGVjayBpZiBIVk0g
ZG9tYWlucyByb3V0ZSBpbnRlcnJ1cHRzIGZyb20NCj4+IGRldmljZXMoZW11bGF0ZWQgb3IgcGFz
c3Rocm91Z2gpIHRocm91Z2ggZXZlbnQgY2hhbm5lbCwgc28sIHRoZSBoYXNfcGlycSgpDQo+PiBj
aGVjayBzaG91bGQgbm90IGJlIGFwcGxpZWQgdG8gdGhlIFBIWVNERVZPUF9tYXBfcGlycSBpc3N1
ZWQgYnkgZG9tMC4NCj4+DQo+PiBBbmQgdGhlIFBWSCBkb21VIHdoaWNoIHVzZSB2cGNpIHRyeWlu
ZyB0byBpc3N1ZSBhIG1hcF9waXJxIHdpbGwgZmFpbCBhdCB0aGUNCj4+IHhzbV9tYXBfZG9tYWlu
X3BpcnEoKSBjaGVjayBpbiBwaHlzZGV2X21hcF9waXJxKCkgLg0KPj4NCj4+IFNvLCBhbGxvdyBQ
SFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxzbyBhbGxvdw0KPj4gUEhZ
U0RFVk9QX3VubWFwX3BpcnEgZm9yIHRoZSByZW1vdmFsIGRldmljZSBwYXRoIHRvIHVubWFwIHBp
cnEuIFRoZW4gdGhlDQo+PiBpbnRlcnJ1cHQgb2YgYSBwYXNzdGhyb3VnaCBkZXZpY2UgY2FuIGJl
IHN1Y2Nlc3NmdWxseSBtYXBwZWQgdG8gcGlycSBmb3IgZG9tVS4NCj4+DQo+Pj4NCj4+Pj4+PiBB
bmQgdGhlcmUgYWxyZWFkeSBhcmUgc29tZSBzZW5hcmlvcyBmb3IgZG9tYWlucyB3aXRob3V0DQo+
Pj4+Pj4gWDg2X0VNVV9VU0VfUElSUSB0byB1c2UgdGhlc2UgZnVuY3Rpb25zLg0KPj4+Pj4NCj4+
Pj4+IEFyZSB0aGVyZT8gSWYgc28sIHBvaW50aW5nIG91dCBhbiBleGFtcGxlIG1heSBoZWxwLg0K
Pj4+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBSb2dlciBtZW50aW9uZWQgdGhhdCBQSVJR
cyBpcyBkaXNhYmxlIGJ5IGRlZmF1bHQgZm9yIEhWTSBndWVzdCgiaHZtX3BpcnE9MCIpIGFuZCBw
YXNzdGhyb3VnaCBkZXZpY2UgdG8gZ3Vlc3QuDQo+Pj4+IEluIHRoaXMgc2NlbmUsIGd1ZXN0IGRv
ZXNuJ3QgaGF2ZSBQSVJRcywgYnV0IGl0IHN0aWxsIG5lZWRzIHRoaXMgaHlwZXJjYWxsLg0KPj4+
DQo+Pj4gSW4gd2hpY2ggY2FzZSBwbGVhc2Ugc2F5IHNvIGluIG9yZGVyIHRvIGJlIGNvbmNyZXRl
LCBub3QgdmFndWUuDQo+Pj4NCj4+PiBKYW4NCj4+DQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywN
CkppcWlhbiBDaGVuLg0K

