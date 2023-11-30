Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733487FE96C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 07:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644419.1005387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8azB-0007Hg-0S; Thu, 30 Nov 2023 06:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644419.1005387; Thu, 30 Nov 2023 06:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8azA-0007FG-T3; Thu, 30 Nov 2023 06:57:20 +0000
Received: by outflank-mailman (input) for mailman id 644419;
 Thu, 30 Nov 2023 06:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8az9-0007FA-L7
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 06:57:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b268b744-8f4d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 07:57:17 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 06:57:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 06:57:12 +0000
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
X-Inumbo-ID: b268b744-8f4d-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH7V33AbmL8wztgAEG7Ylj+4kAkYhNEuqneuZ+AeWaERuxygW/eWlZH79kLZkPV0zothc2Wtg3LRWNS2XfZ/B2O1teOKDhYB/bWnpnJLoWRjS25z1TScbCwHvCgIh+ti7UVUHul/h0rjypb51dyG+rmy1bTZcfesPMXK6cdrZxXkOCmcmYkpQEVffy6zQJJ8ckL3PKJ4EEnzkcjtUZR/JbyDNsPyJUOyPfUS7dE+kAX5uF60j/fcRvyZKYE1ULNzD8vGYJO2vyjQ5tiCI8jjVwYpFNoXEnlT3/LEYvDoFKAehtQRGWgvwDGzOkL6S61xhTZmdJgsWvUvzb4JvBd0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saCOegEOwLC+inAkfamsQ/cbBDf5/mbcumTDtjD4vr4=;
 b=EC3i0ABj6ih/huH6tjWioOieSrDu2iQACs1gEE+Fw1NRiESiodi6elcoLElmWAh0lw7U12A2OyoOJhZ2BrJZkfG36jCFVB9ax+fvSuic9jWaqQh6G2/Z24s9IdMJkLJ+SiOi8yaXnThX/j8GmQUxBZdQXZpi/D+a5OVVsvCygAvb/d07rBwkH5lTauH5n1DwMlr+z9nQ3/zAg3jqdMn9CH7irWRZVbsPAzQ9cDf1n632DpYhw747D+1EdrywYMxyY919aQPNco4X2JmO8D0YiJBEKr54Stvt0gIs5AQ9vqCxhTDUiiK3DhpvyWTksO++YyAkPZbxiNYnmw8xuymLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saCOegEOwLC+inAkfamsQ/cbBDf5/mbcumTDtjD4vr4=;
 b=aIMD0eAEMZrliwYN3KhkTtWmHlcU55D426+iJzjZZReQWbBZJatxO145WNxXM//7Agul7sHMnEsoFxRtKROXEUw9ufvm9fXmCuBW1wceh2t1LfCZtso3XoChWQ/yyLf7jFWb/YpO0+W8G7swfEx65MQalQc1vtOKmTNmt3y9Yt8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Thread-Topic: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Thread-Index: AQHaHsLpM7vOINXdREip1dGZpT1r3bCPz92AgAAE2ICAABjFAIADD7UA
Date: Thu, 30 Nov 2023 06:57:12 +0000
Message-ID:
 <BL1PR12MB584922EE9DD13BBEFE83448DE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
 <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com> <ZWYRHqie0oVuawmc@macbook>
In-Reply-To: <ZWYRHqie0oVuawmc@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB8351.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7631:EE_
x-ms-office365-filtering-correlation-id: b0f0ba7f-4597-4eb0-ff80-08dbf171948d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f6ICsxo04WA0DscqlchETVPDl2vKeV/9LmrVBiqFaNA10ua0PcESSbhMtYNAos6QT+iMzKwPILFK5oEMYks9lfepITNGHvDz/odGIjsuQlx57LQwDM8l76NKjvFYUoN6oC8JtWlPWJBVQmm0mMe4V8hWf5iFKsU6Er1L7jMQGzbv/0Jf9tcDQRTgIhSKmTJZenoIbmWQw9rj7vaQf+Egdcu43LNpV4FPOEWp3hxAHVK+4NR86K+m9Z+94cvg2nhUdqSLtZRG0iTIHyF6itoSMIfy7GJjT9GSt3epyXgEcL3rLLe8elvMjk1gL99WyZJQNnRi0l/pc0UVvZadzYl65tUKBF+1/Qk8/dAU6st3I0E0tkZgCimXr8j+Z/5FoTCiuIEaNeQ3HNeRRRxPgz39gc8rp8n/i8KI67y+MLwh8PZ8NIsGDLFN7Y4aHH2cbToaR3qxPAhLZDesm4yLYyN5ua7oyBUohncFrHr/UNIOjseW1kwAvCJ8T7SLLV0xxvC586J1H1ofqJ7nWH70HQWn4ZIKYe/bYIT4pccUELerPQTKJo1bqoch3pbBvCIkuDcaysMYJKjWc2rp4BTfI6ds4g6E+7OeCOua9HviT6UOl+zEQo9ehmA7CxR/tGIfQdkhRQYks+Vw0REdM1y3d77C+lm3rD8VTgCCLEizSfnPzOI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(122000001)(478600001)(9686003)(6506007)(26005)(7696005)(53546011)(71200400001)(2906002)(5660300002)(66946007)(54906003)(66556008)(66446008)(76116006)(41300700001)(64756008)(66476007)(110136005)(8676002)(8936002)(4326008)(316002)(52536014)(38100700002)(38070700009)(33656002)(202311291699003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yy9rL2EySnJ6bFdJSk1CTWVhTXdkS2x0VUdlcFRSNjhjQzdXZXRnVXVqWjR4?=
 =?utf-8?B?amZjN0RpWEcxL1VBVXEyZ1dLQXlCTXRHS2JCdUZiSm4xMEx5dkszRXR2THdV?=
 =?utf-8?B?S1cyais3UkRPdnBnWUJNa1NmQ2dIZERPMjcvaUFPT05wWXBGckZKanVKWCs5?=
 =?utf-8?B?OE9rNlIwVS9VUExLYkprYWxSbU42T2FnQi9qN3VlNUpJM3BhUURKTXgwS20v?=
 =?utf-8?B?Y2lQMTJJMnV2YU1nWUR6cEM5eXhRdmNybXpnRkc2bGUwSU1rUjhZQ3JwQVRa?=
 =?utf-8?B?aXVQc3pCZk1MR2R3Z3JGcElzQlVQZWQybjN5RlRJSllvM3RLaDNoc3BCV1pK?=
 =?utf-8?B?dTdkRFN2RU5QdU9PbzNFRVhjcTVaRi9udG15K3I1OEhuRlZmQm0wVFZrUU9v?=
 =?utf-8?B?VGtXZGtJRmQxNlo3azJTMXQzVEpoUUpZZjZkQmlhZldPblo1SW9QMnhRQjEz?=
 =?utf-8?B?NGNHRDFNMzFKOFV3TmNzSSt4MmhmbnJVRXUzNEQvakVpUXIxOFlBK3hMa2xh?=
 =?utf-8?B?WGFCclVwaU83b1J4RS9xZmVydlZUc2N0OWV6Q0F6d2RTRG42RUFadVZvbGIz?=
 =?utf-8?B?RVJHaGU3RUNsSUttTU5aOEo5bkVHTWQzVGRUUjg4dWx0YWtsYVhsaXl5ZlVh?=
 =?utf-8?B?ekUxQ1V3ZGgzT1ArbnFCd0Q0d3NJbjhpbFJQT1U4UGwwblU0ZDBWV0xWUHpK?=
 =?utf-8?B?cUJOZzlNcGV1WE8vc2tUSUpnTFFTai8rSFNQbVRHYkx1bjdjU05wQ3RvaU9y?=
 =?utf-8?B?MEFONlpNa0hBbE9YVXBZNEh3Q0ZudUlPOGphS0pMR05FaExYUHlvSTFaUkpM?=
 =?utf-8?B?M0d3N1VJaE9WYmMrdndXNy9JWWozTU9wclE2R0FTNGkyVnA5Skx1STd2T3N4?=
 =?utf-8?B?THFDZjMyajlDUXJSZGRSY3c0enpQSVVOYVNBZnNHWEFQcXY4MHBnS1RBOFhp?=
 =?utf-8?B?dzNyU3ozWDdPZzJjWHcxOUg5Z1RWNWx4MVlGV2MvNXlMRGVPanlSaTZ0U2FV?=
 =?utf-8?B?S0JJWllsUHNZY1dSWkVZYnhBNElITmZ1bS9tVDdnSGVka1VPVlNXbitWV2pj?=
 =?utf-8?B?UHVKSmUrN3dYZHFjaDVnQ0gxcFYzRVBtRlJuQUZLWGp2NVFMUC9DMmduZm81?=
 =?utf-8?B?R2Z2Q3EyVEYyc2ZBbGNFSEZ5TnpLV2FJNkFwM0Y3UEdEeitnZk94bGFwN0FK?=
 =?utf-8?B?N2MyZjhuY2M5QytnOXVHSE5XTGNGZnpUdDdpWHVOUEo1T3N3WE9WYURHZmJG?=
 =?utf-8?B?RCt0VDgxdEhjejczSlFvQVliOE56cmd6NkZXcDdRSElzQWNDb3V1dG1hUktk?=
 =?utf-8?B?WFZIbWo2T2ptS0JqeTNqT2l0b3YwZlJLUy84RkRGSTFtVWl4aitzeXdNOHNw?=
 =?utf-8?B?NFRCUVd3Nm9CbnVWWm5LUEVNdGo4YVZFS2MrdXhGVHMvVFczT3JhMW9DTmRW?=
 =?utf-8?B?ZnM4aU5ESUczM2FSMVZPMGhFMUZMMTZkaGRLc2Fxc3MwRHBHNmNucXJYaXEz?=
 =?utf-8?B?VEJ0ejlUbHB3WitFdGFzQkhkczZxVGdOa2IyZGlINVJsa1BNVEVsSmg1eWJ3?=
 =?utf-8?B?QUNRUEsvRVNXVUtCVENyMTl5bURTOEtjcWl5c3R5TkVZM0xOOXpYNW1IU3ZZ?=
 =?utf-8?B?UnBKd21zbk1ueDR3WnFHUWhIemRmcjBjZWlkWTBIQlA5OUtZUFJpTW1lQ3BG?=
 =?utf-8?B?OVo3MnlsUk15V1p5NmlJN1lOSXVScS80dlErTldwbmpTZnZSbmRxOFROU3lO?=
 =?utf-8?B?WHdhRitMOVgxdGdTZzJ6RU9BelhiMmZEU0JOallXS0hTV2VuNEU1Vzd2MDlv?=
 =?utf-8?B?NThRV0lpZUFlc3VpNGRMV0kvSU9QQkRZaWFyYUVOUUlCVUNXY3BUalZxTEJk?=
 =?utf-8?B?MGtmOUR6RVJaWXMzL0UyRW1nTFZqWU9KeVJGNjdVb1l0eGEyTW9BVGNBR1dj?=
 =?utf-8?B?ZzZPbDBrclhUY0gxR1ZVdzZBSGx5MXZvZE05ZjFLclFucEZKZkt0bHBIVXgr?=
 =?utf-8?B?cWhkdVl1eFMwb2p5SEJnY1RNYjBpb3llMDh2NE1zSTF5U1ZnM2FvdTB0U05S?=
 =?utf-8?B?dGZpbTE0cndYKzlsVjNENkV3Qi9uMEV6Q21BMVVBUWJRLzlJa3hVOW80MXZJ?=
 =?utf-8?Q?75uU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4889D485B3B4B34AB8331340036EC7B7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f0ba7f-4597-4eb0-ff80-08dbf171948d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:57:12.8543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hO2RJu4CtM0Z9UTVRRboBZ1MNO5mKcsgLp7A6psrhBE/BNG8/6PpdpQyEhxTV9uNSXutkCWOh3czMvVTjq13pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631

DQpPbiAyMDIzLzExLzI5IDAwOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IE5vdiAyOCwgMjAyMyBhdCAwMzo0MjozMVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMjguMTEuMjMgMTU6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gRnJp
LCBOb3YgMjQsIDIwMjMgYXQgMDY6NDE6MzZQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+IEluIFBWSCBkb20wLCBpdCB1c2VzIHRoZSBsaW51eCBsb2NhbCBpbnRlcnJ1cHQgbWVjaGFu
aXNtLA0KPj4+PiB3aGVuIGl0IGFsbG9jcyBpcnEgZm9yIGEgZ3NpLCBpdCBpcyBkeW5hbWljLCBh
bmQgZm9sbG93DQo+Pj4+IHRoZSBwcmluY2lwbGUgb2YgYXBwbHlpbmcgZmlyc3QsIGRpc3RyaWJ1
dGluZyBmaXJzdC4gQW5kDQo+Pj4+IGlmIHlvdSBkZWJ1ZyB0aGUga2VybmVsIGNvZGVzLCB5b3Ug
d2lsbCBmaW5kIHRoZSBpcnENCj4+Pj4gbnVtYmVyIGlzIGFsbG9jZWQgZnJvbSBzbWFsbCB0byBs
YXJnZSwgYnV0IHRoZSBhcHBseWluZw0KPj4+PiBnc2kgbnVtYmVyIGlzIG5vdCwgbWF5IGdzaSAz
OCBjb21lcyBiZWZvcmUgZ3NpIDI4LCB0aGF0DQo+Pj4+IGNhdXNlcyB0aGUgaXJxIG51bWJlciBp
cyBub3QgZXF1YWwgd2l0aCB0aGUgZ3NpIG51bWJlci4NCj4+Pj4gQW5kIHdoZW4gd2UgcGFzc3Ro
cm91Z2ggYSBkZXZpY2UsIFFFTVUgd2lsbCB1c2UgaXRzIGdzaQ0KPj4+PiBudW1iZXIgdG8gZG8g
bWFwcGluZyBhY3Rpb25zLCBzZWUgeGVuX3B0X3JlYWxpemUtPg0KPj4+PiB4Y19waHlzZGV2X21h
cF9waXJxLCBidXQgdGhlIGdzaSBudW1iZXIgaXMgZ290IGZyb20gZmlsZQ0KPj4+PiAvc3lzL2J1
cy9wY2kvZGV2aWNlcy94eHh4Onh4Onh4LngvaXJxIGluIGN1cnJlbnQgY29kZSwNCj4+Pj4gc28g
aXQgd2lsbCBmYWlsIHdoZW4gbWFwcGluZy4NCj4+Pj4gQW5kIGluIGN1cnJlbnQgY29kZXMsIHRo
ZXJlIGlzIG5vIG1ldGhvZCB0byB0cmFuc2xhdGUNCj4+Pj4gaXJxIHRvIGdzaSBmb3IgdXNlcnNw
YWNlLg0KPj4+DQo+Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIGp1c3QgaW50cm9k
dWNlIGEgbmV3IHN5c2ZzIG5vZGUgdGhhdA0KPj4+IGNvbnRhaW5zIHRoZSBnc2kgaWYgYSBkZXZp
Y2UgaXMgdXNpbmcgb25lIChtdWNoIGxpa2UgdGhlIGlycSBzeXNmcw0KPj4+IG5vZGUpPw0KPj4+
DQo+Pj4gU3VjaCBpb2N0bCB0byB0cmFuc2xhdGUgZnJvbSBJUlEgdG8gR1NJIGhhcyBub3RoaW5n
IHRvIGRvIHdpdGggWGVuLCBzbw0KPj4+IHBsYWNpbmcgaXQgaW4gcHJpdmNtZCBkb2VzIHNlZW0g
cXVpdGUgc3RyYW5nZSB0byBtZS4gIEkgdW5kZXJzdGFuZA0KPj4+IHRoYXQgZm9yIHBhc3N0aHJv
dWdoIHdlIG5lZWQgdGhlIEdTSSwgYnV0IHN1Y2ggdHJhbnNsYXRpb24gbGF5ZXIgZnJvbQ0KPj4+
IElSUSB0byBHU0kgaXMgYWxsIExpbnV4IGludGVybmFsLCBhbmQgaXQgd291bGQgYmUgbXVjaCBz
aW1wbGVyIHRvIGp1c3QNCj4+PiBleHBvc2UgdGhlIEdTSSBpbiBzeXNmcyBJTU8uDQo+Pg0KPj4g
WW91IGFyZSBhd2FyZSB0aGF0IHdlIGhhdmUgYSBYZW4gc3BlY2lmaWMgdmFyaWFudCBvZiBhY3Bp
X3JlZ2lzdGVyX2dzaSgpPw0KPj4NCj4+IEl0IGlzIHRoZSBYZW4gZXZlbnQgY2hhbm5lbCBkcml2
ZXIgYmVpbmcgcmVzcG9uc2libGUgZm9yIHRoZSBHU0k8LT5JUlENCj4+IG1hcHBpbmcuDQo+IA0K
PiBJJ20ga2luZCBvZiBsb3N0LCB0aGlzIHRyYW5zbGF0aW9uIGZ1bmN0aW9uIGlzIHNwZWNpZmlj
YWxseSBuZWVkZWQgZm9yDQo+IFBWSCB3aGljaCBkb2Vzbid0IHVzZSB0aGUgWGVuIHNwZWNpZmlj
IHZhcmlhbnQgb2YgYWNwaV9yZWdpc3Rlcl9nc2koKSwNCj4gYW5kIGhlbmNlIHRoZSBJUlEgPC0+
IEdTSSByZWxhdGlvbiBpcyB3aGF0ZXZlciB0aGUgTGludXgga2VybmVsIGRvZXMNCj4gb24gbmF0
aXZlLg0KPiANCj4gSSBkbyB1bmRlcnN0YW5kIHRoYXQgb24gYSBQViBkb20wIHRoZSBwcm9wb3Nl
ZCBzeXNmcyBnc2kgbm9kZSB3b3VsZA0KPiBtYXRjaCB0aGUgaXJxIG5vZGUsIGJ1dCB0aGF0IGRv
ZXNuJ3Qgc2VlbSBsaWtlIGFuIGlzc3VlIHRvIG1lLg0KPiANCj4gTm90ZSBhbHNvIHRoYXQgUFZI
IGRvZXNuJ3QgdXNlIGFjcGlfcmVnaXN0ZXJfZ3NpX3hlbl9odm0oKSBiZWNhdXNlDQo+IFhFTkZF
QVRfaHZtX3BpcnFzIGZlYXR1cmUgaXMgbm90IGV4cG9zZWQgdG8gUFZILCBzbyBJIGV4cGVjdCBp
dCB1c2VzDQo+IHRoZSB4ODYgYWNwaV9yZWdpc3Rlcl9nc2lfaW9hcGljKCkuDQpZZXMsIFBWSCB1
c2UgYWNwaV9yZWdpc3Rlcl9nc2lfaW9hcGljLCB0aGFuayBSb2dlciBmb3IgZXhwbGFuYXRpb24u
DQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENo
ZW4uDQo=

