Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DEFA7F06A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 00:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941215.1340759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8v-0007KB-Og; Mon, 07 Apr 2025 22:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941215.1340759; Mon, 07 Apr 2025 22:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8v-0007Hg-L4; Mon, 07 Apr 2025 22:40:37 +0000
Received: by outflank-mailman (input) for mailman id 941215;
 Mon, 07 Apr 2025 22:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1v8t-0006OT-Bx
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 22:40:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2607::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510ec3c4-1401-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 00:40:33 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10914.eurprd03.prod.outlook.com
 (2603:10a6:102:48a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 22:40:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:40:29 +0000
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
X-Inumbo-ID: 510ec3c4-1401-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJlQ2XSY6LOMj4nv54oj83O+xC/dsQxZH/XLl0zhnbfSKxzOIxtYBRBgavGd0XeykLjxKVvf2y+MrKYkjNq51i1/dKri2ZAFtUxliDcO1u9NXfuIYuIDM9oaNlftC8e5CzeMH0i//5DI7PgtjH58zeZ9XQKUU/9T5zk/0XcKkawgMR8q/2ou0vD9smWF0vHw5j87c/14C29QPwsIcChvWPyHz5coQa5G15OcZj+RTPXh9VuzEtBcy6p4hE8wvldpuucFoit+imqIBnKcnMdOjyXBlIeCvNPV83GVl9WsyYI1btToG7pL4wcKq5iLoMAv8ua6EHPpoo/AD9GaoDE7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpwTyKZDitgAE5NHFJnIxBl6LWPz6r0Idd0Cm8s4Sp4=;
 b=X1+ha5PKvzWU4wTPr6IjATduJ/Eo3/D3lMZwil5wVZeumhEOMQNaEQFob2DYZ94TEOREboVd++myal2gkrDY9PSEtO87AZyO6UiYuPr8thCXGJQUxLxISErjOTEX7nxTZUD75dlJYaWBbJ69nJzmAmRmm9UxNh9S6wa8kx9pi/l4SUP8MJWVk+GB59mgDmZKaFTo75a5IRkfoQa1vKZsB/HHF51lEd63qeH60/uxkZCb+91SlQr9e+qGK0Fd2sM4Mw0KMjvq4MQHc5JHsyFR0e/VIXOmb5/9WI5CRTbkJ3+Opg4h6Qu55p4qZplk2wt7N4bLFZs3Lr0SktZ4eoRSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpwTyKZDitgAE5NHFJnIxBl6LWPz6r0Idd0Cm8s4Sp4=;
 b=PL0+e+SE8mxQhWr4lwMrHmS/VfWIYqnc1u/wxFeCKM2RLylqg26bI3CrObvYfc6+if4+8Ph4R1hRlVg5UJ1BkStxLGkkZ5GAVrnyV/R3PdcC9QJgMmCvKKLZWU8sHyvRYL9RvfUHj/AhH5bRyh3J/eByyyyVNX3Zdn7Qy6ns8GAMgXB5smazxiGx8PfSwPy5tj+IIk7vhbWPIQ2+/mFyiJB7r21YhwssfbD+mazKieLFznAh/acBfYTkQwwLLzW07mCIffWx/Ze7HSV7BPTvbHBx6IQ+ieHfwL7mQAdbOxlCuo71A0eIcULY91Bhq7N6oK6gDt35fbkGRh+sEF0oVw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v8 1/3] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v8 1/3] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbqA4Pj76hGRdg9ESZqA2thQqQLA==
Date: Mon, 7 Apr 2025 22:40:27 +0000
Message-ID: <20250407224009.2577560-2-volodymyr_babchuk@epam.com>
References: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10914:EE_
x-ms-office365-filtering-correlation-id: 79e97baf-960f-4ae9-7d9c-08dd762532c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFBLZ1ROS2x4dFEzd3V0QlZwSitVTHhKV3lRTVAvSytMVWRXcTk2RDhncW5W?=
 =?utf-8?B?Mk91bldkb3ord0E0OUlneFBudm1wSWNqRnpjZDM3SE4wMTR4SnBPRTFuVEhN?=
 =?utf-8?B?WTZKUmVaK3h6K2ZYaVFnZEdjTVR0MStWL3pEclRFUFJPYzRTejZOZGJOT3dm?=
 =?utf-8?B?VnhoQzNMTXZRTXNnWlZ2Q3JBMXYwMVZlZEtaTjFpandiQi8ydXUwRFROdDFF?=
 =?utf-8?B?NzFhUG5UYVluMTJNUWNPQSt3QTVwd1FieW9Jc0VkM2JYUklKRCtXS0JSRVVa?=
 =?utf-8?B?aTVvUXppeGQvb2tyRjZMRFltTFFBY2hRSUtLU0VkZDNtZVdWb251eVpIT1k2?=
 =?utf-8?B?ZTNLUmZNWGJPWlJqeTBVU09HT2xLcjc1MURjblNDU2FqMGtiYkJlaTRyQngy?=
 =?utf-8?B?dWszczFQQjIzU2psYzQrSzhKSS9iamRYbWg0UUR2Q2t6MEhTZDhmb2Zva1Vl?=
 =?utf-8?B?eHNwRTZnRGtNcHByUjV2VW9QZHRJT1NjYU1GOFgyVllmUTZvSFUyUlpiU2FX?=
 =?utf-8?B?eVRNT0F2eHJxVHVHSjF2WnFEcGloZkxreXZpWXRSSFJucWl3dFBNWjRmdlBM?=
 =?utf-8?B?TU9YMDZPbzd4bVV3djBJVldCZVZHSE1IeUJpUUREK0p4KzE0M2F1T0VUVjl4?=
 =?utf-8?B?eFBZcERreXJLMzZFS3dwMGpidVQxREhkcEJPZFRrTTRSbFdCWTdQa3JTNGs5?=
 =?utf-8?B?RHd4Q0l3dUZOMTVSekVNTHF3cktEd2IyN1Q3a1VHSlBUOGsyWlNuVDJ6bWtL?=
 =?utf-8?B?Tmg5OFNuUG83eUVVcFNtWXJyckZROFRkZGpFVk9WeHI2bHB1cGppNUlrK0d6?=
 =?utf-8?B?MTdrTTkzVzFTR1NzU2RlcDFFRWdZcHJHL2dCN0MwaUVZQ0ZLRGpzRTg5YUNZ?=
 =?utf-8?B?NlhEM3BEWlA5Tk4zKzFtRHJmalB1NVFWSjhkcHlOYTVPZ01kTXEwOUsvdVlw?=
 =?utf-8?B?eE9WZkJIbVFkUlQ2OW40REZzWTFoY3FjKzJrMk80VGxBNGlPN1c1SkgvOHUw?=
 =?utf-8?B?My82WW50Z3FIREVlZGZXZ0JtQWJReVJuOFFVbXdmb1dyQ2c5UGNOb3h3NzVq?=
 =?utf-8?B?WG13UFEweTMzOGx1alk3bEozdXNKZjRGYW9LclF0OWpZS2VrS2NmVkJxWUJk?=
 =?utf-8?B?WmNDS3dqd1doTDhIK1lmM1pkZU9lY2xqT29iajZIcHdBQ2NNQ3crM0JRVGY4?=
 =?utf-8?B?Q0EwRC9rSlR6WDNmU0V4K2FVdUpkWWxSOUZsM0Y3K0VUREd3czFPQXovK1JH?=
 =?utf-8?B?NUYvZndsaHlvazczR0xhZnVLdXdUdjdTRUZjazhTMzhtR0M4ZUVSYno3NVUr?=
 =?utf-8?B?SGNsQ1JFSCtCbm9sL0dQUHI5VlQwVDlSdHF6aGxOOHJKckxLNkxzRXRXMStJ?=
 =?utf-8?B?UnVpbGpqb3J0bEo0blV1UmRFWUtnTWZvVFp1eWN6elRhblBvT3RUTmhxcnNJ?=
 =?utf-8?B?SDhTUmRzTndSWHN1dEtpU2VBWDNkNDc2ZG9tRnQrdTd1bEhBS2ZFWVhHYlJn?=
 =?utf-8?B?d1NaaTNjR093MlZHcmhvU0pPMFdPemRYVDlhOHVtWVhKY0czNFBVTDF2NVhM?=
 =?utf-8?B?UnA4U0g5ZVRnaW9IWEhlRUJmV0dGYnRTL05xZmZMRVlRcjJUaUw1MmlSVU5T?=
 =?utf-8?B?b0VZdWlDdDFWMjZoRHVOai8zQXI1ZysrNm02YzhxeGxaUHZGdnVrQTNRRmhn?=
 =?utf-8?B?NGJ3REROTnlETVhzQjlmd0RFV05kaDQ2MlVZTE9BUzFuaWVxQUtYZkFKTDll?=
 =?utf-8?B?aEwwbjZ3eWI0Mmtqb1A4TVVlQmREZ2lESG9CdzdVa1hUaFdEcTN1dGJmSzY0?=
 =?utf-8?B?YmE4NVgwRzNjMzYyWTRqZkpyOTFUckVUbU1UWVBHdTF1YU9UODdJVDZ2T2lK?=
 =?utf-8?B?WXBPdWs3N2FNSGkxZFd0ZGdRd1lpUmhNY1BqeHgyQ0d0VmRrOW5GN25ZRXRK?=
 =?utf-8?Q?D4rdCsSmgJe5ebizrZ/AUu5bhPYOOutC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnFZMjhIM1N3WWNxTkhjU1R5YWtqTXBGYlFLYjZsbFpSOVA4S0tMQjEwWGRJ?=
 =?utf-8?B?bnBKMGpiVUo0LzNjSzhnakNaWjRCcTNlSlRrSWVOanRaWUlZcm9kZ3NYSXRI?=
 =?utf-8?B?a3UvQjVJSnEyc3ZaeHRVTndUMjFYMGpVUTRQSjdOU1FYUHN3bnhiR1JyakhI?=
 =?utf-8?B?alVsSmlOV0duRUdNNHUycnB4SUVlWnNTRjZzQnJOdlRzZ0JKeWZMSkl3Zmx6?=
 =?utf-8?B?R3dCZ01tQjVnREd5ZzRlL1dFbnhrdU9PbDFpeWNWWmNmVFRQYm5wY29XQ0dJ?=
 =?utf-8?B?RjNDWGZpb3JPdFBjcmlIQjlKOFp3YUNaUU5pNWRsQVNndGRpN1p5Vmtwdm9O?=
 =?utf-8?B?QTJQQkZhTGh6azk4QzRYaXpTZll3cUtDTVd6Ymd0NkwvQmRqUFNaRit3dlBZ?=
 =?utf-8?B?YlBlNVYzVlBWRlk0dXRMeHdtYUQ5eDdYZ2FQWDVpN3BhYWR6dW9EYWcvbDE4?=
 =?utf-8?B?ays0MmY3SElucG5YT28zbDJjRnkvbDI2dFJ5L2R5dVhjRjVlTk04ZHgySFp2?=
 =?utf-8?B?bzk1TkpqaVBqU0ZLbDdiSEI2ODhnZk85RDVKVXlualY2OVFDMWo3ZE82Ym9N?=
 =?utf-8?B?cGhTWStOZUtsdGxWbEtIMkpNSGVPOFlwaHFDQTRoTWFPcDV1R2F4bzZ5NS8w?=
 =?utf-8?B?dlNXenY3OFd2RFU0UzJEcHVudkJJU3hXSDdWSnVwWEpiU0w2ZHpnNEFFWGpO?=
 =?utf-8?B?aEdCV3QrRGZwaG5CSUJIWFlwQjhvbU5BSUtIUE5FWGNCZFRtNWdnczVHTTdK?=
 =?utf-8?B?Y3Q5bGlVNnZuOVV4Wm5wUUExcURSZU1uWEFtbytNMUcrMWg3YjY5T3czaDJR?=
 =?utf-8?B?SXZaS0ZBVFR0cnVaWGY3bTBUcGlpK1dHQ1pUdEFUSTFFZ0RaQVBVbEFhNVhI?=
 =?utf-8?B?aWZIbWI0UVBseUFQOXh6NnJHcVpEQ0pLSTV3NzhsTTN5dXBQeWppWVRIaFYv?=
 =?utf-8?B?WE4vOWVEcDZaZFZnSitHV0l4UkZCanlqL2tHLzVlRVE0TE1qMkJyNzNpTHFX?=
 =?utf-8?B?Z0RCTnlqTFVhUWFhVUtnN3FuSTd2SkRWb3AyUjFzZkVtQXlZUDZMd1QwT3E2?=
 =?utf-8?B?MVJDbjVkcSszSlVaYXRzb3hucFZWc2lTSVI0dmN2ckVGcC9adGIrZlBtakVh?=
 =?utf-8?B?L1ZHUmp4QVZLQVAzU3ZPQ2swSlg4WTViSEwwSkY1QTM5MHBwSU0yaks5YWxn?=
 =?utf-8?B?TXYyNkh4aGlSeXo3b0V4NnJ0V2ZTbnZBMEMvV0hvMHA3TGtWWUYrbURITlJQ?=
 =?utf-8?B?eVEyelVuZmRpZWpmOHFqSDUrVXVxNHJ2bGdpd1lUdmlIUmVNSHE5WUxhYlVR?=
 =?utf-8?B?WmxkcnM2Q1Z1U0VVTXJMblJ4ZUdJajhJTENnSVBYV1JUaFFkZ2xXTEpvWFNs?=
 =?utf-8?B?MEZqUUJuVTZpVFlpS05ZYW5MRHVlZnMrSGlISkNiSERaSm9aaHJVZUN2c1M0?=
 =?utf-8?B?T09VT2pLZ1c2Q2FkYWhnTDFKOUtudEx3bSswNnZtVEdXci9vMVNQbzFSNGJp?=
 =?utf-8?B?ODV2aE95WWxWMlRTamhSYlkrdE9EWVhlL1Y0cHU3NEd2Rml2YjJYY20zSCtO?=
 =?utf-8?B?VEVkWnpPS0gybVJnNnhJUEhjVlNhVG0vbmlWOVBMYXdxdnZYdHR6SUdidEtq?=
 =?utf-8?B?bnkvRHBsazdKYXNicTdMVDNGY2lyZFVPdFJyWGZnV096eVQwRXpSZDRzLzhi?=
 =?utf-8?B?bXBGS2pUYzZaMEhmam01N2xEdjl0WnVPdFNSRDBRaDBQRUZHS2QvTXYyaTVi?=
 =?utf-8?B?eThyWThCT1ByM1oydXp6QmhpNlFBSUJ3cENxQzRtWkdFUklsVFZZS3JFKzNq?=
 =?utf-8?B?T2ZWeFFEb2RJZnhxbzFzL3orWTFUaDNJQ1ZJNmJieVc0ckxhQ2h5Y1liWWRj?=
 =?utf-8?B?M1A2VXQ3cG5na0pVVHZtNS9jazlsOTR3azBuYktrWkRoV2VTaWFHbWR0N1p6?=
 =?utf-8?B?LzRuY3ZJeklmUGpXTENaU2V5bHNjTExZTzR1c2s5TUgzN3pPa2RadVBBV2RS?=
 =?utf-8?B?LzZ2K0wrejlPYjhLckpBMlRMZzhUQ0VOMXZzTkxvNHVLbzlhNHprdHltZjBi?=
 =?utf-8?B?VkJzRG1vLzltQUkvMEo5M29DVjdXWmhKQWhYQmhPTnpnb2dDY0xFKytEOWhJ?=
 =?utf-8?B?dzVIaGI3dkhQVVlJOE13dlhEc2MyL1NIWHFMUmV5cGluNVRhemE0VmptNmFm?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26DE99963D618A438C85DFD6BB7A52BE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e97baf-960f-4ae9-7d9c-08dd762532c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 22:40:27.6385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seKqDiBnHUHP8abQrzaHSLXDSdjQRFZhgyuoOpDji2DttpsVbfSnuhOhYtLiYeojxe7V42TJ3zgYieUADUqh+nldwiLRjHpzX/SevYWauYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10914

Qm90aCBHQ0MgYW5kIENsYW5nIHN1cHBvcnQgLWZzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSwgd2hp
Y2ggYWRkIHN0YWNrDQpjYW5hcmllcyB0byBmdW5jdGlvbnMgd2hlcmUgc3RhY2sgY29ycnVwdGlv
biBpcyBwb3NzaWJsZS4gVGhpcyBwYXRjaA0KbWFrZXMgZ2VuZXJhbCBwcmVwYXJhdGlvbnMgdG8g
ZW5hYmxlIHRoaXMgZmVhdHVyZSBvbiBkaWZmZXJlbnQNCnN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KDQogLSBBZGRlZCBDT05GSUdfSEFTX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gc28gZWFjaCBh
cmNoaXRlY3R1cmUNCiAgIGNhbiBlbmFibGUgdGhpcyBmZWF0dXJlIGluZGl2aWR1YWxseQ0KIC0g
QWRkZWQgdXNlci1zZWxlY3RhYmxlIENPTkZJR19TVEFDS19QUk9URUNUT1Igb3B0aW9uDQogLSBJ
bXBsZW1lbnRlZCBjb2RlIHRoYXQgc2V0cyB1cCByYW5kb20gc3RhY2sgY2FuYXJ5IGFuZCBhIGJh
c2ljDQogICBoYW5kbGVyIGZvciBzdGFjayBwcm90ZWN0b3IgZmFpbHVyZXMNCg0KU3RhY2sgZ3Vh
cmQgdmFsdWUgaXMgaW5pdGlhbGl6ZWQgaW4gdHdvIHBoYXNlczoNCg0KMS4gUHJlLWRlZmluZWQg
cmFuZG9tbHktc2VsZWN0ZWQgdmFsdWUuDQoNCjIuIE93biBpbXBsZW1lbnRhdGlvbiBvZiBsaW5l
YXIgY29uZ3J1ZW50IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLiBJdA0KcmVsaWVzIG9uIGdldF9j
eWNsZXMoKSBiZWluZyBhdmFpbGFibGUgdmVyeSBlYXJseS4gSWYgZ2V0X2N5Y2xlcygpDQpyZXR1
cm5zIHplcm8sIGl0IHdvdWxkIGxlYXZlIHByZS1kZWZpbmVkIHZhbHVlIGZyb20gdGhlIHByZXZp
b3VzIHN0ZXAuDQoNCmJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKCkgaXMgZGVjbGFyZWQgYXMg
YWx3YXlzX2lubGluZSB0byBlbnN1cmUNCnRoYXQgaXQgd2lsbCBub3QgdHJpZ2dlciBzdGFjayBw
cm90ZWN0b3IgYnkgaXRzZWxmLiBBbmQgb2YgY291cnNlLA0KY2FsbGVyIHNob3VsZCBlbnN1cmUg
dGhhdCBzdGFjayBwcm90ZWN0aW9uIGNvZGUgd2lsbCBub3QgYmUgcmVhY2hlZA0KbGF0ZXIuIEl0
IGlzIHBvc3NpYmxlIHRvIGNhbGwgdGhlIHNhbWUgZnVuY3Rpb24gZnJvbSBhbiBBU00gY29kZSBi
eQ0KaW50cm9kdWNpbmcgc2ltcGxlIHRyYW1wb2xpbmUgaW4gc3RhY2stcHJvdGVjdG9yLmMsIGJ1
dCByaWdodCBub3cNCnRoZXJlIGlzIG5vIHVzZSBjYXNlIGZvciBzdWNoIHRyYW1wb2xpbmUuDQoN
CkFzIF9fc3RhY2tfY2hrX2ZhaWwoKSBpcyBub3QgY2FsbGVkIGJ5IFhlbiBzb3VyY2UgY29kZSBk
aXJlY3RseSwgYW5kDQpvbmx5IGNhbGxlZCBieSBjb21waWxlci1nZW5lcmF0ZWQgY29kZSwgaXQg
ZG9lcyBub3QgbmVlZGVkIHRvIGJlDQpkZWNsYXJlZCBzZXBhcmF0ZWx5LiBTbyB3ZSBuZWVkIHNl
cGFyYXRlIE1JU1JBIGRldmlhdGlvbiBmb3IgaXQuDQoNClNpZ25lZC1vZmYtYnk6IFZvbG9keW15
ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KLS0tDQoNCkNoYW5nZXMg
aW4gdjg6DQogLSBDb2RlIGZvcm1hdHRpbmcgZml4ZXMNCiAtIEFkZGVkIGFuIGV4cGxpY2l0IE1J
U1JBIGRldmlhdGlvbiBmb3IgX19zdGFja19jaGtfZmFpbCgpDQogLSBNYXJrZWQgX19zdGFja19j
aGtfZmFpbCgpIGFzIG5vcmV0dXJuDQoNCkNoYW5nZXMgaW4gdjc6DQogLSBkZWNsYXJlZCBib290
X3N0YWNrX2Noa19ndWFyZF9zZXR1cCBhcyBhbHdheXNfaW5saW5lDQogLSBtb3ZlZCBgI2lmZGVm
IENPTkZJR19TVEFDS19QUk9URUNUT1JgIGluc2lkZSB0aGUgZnVuY3Rpb24NCg0KQ2hhbmdlcyBp
biB2NjoNCiAtIGJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKCkgbW92ZWQgdG8gc3RhY2stcHJv
dGVjdG9yLmgNCiAtIFJlbW92ZWQgQW5kcmV3J3Mgci1iIHRhZw0KDQpDaGFuZ2VzIGluIHY1Og0K
IC0gRml4ZWQgaW5kZW50YXRpb24NCiAtIEFkZGVkIHN0YWNrLXByb3RlY3Rvci5oDQotLS0NCiBk
b2NzL21pc3JhL3NhZmUuanNvbiAgICAgICAgICAgICAgfCAgOCArKysrKysrDQogeGVuL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrKw0KIHhlbi9jb21tb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrKw0KIHhlbi9jb21tb24vTWFrZWZpbGUgICAg
ICAgICAgICAgICB8ICAxICsNCiB4ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5jICAgICAgfCAy
MiArKysrKysrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaCB8
IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiA2IGZpbGVzIGNoYW5nZWQsIDg5
IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9zdGFjay1wcm90
ZWN0b3IuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS94ZW4vc3RhY2stcHJvdGVj
dG9yLmgNCg0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvc2FmZS5qc29uIGIvZG9jcy9taXNyYS9z
YWZlLmpzb24NCmluZGV4IDNkNjhiNTkxNjkuLmUyNDliY2JmODEgMTAwNjQ0DQotLS0gYS9kb2Nz
L21pc3JhL3NhZmUuanNvbg0KKysrIGIvZG9jcy9taXNyYS9zYWZlLmpzb24NCkBAIC0xMDgsNiAr
MTA4LDE0IEBADQogICAgICAgICB9LA0KICAgICAgICAgew0KICAgICAgICAgICAgICJpZCI6ICJT
QUYtMTMtc2FmZSIsDQorICAgICAgICAgICAgImFuYWx5c2VyIjogew0KKyAgICAgICAgICAgICAg
ICAiZWNsYWlyIjogIk1DM0EyLlI4LjQiDQorICAgICAgICAgICAgfSwNCisgICAgICAgICAgICAi
bmFtZSI6ICJSdWxlIDguNDogY29tcGlsZXItY2FsbGVkIGZ1bmN0aW9uIiwNCisgICAgICAgICAg
ICAidGV4dCI6ICJBIGZ1bmN0aW9uLCBmb3Igd2hpY2ggY29tcGlsZXIgZ2VuZXJhdGVzIGNhbGxz
IHRvIGRvIG5vdCBuZWVkIHRvIGhhdmUgYSB2aXNpYmxlIGRlY2xhcmF0aW9uIHByaW9yIHRvIGl0
cyBkZWZpbml0aW9uLiINCisgICAgICAgIH0sDQorICAgICAgICB7DQorICAgICAgICAgICAgImlk
IjogIlNBRi0xNC1zYWZlIiwNCiAgICAgICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCiAgICAgICAg
ICAgICAibmFtZSI6ICJTZW50aW5lbCIsDQogICAgICAgICAgICAgInRleHQiOiAiTmV4dCBJRCB0
byBiZSB1c2VkIg0KZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQ0KaW5k
ZXggNThmYWZhYjMzZC4uOGZjNGUwNDJmZiAxMDA2NDQNCi0tLSBhL3hlbi9NYWtlZmlsZQ0KKysr
IGIveGVuL01ha2VmaWxlDQpAQCAtNDM1LDcgKzQzNSwxMSBAQCBlbHNlDQogQ0ZMQUdTX1VCU0FO
IDo9DQogZW5kaWYNCiANCitpZmVxICgkKENPTkZJR19TVEFDS19QUk9URUNUT1IpLHkpDQorQ0ZM
QUdTICs9IC1mc3RhY2stcHJvdGVjdG9yDQorZWxzZQ0KIENGTEFHUyArPSAtZm5vLXN0YWNrLXBy
b3RlY3Rvcg0KK2VuZGlmDQogDQogaWZlcSAoJChDT05GSUdfTFRPKSx5KQ0KIENGTEFHUyArPSAt
Zmx0bw0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZp
Zw0KaW5kZXggMDZhZTk3NTFhYS4uNDJhMmI2YTAzZiAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24v
S2NvbmZpZw0KKysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQpAQCAtMTAwLDYgKzEwMCw5IEBAIGNv
bmZpZyBIQVNfUE1BUA0KIGNvbmZpZyBIQVNfU0NIRURfR1JBTlVMQVJJVFkNCiAJYm9vbA0KIA0K
K2NvbmZpZyBIQVNfU1RBQ0tfUFJPVEVDVE9SDQorCWJvb2wNCisNCiBjb25maWcgSEFTX1VCU0FO
DQogCWJvb2wNCiANCkBAIC0yMzMsNiArMjM2LDE4IEBAIGNvbmZpZyBTUEVDVUxBVElWRV9IQVJE
RU5fTE9DSw0KIA0KIGVuZG1lbnUNCiANCittZW51ICJPdGhlciBoYXJkZW5pbmciDQorDQorY29u
ZmlnIFNUQUNLX1BST1RFQ1RPUg0KKwlib29sICJTdGFjayBwcm90ZWN0b3IiDQorCWRlcGVuZHMg
b24gSEFTX1NUQUNLX1BST1RFQ1RPUg0KKwloZWxwDQorCSAgRW5hYmxlIHRoZSBTdGFjayBQcm90
ZWN0b3IgY29tcGlsZXIgaGFyZGVuaW5nIG9wdGlvbi4gVGhpcyBpbnNlcnRzIGENCisJICBjYW5h
cnkgdmFsdWUgaW4gdGhlIHN0YWNrIGZyYW1lIG9mIGZ1bmN0aW9ucywgYW5kIHBlcmZvcm1zIGFu
IGludGVncml0eQ0KKwkgIGNoZWNrIG9uIGZ1bmN0aW9uIGV4aXQuDQorDQorZW5kbWVudQ0KKw0K
IGNvbmZpZyBESVRfREVGQVVMVA0KIAlib29sICJEYXRhIEluZGVwZW5kZW50IFRpbWluZyBkZWZh
dWx0Ig0KIAlkZXBlbmRzIG9uIEhBU19ESVQNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL01ha2Vm
aWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0KaW5kZXggOWRhOGE3MjQ0ZC4uZjYyNTAzMWQxNiAx
MDA2NDQNCi0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUNCisrKyBiL3hlbi9jb21tb24vTWFrZWZp
bGUNCkBAIC00Niw2ICs0Niw3IEBAIG9iai15ICs9IHNodXRkb3duLm8NCiBvYmoteSArPSBzb2Z0
aXJxLm8NCiBvYmoteSArPSBzbXAubw0KIG9iai15ICs9IHNwaW5sb2NrLm8NCitvYmotJChDT05G
SUdfU1RBQ0tfUFJPVEVDVE9SKSArPSBzdGFjay1wcm90ZWN0b3Iubw0KIG9iai15ICs9IHN0b3Bf
bWFjaGluZS5vDQogb2JqLXkgKz0gc3ltYm9scy5vDQogb2JqLXkgKz0gdGFza2xldC5vDQpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYyBiL3hlbi9jb21tb24vc3RhY2st
cHJvdGVjdG9yLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwLi4yMTE1
OTEyYzNiDQotLS0gL2Rldi9udWxsDQorKysgYi94ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5j
DQpAQCAtMCwwICsxLDIyIEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLw0KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KKyNpbmNsdWRlIDx4ZW4vbGliLmg+DQor
I2luY2x1ZGUgPHhlbi9yYW5kb20uaD4NCisjaW5jbHVkZSA8eGVuL3RpbWUuaD4NCisNCisvKg0K
KyAqIEluaXRpYWwgdmFsdWUgaXMgY2hvc2VuIGJ5IGEgZmFpciBkaWNlIHJvbGwuDQorICogSXQg
d2lsbCBiZSB1cGRhdGVkIGR1cmluZyBib290IHByb2Nlc3MuDQorICovDQorI2lmIEJJVFNfUEVS
X0xPTkcgPT0gMzINCit1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5pdCBfX3N0YWNrX2Noa19n
dWFyZCA9IDB4ZGQyY2M5MjdVTDsNCisjZWxzZQ0KK3Vuc2lnbmVkIGxvbmcgX19yb19hZnRlcl9p
bml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHgyZDg1MzYwNWE0ZDlhMDljVUw7DQorI2VuZGlmDQor
DQorLyogU0FGLTEzLXNhZmUgY29tcGlsZXItY2FsbGVkIGZ1bmN0aW9uICovDQordm9pZCBub3Jl
dHVybiBfX3N0YWNrX2Noa19mYWlsKHZvaWQpDQorew0KKyAgICBkdW1wX2V4ZWN1dGlvbl9zdGF0
ZSgpOw0KKyAgICBwYW5pYygiU3RhY2sgUHJvdGVjdG9yIGludGVncml0eSB2aW9sYXRpb24gaWRl
bnRpZmllZFxuIik7DQorfQ0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90
ZWN0b3IuaCBiL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLjkzMWFmZmQ5MTkNCi0tLSAvZGV2L251bGwNCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KQEAgLTAsMCArMSwzOSBAQA0K
KyNpZm5kZWYgX19YRU5fU1RBQ0tfUFJPVEVDVE9SX0hfXw0KKyNkZWZpbmUgX19YRU5fU1RBQ0tf
UFJPVEVDVE9SX0hfXw0KKw0KK2V4dGVybiB1bnNpZ25lZCBsb25nIF9fc3RhY2tfY2hrX2d1YXJk
Ow0KKw0KKy8qDQorICogVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkIGZyb20gYSBDIGZ1
bmN0aW9uIHRoYXQgZXNjYXBlcyBzdGFjaw0KKyAqIGNhbmFyeSB0cmFja2luZyAoYnkgY2FsbGlu
ZyByZXNldF9zdGFja19hbmRfanVtcCgpIGZvciBleGFtcGxlKS4NCisgKi8NCitzdGF0aWMgYWx3
YXlzX2lubGluZSB2b2lkIGJvb3Rfc3RhY2tfY2hrX2d1YXJkX3NldHVwKHZvaWQpDQorew0KKyNp
ZmRlZiBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SDQorDQorICAgIC8qDQorICAgICAqIExpbmVhciBj
b25ncnVlbnQgZ2VuZXJhdG9yIChYX24rMSA9IFhfbiAqIGEgKyBjKS4NCisgICAgICoNCisgICAg
ICogQ29uc3RhbnQgaXMgdGFrZW4gZnJvbSAiVGFibGVzIE9mIExpbmVhciBDb25ncnVlbnRpYWwN
CisgICAgICogR2VuZXJhdG9ycyBPZiBEaWZmZXJlbnQgU2l6ZXMgQW5kIEdvb2QgTGF0dGljZSBT
dHJ1Y3R1cmUiIGJ5DQorICAgICAqIFBpZXJyZSBM4oCZRWN1eWVyLg0KKyAgICAgKi8NCisjaWYg
QklUU19QRVJfTE9ORyA9PSAzMg0KKyAgICBjb25zdCB1bnNpZ25lZCBsb25nIGEgPSAyODkxMzM2
NDUzVUw7DQorI2Vsc2UNCisgICAgY29uc3QgdW5zaWduZWQgbG9uZyBhID0gMjg2MjkzMzU1NTc3
Nzk0MTc1N1VMOw0KKyNlbmRpZg0KKyAgICBjb25zdCB1bnNpZ25lZCBsb25nIGMgPSAxOw0KKw0K
KyAgICB1bnNpZ25lZCBsb25nIGN5Y2xlcyA9IGdldF9jeWNsZXMoKTsNCisNCisgICAgLyogVXNl
IHRoZSBpbml0aWFsIHZhbHVlIGlmIHdlIGNhbid0IGdlbmVyYXRlIHJhbmRvbSBvbmUgKi8NCisg
ICAgaWYgKCAhY3ljbGVzICkNCisgICAgICAgIHJldHVybjsNCisNCisgICAgX19zdGFja19jaGtf
Z3VhcmQgPSBjeWNsZXMgKiBhICsgYzsNCisNCisjZW5kaWYJLyogQ09ORklHX1NUQUNLX1BST1RF
Q1RPUiAqLw0KK30NCisNCisjZW5kaWYJLyogX19YRU5fU1RBQ0tfUFJPVEVDVE9SX0hfXyAqLw0K
LS0gDQoyLjQ4LjENCg==

