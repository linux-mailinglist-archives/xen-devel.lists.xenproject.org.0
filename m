Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA6A74557
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930268.1332918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty53e-0002aK-9Q; Fri, 28 Mar 2025 08:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930268.1332918; Fri, 28 Mar 2025 08:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty53e-0002Yj-68; Fri, 28 Mar 2025 08:27:18 +0000
Received: by outflank-mailman (input) for mailman id 930268;
 Fri, 28 Mar 2025 08:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jzi5=WP=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ty53b-0002Yd-U7
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:27:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2406::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7315d68f-0bae-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 09:27:14 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 08:27:10 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 08:27:10 +0000
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
X-Inumbo-ID: 7315d68f-0bae-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeKgqRDa7qTdZTB2e3C8eeeb0YVlE3Vilv+KOOSJga+nbKXgmCdpL9Iy241B2LCEcj5L5qd92R1rVlEIkg6PjQKYgPiZH9YquFu97UfM1441dmOVOJf1qkYctIEckvRsP1o67fiNJxOhuNGYUl/Swjz3XiDj/Wtn5WwLp8r4hhIc1VO5SYGAL21CBmwxRyIm/i61yIRW4JpOy/SNZEW45+gbt0UBIyJOL2axUtMfMd0D0ta4JiFNmkWhBWUQa/YrYbGCK1s7Ox/zjwsV4kd2bHlnMQ5VM2GkAFM4FvpzUblmZ9RSmAbmEVQBpoFgtc9CxCh8BQKD5kIY6Gd07QIvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+sxh/AR3JEoN3w6JEfcd1rT012gUAT3IpQlzHXDyo0=;
 b=oCBI7yMFbFsd23nOfLoAwz1jHsmHVmQ2F5a5SWPlDlCjfPaRDsDAbDPEpE8rHm5hLjzI9ft47I5yugLcoI76vnkmzGMIDlZbrvkZjB1z2LS331IYTdGUTywaarRLW+X2/YfzJUZ/IPSI3wLgF6i865TWfMPVysvh+Hg2JWPwHIfGsAFLGJp7pIOz1dPzxodT0vOy5+63Q/YgP3BiAvS1ZO/Ituhy8oiCkFZqM/XMG6DWhbRrtuEnFq9MG/70GjwmQaYa9irPDp2+DO5BCV9flGJYTExuf3A6IZCnsRp6E0sLDM3pG34hNxWGPzE5Ir3rXel+6vPDRx+btAZy86Auxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+sxh/AR3JEoN3w6JEfcd1rT012gUAT3IpQlzHXDyo0=;
 b=UeSrJXXWU5tdcnbCUjrpRf7wICmxLTVdrNFfUSWxDNUo9bdYo/LiUaxpZHajMw/mJQlqSXqejTQyOUY1CUWAZ9jz/+nv4g+8doszLoWb4GNQY21RZWxChiYHK50GxCsQ50cZ1Tuw1Jrn7LtRZsQXWnxCh+hZ4mRJY2juq2eaatk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbjnNoHifd0xPBh0uO6pYxtSnz1bOCdRiAgADdX2CAAEa1gIAEuShQ
Date: Fri, 28 Mar 2025 08:27:10 +0000
Message-ID:
 <DM4PR12MB845155F64B8B08408D68CE14E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-3-Penny.Zheng@amd.com>
 <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
 <DM4PR12MB845156C8C25495D7DB396ED9E1A72@DM4PR12MB8451.namprd12.prod.outlook.com>
 <c46e1b7a-d765-421f-a7a8-9187bfb5b732@suse.com>
In-Reply-To: <c46e1b7a-d765-421f-a7a8-9187bfb5b732@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e04d8d73-49f7-47a4-89e8-57f62d882f9f;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-28T08:26:37Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB9128:EE_
x-ms-office365-filtering-correlation-id: bec68a32-5671-4e46-adba-08dd6dd25597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T01NSGYyanhJWEdtSU9jL0hGMlJoandWMStjUXFWdXhWODd6K0RXZWRDQ0Zj?=
 =?utf-8?B?ZFBSVVI0c0Z3NDErOU1qMHJvY3E3bFhvLzZ6VHVPbFVIVnpNT0UzWVJ6UHpY?=
 =?utf-8?B?TDRsRWx3L0JOc1ZMa2FEVGpIVldORDBTV25kZTMyRkdIbnRJNTVnNGVoUEJq?=
 =?utf-8?B?aEZiNDQ3VHAySVhuS28vV3FZTzVzZXdBdUxwbFZWT2lqeFJXa3FmSUE0M1NV?=
 =?utf-8?B?dkJ3UUVYbXI5Q3NiZG9jMGRhS3h0NEhUby95clJabkZVUlEwRjhUQXlBQmRN?=
 =?utf-8?B?YUh3c1FvR0EySjN5VnJBVVlaS0FaeDNxWkw4azVRRXR1SG9YVDl1ZE9MZS9V?=
 =?utf-8?B?eENNOEdTaitKMVRtVHV2MndpL1B5K25mdEdQVk5KK0NNNjBKaTdsM3hHODBT?=
 =?utf-8?B?MWJhUHM0MDZiRFRwNTZ2Z0pJcDlDN0VBYktGVEhvNlBScHdmOHdCNnNyZDhI?=
 =?utf-8?B?bERFMkJLMzl4bzhxdGxuK0J6eHlHMG1ZQ1BhL3FKLzZGMUZ4bmJqdTNmcnJk?=
 =?utf-8?B?UkdBU3ovTjByOW9SbE0yc2pTaEtrME5EQlFkb0pQZ09CV09qOUxldHp6MzMx?=
 =?utf-8?B?bXA4cGFIam9NcHNNTGNWcDNmUjVTVk1aWkZybjIzSDdnV1JLcFNJWW8zNkVE?=
 =?utf-8?B?TThjc2JMWlBzL2ozYXF0SnhEb3BweE9TSndyb2pLWVNIWE40WTZlelE0SGg5?=
 =?utf-8?B?OG4xU2UwVjUvald0eWVVbVBhR0J5S3M4MFhBU0lacEl1UFAzRTBRcmNwbWtJ?=
 =?utf-8?B?eUhMVTRmL3AzSkI3VU1tQkZLS0pweSt4K2UyY2JiNk5jZENKcjlJU1JhQU93?=
 =?utf-8?B?N3hhUlFIWC90ZHpDVFRGdWdhek9SQm5sL0VVdmtJY0xIWDRISWx5NE0raW1S?=
 =?utf-8?B?OTdNSTdsWGZYWFV1ejhmSEZrMzR2YXIwZWt6UTBYY0RmdDFTK09oMUt6Sjh4?=
 =?utf-8?B?R0JTM3lYcDVpYXVSRklYQlFiSnk2WHlxMnEwdm54ZjhIZUxMenZTVHF3WDJT?=
 =?utf-8?B?MUJISXRxK2VlZ3Q0ZFoxNG52THJlTlMyMklrbGVEZE93dTZYSkRVRitNNWhm?=
 =?utf-8?B?cTN1bVpNbzllSkpJNVpObklsM0xYVEFWczBaYU51WHlVT2hRZWlDZUxmR1p2?=
 =?utf-8?B?dE5qVkFyYUJyajg5U2N2c2grTE5pdjZMQmg0QmhraElvYlVtQ1pXcWFMRlRW?=
 =?utf-8?B?YlRMSU5PRW1QR2lzVktCaEovTXRVNnV1TEY2RllZcE1INWd1enhRTGRJQVZZ?=
 =?utf-8?B?K2pYQk93MFh1eGY4clRubS9xYmpTZVRjcWhvM3lqSDBacUJyYXBoMVlnZ0o0?=
 =?utf-8?B?WHJVZ0NMSjhjVU1xSVFaQWMweVRTaXZGN1hVOGJsOVNsQUQ0NGlGYks0dkFT?=
 =?utf-8?B?V1pLdzB4MHM1emJtNVJFd3MybHI2UWUwT2pCaElXZ1JLTlRlelM1OVQ3SDMr?=
 =?utf-8?B?eU9wN1NYM3d2SG0wZjFwaDkvMUdCRTR6NnR6bFptaER3c3dwMVE0bHQvSmhm?=
 =?utf-8?B?dVVZajEvbnFKaWlsK3FuNmc3U0IxT2ZTbGJGbmxQRjBPRE1mWkNIQW9hZ0FM?=
 =?utf-8?B?bEJtOXcyRVNmaTRXY01zdDNHQ3h4WStyMktNdVFOTWZMWGJ3K0dYUGRLK2Zt?=
 =?utf-8?B?dVlvV0lKVDR6NFRNWTBlMFZLU3FLQ0Y4WmtCMmRHTlJTZXJ2cXExRU9sNUs1?=
 =?utf-8?B?V0JnUGN6aUkraCtSNTRpNklOYkI0bTFUU3VWS2oxbUo1Ti9kdjlBek9LQjlY?=
 =?utf-8?B?YmhTaHh5Z1lQNXVNemZUMnY3NkNzMmVCdWtzMi9FbTBXdzVJZmVmc1hvY1F1?=
 =?utf-8?B?Zm9SSm5rS2c5NUZGaDBQMnpNb2lNa3pJT1RvVEEzUlQ3Tk8rWUtWYWszWC9F?=
 =?utf-8?B?OFRBMFBSQjBmSzUrdlU1UXRUSkViSlRRbzdPWDk2R3Fma2hISmZNTFlkcGhU?=
 =?utf-8?Q?VRggfcWcAgDuorVyBvEZYfNg2HYqTkOm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nkp4RllXRXJUV1JhU3FnOG5mK2QxazVJSTZjQkVmbUJ4ay80YnkvcHFCSXl0?=
 =?utf-8?B?VlZMc3NNbVE1cDAwdjZPUVd3Z1hDT0xxc203N2ZrUDN6M2tDcEkxZ3B6RmVi?=
 =?utf-8?B?akNoUTVMT2IrQlhTdExFeGdJVVV6SzQvOGtQS2grZGZHR1hwSE56a2lWRVor?=
 =?utf-8?B?c3dtV3pjMU9VTk1qMFhOZzNZMVZtUnRxL25NSDJHTGZwa0MxeDNFS09MLzVG?=
 =?utf-8?B?ZUtIKzJ5ZWk2dU1qRW5HNnoyTi9zeW1VaWhpN2JGeGUwbjAwNDdYdkRoWE52?=
 =?utf-8?B?T05HKzBma2ZncGkwOStsd2lnMEd3ZGNDaWxlSHEvZlUxdVlMeTNaQWZMb3Zo?=
 =?utf-8?B?RnNpQW1GZVZDc0xDM2d0T3JXNzhsMm9oZWVRSlZuL1ZTNU9pWk01Z1hleE9a?=
 =?utf-8?B?Si8yb1NLeUNyR3RZUUJYbjR4UDdkVnpqMnE0bU80U1VsNGQvMmIwbjRVWU9E?=
 =?utf-8?B?anZ2MmtDT3BXM0xqMlFyTlBlQXJkdHRuMERhMVR1SWxwUVlYMVlBYjNlMzRW?=
 =?utf-8?B?MDgxSkprZmcwc0c2ajB4NFRKYVpOWjErNmVCbXVrVkpsODJhZnVCMXhIUkNl?=
 =?utf-8?B?NjFxeXpRMVNRUjBmMDhQMjZSREFnTWlRU2ZEdGhwZXVMTDErdHptMGR6ODh1?=
 =?utf-8?B?SFJkUVRTQS8vWXhWYUxCV004dEt4VWhVR1NPK1Q5dEZSZEhFZ1Y5VVhDU0cx?=
 =?utf-8?B?YkQ2Qy83d2tRN3hjYzlSck5MK1k1aVpwcnVvOCtJSmMyYUdSKzhGckk3Y21E?=
 =?utf-8?B?dFRmMzBxZWxHZHVPdUprUE5TQTJkMmc1ZUp5TXpKeEFOdHRpZlNlWlhxMmcr?=
 =?utf-8?B?dDZDREo1NjNxYUttMkRKaWpaWmVuQVpwY2JtNStFMXg1K3RCUXM1bE41ZDJY?=
 =?utf-8?B?YVNXR3VvdlpXemIxU3dpWXJZM2N4M2k4RURXYWYyVXRqRVFTbDc4Z1ZiK0xt?=
 =?utf-8?B?WEpWSlRBVzloOXAzQjVpMUw1bUtpL1VhQ2E5ZVdVdEZna2RudmJZN3dRSXlp?=
 =?utf-8?B?NkVGYzR2RGVicUlKb0hEdHE1T2ZLdXJ6TnNNMndUZXFnRHYxVXFsYmtKNEw4?=
 =?utf-8?B?WTF1OWpSK1BCR1VuNkxyc0Q5Y1JJZ1lPNEpyMi9VTjBBdzVqb0NvNzY3THA3?=
 =?utf-8?B?OHlreFVxRkxYNGRRVVdkUUlGS0taVmZPNElZcWF1a0prQ1RYdHhibUNzb3d1?=
 =?utf-8?B?aWVCWWQ2M2RUMjkzcGdGbVZZcE04bWh6bmxmaS8zUHc3S0U4TERzcDR5S2R2?=
 =?utf-8?B?Q3B3ckZJMjQyNnN5d2FEQ2hadForQ1daRVYzRDQrRFJSRWtMRW13S1pIN1I0?=
 =?utf-8?B?OS9PWlV1Rzd4dDIzVHVUemxUVWhjNTYyUllLT1VHWUpWemV4eG51WGVZbkRW?=
 =?utf-8?B?WmxUMmJBWjRXVThYc0VvcE1UMTJhY2xldEhvSnZjc0cvNXdmRzlNVVNKaUNG?=
 =?utf-8?B?RjFINGVqdnN0czBPTzNNcmlMbmwvZXZVRFFodXY4dVhGWDZsQXlHOHIzREhu?=
 =?utf-8?B?YWliTkU4K0NzOGo2TmRNZ2svak9NS1JuRzRVZmUwZ0FYZFZLL0N0cjhzQnZD?=
 =?utf-8?B?bUdqb3cvMGkxVkt4Y0JFand3ZXJxU2F5YmlDeXBwSU5Xd1FkT3RvZXdScnVw?=
 =?utf-8?B?T3lYbmV4MHpwa3dOQk9VRWFuVllpVERHaHhhYkpGZU1CY21mNnpnQVBld0NO?=
 =?utf-8?B?alBFNityRjNtWnN0WFZHMG5oVTdPK01vMW5WWk1BcFZ4SWRLbStVZXRVN2xv?=
 =?utf-8?B?bTMrWGlPRjR3TnpQdUhWai9xRE8zRnhBUHQyT0cyaHptUEwwYUhDQ0hKNGcx?=
 =?utf-8?B?YTViWGdJNW1zeVNLSWltcXFYQzNrTC9hbUY3d0FOU1JaYjkwVDVBUGN3V28r?=
 =?utf-8?B?czBVNVFPN1c0SXl4UnlqeWczeit0VHFRNXo1Y0hYRDd0YnlFcGd2RklkQ09K?=
 =?utf-8?B?NS9ZaEM5TnVQTDVvcS9CaFQvbXZBSmpmZzQwS0lpMmlYTy8wK0pkL2toVGQ3?=
 =?utf-8?B?T2FoQnZ1S2xzUExYQzIycWdYVm9oNncrbXZxK09oSFVYZ0xmdFdHc2hPcEhk?=
 =?utf-8?B?dW1BaTE1YWF3Ly9oOWRBTElvR2FxTkJPN1hhaHo5amF2K29tR3FaOXdpQVlZ?=
 =?utf-8?Q?a2ZI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec68a32-5671-4e46-adba-08dd6dd25597
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 08:27:10.2945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQ0fDVzfcCZLSU9JiGX/lWAwwM3Owb4rHhUJVE7giTv6fu0PeITi76onC35WE6S4ac2vBBtOdUG3GdEGXiHvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAy
NSwgMjAyNSAzOjU0IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNo
PjsgT3J6ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDIvMTVdIHhlbi94ODY6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBw
cm9wYWdhdGUNCj4gQ1BQQyBkYXRhDQo+DQo+IE9uIDI1LjAzLjIwMjUgMDU6MTIsIFBlbm55LCBa
aGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIE1hcmNo
IDI0LCAyMDI1IDEwOjI4IFBNDQo+ID4+DQo+ID4+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+Pj4gKyAgICBwbV9pbmZvID0gcHJvY2Vzc29yX3BtaW5mb1tjcHVp
ZF07DQo+ID4+PiArICAgIC8qIE11c3QgYWxyZWFkeSBhbGxvY2F0ZWQgaW4gc2V0X3BzZF9wbWlu
Zm8gKi8NCj4gPj4+ICsgICAgaWYgKCAhcG1faW5mbyApDQo+ID4+PiArICAgIHsNCj4gPj4+ICsg
ICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4+PiArICAgICAgICBnb3RvIG91dDsNCj4gPj4+ICsg
ICAgfQ0KPiA+Pj4gKyAgICBwbV9pbmZvLT5jcHBjX2RhdGEgPSAqY3BwY19kYXRhOw0KPiA+Pj4g
Kw0KPiA+Pj4gKyAgICBpZiAoIGNwdWZyZXFfdmVyYm9zZSApDQo+ID4+PiArICAgICAgICBwcmlu
dF9DUFBDKCZwbV9pbmZvLT5jcHBjX2RhdGEpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBwbV9pbmZv
LT5pbml0ID0gWEVOX0NQUENfSU5JVDsNCj4gPj4NCj4gPj4gVGhhdCBpcyAtIHdoaWNoZXZlciBE
b20wIGludm9rZWQgbGFzdCB3aWxsIGhhdmUgZGF0YSByZWNvcmRlZCwgYW5kDQo+ID4+IHRoZSBv
dGhlciBlZmZlY3RpdmVseSBpcyBkaXNjYXJkZWQ/IEkgdGhpbmsgYSB3YXJuaW5nIChwZXJoYXBz
IGENCj4gPj4gb25lLXRpbWUgb25lKSBpcyBtaW5pbWFsbHkgbmVlZGVkIHRvIGRpYWdub3NlIHRo
ZSBjYXNlIHdoZXJlIG9uZSB0eXBlIG9mDQo+IGRhdGEgcmVwbGFjZXMgdGhlIG90aGVyLg0KPiA+
Pg0KPiA+DQo+ID4gSW4gbGFzdCB2MiBkaXNjdXNzaW9uLCB3ZSBhcmUgZGlzY3Vzc2luZyB0aGF0
IGVpdGhlciBzZXRfcHhfcG1pbmZvIG9yDQo+ID4gc2V0X2NwcGNfcG1pbmZvIHNoYWxsIGJlIGlu
dm9rZWQsIHdoaWNoIG1lYW5zIGVpdGhlciBQWCBkYXRhIGlzIHJlY29yZGVkLCBvcg0KPiBDUFBD
IGRhdGEgaXMgcmVjb3JkZWQuDQo+ID4gQ3VycmVudCBsb2dpYyBpcyB0aGF0LCBjcHVmcmVxIGNt
ZGxpbmUgbG9naWMgd2lsbCBzZXQgdGhlDQo+ID4gWEVOX1BST0NFU1NPUl9QTV9QWC9DUFBDIGZs
YWcgdG8gcmVmbGVjdCB1c2VyIHByZWZlcmVuY2UsIGlmIHVzZXINCj4gPiBkZWZpbmVzIHRoZSBm
YWxsYmFjayBvcHRpb24sIGxpa2UgImNwdWZyZXE9YW1kLWNwcGMseGVuIiwgd2Ugd2lsbCBoYXZl
IGJvdGgNCj4gWEVOX1BST0NFU1NPUl9QTV9QWCB8IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyBzZXQg
aW4gdGhlDQo+IGJlZ2lubmluZy4NCj4gPiBMYXRlciBpbiBjcHVmcmVxIGRyaXZlciByZWdpc3Rl
ciBsb2dpYywgYXMgb25seSBvbmUgcmVnaXN0ZXIgY291bGQgYmUNCj4gPiByZWdpc3RlcmVkICwg
aWYgYW1kLWNwcGMgYmVpbmcgcmVnaXN0ZXJlZCBzdWNjZXNzZnVsbHksIGl0IHdpbGwgY2xlYXIg
dGhlDQo+IFhFTl9QUk9DRVNTT1JfUE1fUFggZmxhZyBiaXQuDQo+ID4gQnV0IGlmIGl0IGZhaWxz
IHRvIHJlZ2lzdGVyLCBmYWxsYmFjayBzY2hlbWUga2lja3Mgb2ZmLCB3ZSB3aWxsIHRyeQ0KPiA+
IHRoZSBsZWdhY3kgUC1zdGF0ZXMsIGluIHRoZSBtZWFuIHRpbWUsIGNsZWFyaW5nIHRoZQ0KPiBY
RU5fUFJPQ0VTU09SX1BNX0NQUEMuDQo+ID4gV2UgYXJlIHRyeWluZyB0byBtYWtlIFhFTl9QUk9D
RVNTT1JfUE1fUFggYW5kDQo+IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQw0KPiA+IGV4Y2x1c2l2ZSB2
YWx1ZXMgYWZ0ZXIgZHJpdmVyIHJlZ2lzdHJhdGlvbiwgd2hpY2ggd2lsbCBlbnN1cmUgdXMgdGhh
dA0KPiA+IGVpdGhlciBzZXRfcHhfcG1pbmZvIG9yIHNldF9jcHBjX3BtaW5mbyBpcyB0YWtlbiBp
biB0aGUgcnVudGltZS4NCj4NCj4gWWV0IHlvdSByZWFsaXplIHRoYXQgdGhpcyBpbXBsaWVzIERv
bTAgdG8ga25vdyB3aGF0IGNvbmZpZ3VyYXRpb24gWGVuIHVzZXMsIGluDQo+IG9yZGVyIHRvIGtu
b3cgd2hpY2ggZGF0YSB0byB1cGxvYWQuIFRoZSBiZXN0IGFwcHJvYWNoIG1pZ2h0IGJlIHRvIGhh
dmUNCj4gRG9tMCB1cGxvYWQgYWxsIGRhdGEgaXQgaGFzLCB3aXRoIHVzIG1lcmVseSBpZ25vcmlu
ZyB3aGF0IHdlIGNhbid0IG1ha2UgdXNlIG9mLg0KDQpQTFogY29ycmVjdCBtZSBpZiBJIHVuZGVy
c3RhbmQgeW91IHdyb25nbHk6DQpSaWdodCBub3csIEkgd2FzIGxldHRpbmcgRE9NMCB1cGxvYWQg
YWxsIGRhdGEgaXQgaGFzLCBhbmQgaW4gdGhlIFhlbjoNCmBgYA0KICAgIGNhc2UgWEVOX1BNX0NQ
UEM6DQogICAgICAgIGlmICggISh4ZW5fcHJvY2Vzc29yX3BtYml0cyAmIFhFTl9QUk9DRVNTT1Jf
UE1fQ1BQQykgKQ0KICAgICAgICB7DQogICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUEVEOw0K
ICAgICAgICAgICAgYnJlYWs7DQogICAgICAgIH0NCiAgICAgICAgcmV0ID0gc2V0X2NwcGNfcG1p
bmZvKG9wLT51LnNldF9wbWluZm8uaWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
b3AtPnUuc2V0X3BtaW5mby51LmNwcGNfZGF0YSk7DQogICAgICAgIGJyZWFrOw0KDQogICAgY2Fz
ZSBYRU5fUE1fUFg6DQogICAgICAgIGlmICggISh4ZW5fcHJvY2Vzc29yX3BtYml0cyAmIFhFTl9Q
Uk9DRVNTT1JfUE1fUFgpICkNCiAgICAgICAgew0KICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNV
UFBFRDsNCiAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICB9DQogICAgICAgIHJldCA9IHNldF9w
eF9wbWluZm8ob3AtPnUuc2V0X3BtaW5mby5pZCwgJm9wLT51LnNldF9wbWluZm8udS5wZXJmKTsN
CiAgICAgICAgYnJlYWs7DQpgYGANCkkgcmVsaWVkIG9uIGZsYWcgWEVOX1BST0NFU1NPUl9QTV9D
UFBDIGFuZCBYRU5fUFJPQ0VTU09SX1BNX1BYIHRvIGNob29zZSB3aGljaA0KaW5mbyB3ZSBzaGFs
bCByZWNvcmQuDQpGaXJzdGx5LCB3ZSBzaGFsbCBub3QgcmV0dXJuIC1FT1BOT1RTVVBQRUQgZXJy
b3IgYWJvdmUgdGhlcmUuDQoNCj4gVGhlIG9yZGVyIG9mIHVwbG9hZGluZyAoQ1BQQyBmaXJzdCBv
ciBDUFBDIGxhc3QpIHNob3VsZG4ndCBtYXR0ZXIuIFRoZW4gKGFuZCBvbmx5DQo+IHRoZW4sIGFu
ZCAtIGZ0YW9kIC0gb25seSB3aGVuIHVwbG9hZGluZyBvZiB0aGUgIndyb25nIiBraW5kIG9mIGRh
dGEgZG9lc24ndCByZXN1bHQgaW4NCj4gYW4gZXJyb3IpIHRoaW5ncyBjYW4gZ28gd2l0aG91dCB3
YXJuaW5nLg0KDQpUaGVuIGluDQpgYGANCiAgICBwbV9pbmZvLT5pbml0ID0gWEVOX0NQUENfSU5J
VDsNCiAgICByZXQgPSBjcHVmcmVxX2NwdV9pbml0KGNwdWlkKTsNCmBgYA0KV2Ugc2hhbGwgYWRk
IHdhcm5pbmcgaGVyZSB0byBjbGFyaWZ5IG5vIGZhbGxiYWNrIHNjaGVtZSB0byByZXBsYWNlIG5v
dywgd2hlbiByZXQgaXMgbm90IHplcm8uDQoNCj4NCj4gSmFuDQo=

