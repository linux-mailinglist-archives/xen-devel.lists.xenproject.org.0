Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F692A174
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755351.1163692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmpv-0000gs-JW; Mon, 08 Jul 2024 11:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755351.1163692; Mon, 08 Jul 2024 11:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmpv-0000ew-H0; Mon, 08 Jul 2024 11:47:15 +0000
Received: by outflank-mailman (input) for mailman id 755351;
 Mon, 08 Jul 2024 11:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmpu-0000du-3j
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:47:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d013230d-3d1f-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 13:47:12 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 11:47:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 11:47:08 +0000
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
X-Inumbo-ID: d013230d-3d1f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SU5vxqUDYtygq9a0YUj5G28ynUSsqDFQ6Vj1rVwFnu3RUmaEj91bjURcYGXYctIWjCaQebOqlBT+IgjgpTj6/Q4B7FOiwY5RFMbv2kzsq9aqLWanV1+/tPhcGTJpqK+Bg90h0Q+PZB+ahJq3JbEyRQk+VzHTnA/5rB18HpbfFe0422+vQ3Y9WV9ilXDiLfrbFgWKZyyVmv76R45CuN9w6BVX2Y3PvHLP4hLbmLjylIomZiA5hdtSDyNhsxDBV/JTtTLqjSaY/L5RuRtOH5gFiGsqwGFHw5r75SEtpt1KR1H1PqEZ78p4pcu7bajpHbHyoNfD+CGQy8gyj65w0P8Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTfjQEt2RlMCIZuIrG6hLdyh+Dxp52qrKCycrBZ3IV0=;
 b=KbhEYPJm7tt+wUOySz5oWt6zVUd0OjvfoUdUM5+dMrVFBdGMxK0jYwcQYf8n6ITLBn0uo0Hwjr6F6QfIoYiqR3yWoali1s41iHdVLp803YPZWEDOD7wzbnOLcJQcKeQ+yeIVEzmnu0cl1GXo9gfaJvmpxNn9+YDOS1/VF8ZN2486FmoUP5tzZ6NJakXPRY4Ku7IWSR0IvASgtppV5RQwxZKBXrb1nWOpGQnninfH87KT/82qr90xtB+OTJ/E2o0Fvgo8j5z5N4KkZjtdg3yqMqCmjEtC/4IL9zf5vq+HFEPws5FlsXkGAMbUA/RPNKvw7ljd8UdhuBldNQ5oZCxy1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTfjQEt2RlMCIZuIrG6hLdyh+Dxp52qrKCycrBZ3IV0=;
 b=dtQarBQ3IBhSe+qa6bfrnOLV+HYupC5mwVsI+B895cHYfoHRLQ5zHhjYmtRHtbdkv1Id37ww1XF3WpkHyuDMEabja8No7CwW7jg8sPk3vBnl8+tOpkgnw4TmY5aA+h/rO4LSMLvJ5oELJazGSdEgs3OshSJRdayczc50gyGkmx4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH for-4.19 v2] x86/physdev: Return pirq that irq was already
 mapped to
Thread-Topic: [PATCH for-4.19 v2] x86/physdev: Return pirq that irq was
 already mapped to
Thread-Index: AQHa0Q2QSY6Mwz0FMECG0gX/YHD3QrHsoiAAgACaZIA=
Date: Mon, 8 Jul 2024 11:47:08 +0000
Message-ID:
 <BL1PR12MB58496F4B7C72AC882855EE72E7DA2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708080456.401764-1-Jiqian.Chen@amd.com>
 <905c2eb7-9fe2-4a7c-91b3-1f9df245c5a3@citrix.com>
In-Reply-To: <905c2eb7-9fe2-4a7c-91b3-1f9df245c5a3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7741.016)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6590:EE_
x-ms-office365-filtering-correlation-id: 2de0dde5-e590-496e-5663-08dc9f43b267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d05mcnZ2YTFKZEE4Q0RTNnRGWnVpdEhzL0Z1RmlJbkVtb2UycXg1LzAxWWNv?=
 =?utf-8?B?anR2UVZJTi8xQ2hVNmw3UE81WDlsdmIvZTMvZlFVT1VFU1BCaTI0d0NmeVU3?=
 =?utf-8?B?VmQ1SmF2dzB2V1dFZ3pFS0xISFBnL2NEMWUyVjhkRG5QeUxLL2QrZ0Q1cHI5?=
 =?utf-8?B?enBRMnZyazVkSGR5NlphSE9LRC9LRmFwcTluRzJqck9Fa0h2NWROanc2QU95?=
 =?utf-8?B?UUpHdittTWM1NDBxZFRreUgvOUlWcHhSVnNBUkczekN2WS9oUVRPY29aSno5?=
 =?utf-8?B?TW52L09ac0dBOFdaZmdZSmZJT0p3TnRKS2ZrYVBGSU5QU2E0YkNYMDBrWk1L?=
 =?utf-8?B?bnNrRkR2cGYra0ZCWFpNOWJhVXVUSHAyNm1kSmU4bDIreEVkRjFyVHNrRWRv?=
 =?utf-8?B?cXZoaUdxMWgzRjZyUDFMNkdSRVhxZVJuMnp2MTZpNFgyRlpyazRjS0hwOWhn?=
 =?utf-8?B?MUptRklxQVRkRDNxa2o0VWZTbllZSTE4dEFTbUVuY3hWZlNGR2ZZYkhQYldD?=
 =?utf-8?B?cGlNVzVhWmRlQnVEOHBhaXluMUp4akVmK0hHSUtKaGdwV1BQZEtNRVoyVDhw?=
 =?utf-8?B?SjJETzEvSk9BL1hzMWVNaGVITGMxOWViOUpaWjVYRUJ0bk9hMWwwUmhVbEpx?=
 =?utf-8?B?LzlsWklnNXpOWGFnRjd1V2xHSjVSNGRJb0VnWDc0bXZoSFJ4VlovVERCeXEw?=
 =?utf-8?B?WXhIZWE2MXVSVHF2cHZpU0N4blNKWWpxbGJ6ajlSbEtENHhqNnI1NzFFcUdI?=
 =?utf-8?B?SFN0WnhCUUtnTjhmVkFFM3draGYzSDN4WDU5TEtPTkNxZFlxQURkem5za3Nj?=
 =?utf-8?B?SWVqcXpxU3VNL0VpRUkrK2EwSHZYYzFybjg1bUdDaGNDUEtaaTNDVzRvVDNv?=
 =?utf-8?B?eGJzVGJiQTluR0ZBUzgzUW5xdTZya3l6ODA4Y3ViSUliRXQybGpJdHRJTURk?=
 =?utf-8?B?VEpkZjVJU2ZJa1U2QkxhdldzanBqTWpzeFg1RVM3Sm9XelpFRUVjRGUrNSsx?=
 =?utf-8?B?c0RDU1E5bGF1TG1ackw1VlhVMVh2ZU5GN043dU5CNjg2bUtMY2NqUE9XRzJP?=
 =?utf-8?B?QXlXeEhBRjMzMzNoOVVBL1Z1eTZ0Z3FKM0h0bURqcWJnUHNjWDlCUW92dyts?=
 =?utf-8?B?cE9YM1Q4aEpWa2NVR2FHSnZMRWhCUVFHWml0VHo0L0E0eU15OTlxMjZUUUxO?=
 =?utf-8?B?dWdFaG11SE1EbU5sWUQwaUJZRU9SNGE1UDF0YjFmdXBEaHhjQ1JSdVBIWDNr?=
 =?utf-8?B?SmNpK0xyWGE5dEZrTWRaRkI0Q3JWSHVUOVdkWDBETFlDd2RXbTVET0FnZEJt?=
 =?utf-8?B?YVR0ZThVMG1lekJ6cDNzenBCcmRlc2NXdDdueHVLWGk2Q2FGdGRNR1gxeG0w?=
 =?utf-8?B?R0pnLzZOK3pTb1dSSEcwUXZZYTZ3RXltT3E4MWF0UU9EVjlidmk0SHluZTlC?=
 =?utf-8?B?MGNHb3E0S0tibkdiK04yOUR1NVNPZHU5YmhwcDB0N3dFbEo4M04zOU8zNHJ0?=
 =?utf-8?B?dFg1dkh1VHcwS041ckdxS2hOR3NMa3hwTUZuK2tBQkJpVE1QRlhHcUtCU1M0?=
 =?utf-8?B?N29yeThYQ0JQVkxudXh6cFVWblJYbkp2UkVxckZSK2huWHJMTVlHRHA5S3I0?=
 =?utf-8?B?S3pnZ3QrR1JIVUdGVTkxbjF3ZzNWTWJhQitXWDZXNXY4blhpVFU3T05WRk1V?=
 =?utf-8?B?SHNkMSs5U2oxZlZOVGJUdVRBMUpFR3pJZGJXZDlmNk93a0R5Q1ZXa0RaaTdu?=
 =?utf-8?B?VEZqUjZKcExwVjRiMTBBcjVDaUozZVB5OTUxNENENmNPRWN5ZDgxZXFINHJ1?=
 =?utf-8?B?SHZtVmR0NXNaL3lUc1piNnNjb3hCMllDMDZUVHEwK0ZSQUViUEoyd2xxRUFV?=
 =?utf-8?B?Zm8zLzJucm1vNTYvK2VLN3RXOUU2NlJsM1M2TnkwbGZLbVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejdEelF1R0RlM3BqSEZBUXhrSGdLVFB5Z2F5ZUJyc3hndmlPZGlUTm9CN2d4?=
 =?utf-8?B?Y2VoNnFsVjZyK2RseDRWK2JVME1TUGltNDFtWEk1ZTVCbXNmdjFVd0Z6cGpW?=
 =?utf-8?B?dXhXSDI1OEx6WE5rcjAvZFhaeUR4L0ZzaUxDM2t2czJYT2g5ZE5TVkZjc3M1?=
 =?utf-8?B?UFVKV2FjRXUwbVVOelJGMmV2b2JVNy9Kc2RnWllDUVhSR0N4Z0htNUdGbXJt?=
 =?utf-8?B?R1FLNHZDckdzK1hFclRLMEtQZzdGam11eHVYYlp3ZVppVlFSRGg5WEVVYnhE?=
 =?utf-8?B?S0Vxb0FYR015WXVldGN3YzUrbVJkYnFVVEZaZUg3TVZzbG5RNmlBWUhLaUZx?=
 =?utf-8?B?Mm1oeUMyWDIwcTMzaDI4cDRXWFByODhHYmJFQnpOV3ZGT3lrSEwwTUlCd05J?=
 =?utf-8?B?WE0rV0M2QmlhV3c0YlBkdnM2UUxMaHVKazhzZ1I3NndkeTZWRktEemV3b1h2?=
 =?utf-8?B?WmdrSmpvWnJReSsxK0dvaWxDaHZvcUdDb0V5S1liRWpnOGNRS25SeUxXOUhC?=
 =?utf-8?B?UGJHR1RTeU0vaGF0R0p2emZEdm81SVZEVlpPTDhjL3ZOdkYrOHJsZWZmdmd1?=
 =?utf-8?B?VDUxOEZ3Q2RTTjZwWnpKQzdYend2M2VRbmdTTERxWkcwVHJGL3hkUjI5ME96?=
 =?utf-8?B?blBrTTJFRzg1YmtaZnNKa1Vwb05FU1YrdnUrNkZONEEzcytrTVA4amxEWkxj?=
 =?utf-8?B?ajVKQUQveTVMUnRDVmJvRnZmNE9OdVEyU0tCdEwyL0drbjFpYjVYYWsvcHM3?=
 =?utf-8?B?WUNjYWxhdEkvSndNWmJ0ZHZpL0daeDlWb2VOcWhKRWdwMWtlUUVtYmlWZFg4?=
 =?utf-8?B?Nmp1dUZqV2U3a2s1RWFhaVg1K2hXckNxbnZoM0Fyci9ZWTNRWU1POXNGRXFC?=
 =?utf-8?B?N21VR1NFS2NzSXVuNGV5RmxzWVAvWHVkaVgzMU45VlhhdUhvOHZBVTg0L3hQ?=
 =?utf-8?B?cTcvZCtMa1Zhd3VJeFRKYlFPR1lLWG1BTkVZSGVZVFpNTThQTTRHRUo0YWJm?=
 =?utf-8?B?WHBiOHdyeWJxaDN2TSt1c3dBTkMzSHBBNE4wNnJ3OUZmSGp4ZzBlNTRmdk92?=
 =?utf-8?B?akZaRjM3ckhldy84YUlYNERadzZsSGQxenRnVjBGNXhwSHJKa1dtRy9ydzhC?=
 =?utf-8?B?c25oNWthYng3OHFhYllDZGFpVVMyQmx0RnpvOW8xeHY2VW5ZSWVUbThZZjZs?=
 =?utf-8?B?RTFpY1hCOTlWNWQycEF5V2o2MmVvU25INldBaTZTS3E5cnhQcDFMck9XSjJr?=
 =?utf-8?B?Mnc0dkVNcEFxM2hjbUg3UVMxaU1WN0ZKQjNRV3lSbGpPeXRtMUJtb2dqeTI1?=
 =?utf-8?B?Z1NDa3hLd05xcC9ac1BEQ25EVHcxNnhjNTFjeDhGS1JSZjFBdEFFblRCWUg0?=
 =?utf-8?B?VGFjejhiTGRwTitWaUxMZWYrb2FBRTJiUXE5UzZsaGNoNUhWRmtzT2kyTUFn?=
 =?utf-8?B?RXFTWmNSQlZyN09nQVZVcWNKUWVJQTNLRGVvekw0a2tpdkZERXMyWGhxcS9U?=
 =?utf-8?B?Tm1od1l5RllrYlQxVmVQUlhUaFBpdEN1OUtlTldrYzlxMkNONFFWZEZZbXV4?=
 =?utf-8?B?dnRkVUpOdG1lMVVjNUxNTzNUbWMvNW9mNTFWdS9WSnZGWnhqenJtelIyZlND?=
 =?utf-8?B?SXJYbExmWUhNKzFyY2EzN0VDUVlpTE1TMVFabzBXMzNJaUlEa1lrK2ZzUkx2?=
 =?utf-8?B?WFU1RCtaSGJCUVhkb2crOEs1NlJLcDZpeUVNbHR1VU1JbXI4aE5lMTlxZFpl?=
 =?utf-8?B?blA0Y3hrc0plL2pNZytTY01aY1o3TXM0WVVaYk1hZjFLdkZTQlhFdUV2dnRF?=
 =?utf-8?B?dUY4d3RsaGFsbjZhSmJSYkpTNjlKMmduOTZZY3RzcWI1eEphSExXa1NHSTNO?=
 =?utf-8?B?Z1BndnJIaXFCL0dHQVQ2Q1JlUDdlb2hJUzVIbWJUSzRUNG5scWZSSnJRdUJj?=
 =?utf-8?B?cml6RHJBQk5VZ3hNVzVQYms0bm92cHV5cjB4WFBqNGF1amJ2Mnp0TDd3NFhh?=
 =?utf-8?B?VDA5MU9NM3F3WW9IMGZpTE5FOGtMb1FSNGgrZmxBMXVsV3JDbXk3cmlvUXMz?=
 =?utf-8?B?ZTIwUDhaRnpnMnJ2aUZMYnczQ0tRTGhkenJ0NWhJdStKMlVzK1NyeTMxUU5P?=
 =?utf-8?Q?67OY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADBC1A8F86B40D438EDCA73219487E41@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de0dde5-e590-496e-5663-08dc9f43b267
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 11:47:08.3965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqQ9ac7pFmBeiEsbRSeznOfjRtxWLd54gJiqvNyQBrJ66kedJKd1ocsH5EdRzNzGE9jS1y9ge8wmdi68MKZX6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590

T24gMjAyNC83LzggMTg6MzIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA4LzA3LzIwMjQg
OTowNCBhbSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBGaXggYnVnIGludHJvZHVjZWQgYnkgMDc2
MmUyNTAyZjFmICgieDg2L3BoeXNkZXY6IGZhY3RvciBvdXQgdGhlIGNvZGUgdG8gYWxsb2NhdGUg
YW5kDQo+PiBtYXAgYSBwaXJxIikuIEFmdGVyIHRoYXQgcmUtZmFjdG9yaW5nLCB3aGVuIHBpcnE8
MCBhbmQgY3VycmVudF9waXJxPjAsIGl0IG1lYW5zDQo+PiBjYWxsZXIgd2FudCB0byBhbGxvY2F0
ZSBhIGZyZWUgcGlycSBmb3IgaXJxIGJ1dCBpcnEgYWxyZWFkeSBoYXMgYSBtYXBwZWQgcGlycSwg
dGhlbg0KPj4gaXQgcmV0dXJucyB0aGUgbmVnYXRpdmUgcGlycSwgc28gaXQgZmFpbHMuIEhvd2V2
ZXIsIHRoZSBsb2dpYyBiZWZvcmUgdGhhdA0KPj4gcmUtZmFjdG9yaW5nIGlzIGRpZmZlcmVudCwg
aXQgc2hvdWxkIHJldHVybiB0aGUgY3VycmVudF9waXJxIHRoYXQgaXJxIHdhcyBhbHJlYWR5DQo+
PiBtYXBwZWQgdG8gYW5kIG1ha2UgdGhlIGNhbGwgc3VjY2Vzcy4NCj4+DQo+PiBGaXhlczogMDc2
MmUyNTAyZjFmICgieDg2L3BoeXNkZXY6IGZhY3RvciBvdXQgdGhlIGNvZGUgdG8gYWxsb2NhdGUg
YW5kIG1hcCBhIHBpcnEiKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFp
YW4uQ2hlbkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQu
Y29tPg0KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
DQo+IEFzIGEgbWlub3Igbm90ZSwgd2UgdHJlYXQgRml4ZXM6IGFzIGEgdGFnIGxpa2UgYWxsIHRo
ZSBvdGhlcnMsIHNvIHRlbmQNCj4gbm90IHRvIGhhdmUgYSBibGFuayBsaW5lIGJldHdlZW4gaXQg
YW4gdGhlIFNvQi4NCkxlYXJuZWQgaXQsIHRoYW5rIHlvdSENCg0KPiANCj4gQ2FuIGJlIGZpeGVk
IG9uIGNvbW1pdCAtIG5vIG5lZWQgdG8gcmVzZW5kLg0KPiANCj4gfkFuZHJldw0KDQotLSANCkJl
c3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

