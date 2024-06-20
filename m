Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883F910167
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 12:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744391.1151432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEx6-0001ah-VF; Thu, 20 Jun 2024 10:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744391.1151432; Thu, 20 Jun 2024 10:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKEx6-0001ZA-S9; Thu, 20 Jun 2024 10:23:36 +0000
Received: by outflank-mailman (input) for mailman id 744391;
 Thu, 20 Jun 2024 10:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3B6=NW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sKEx5-0001Z3-OQ
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 10:23:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2412::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25380066-2eef-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 12:23:34 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB7762.namprd12.prod.outlook.com (2603:10b6:610:151::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34; Thu, 20 Jun
 2024 10:23:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 10:23:29 +0000
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
X-Inumbo-ID: 25380066-2eef-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2Lcb4ldGKzfblAOsIfwnLDB+rADTWRx0WXWZYeKgGfIx5mQX/trrEzeIe8d2/T2X0jFyTM6cRguSn3Ga6nX+4Ik1HKA5mzTJA9m4nhONcoF3VQP0FGXkaKA8L7ZJtoKmpdnSuwQerUN9yVSkNQkmhiY7N1yaCRmG33/l+hTvhOXmZHFtxNXyesBnOji2Gm3XDKewiyBcA20BjCksArH4JP3r9yQQrJ3Vo4Lu9/+6c7aQ2Drz8X/qOcaUsgnetQ438sol5K4B8Ry6zOSMGh8cjWD0z54ykEAseIZvaWpveukx1DjLm0K/rYzOXNuT9rtgP7sOnD7hwD78dNFjwvJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR7W2A7mNb3N8Yx/URwMgAiAS+NDVjP4+5CZq5y4040=;
 b=TT3kb/HGlM5oVkZz1+MH/OLCIPXVvziFfHS1us9BByOIzqvTzUDehyVaVHQRAuI9Uq93HRU9tB4ErSqWrar2PjQ4fVebCr4V6TJHSOjdsXhWK71F3p5+wz8/lv1XdvOxWK4j7lmGYSDdwV7BuSQ/s0dTXAFZWqPeaWw4rh9RYhsSlr+mPeDsVBHoVxKQd6xttCuE59r4CrX3L2erQyWyea3h7L3xECHMQLQA1arPX4E7DiDiDt8NcOBS4pCWfUuOmatY6unHm8voN+EeHpqp1VhZmEnm9+JB1YsX31hJkcYrIqsRt/uiyBdwBz7HZXAX1lLWTr2ipEt2scwoBs9oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR7W2A7mNb3N8Yx/URwMgAiAS+NDVjP4+5CZq5y4040=;
 b=zypIxd9qMl47UdAmAdYF1iCl8KPG+gvjEEE1bAz7eKcShmKKnILPumZJuIhlQTY6HBVUt7/39yRMm9M9Z225rcM8hKEjoEsT0cFNfigYhE77OW+N4FfYMXW379swk06Quz9RO3GMY93SF+vhpjrg8ysaRKV/TiqAllgPeen2zX0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Topic: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Index:
 AQHawJToSxHkdXzldkCDZE5kihITT7HMD9QAgAGTOgD//5t7AIADeOiA//+SewCAAKx5AA==
Date: Thu, 20 Jun 2024 10:23:29 +0000
Message-ID:
 <BL1PR12MB5849366A442BE6C4C192ABB0E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
 <BL1PR12MB5849ABD858B72505D83678F9E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <099beaac-ed1f-459b-8c2b-42b325f8e4a4@suse.com>
In-Reply-To: <099beaac-ed1f-459b-8c2b-42b325f8e4a4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB7762:EE_
x-ms-office365-filtering-correlation-id: fc66c377-4aeb-4d08-7c62-08dc9113079d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|366013|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFBVcURpTk9BeG04RldQdDBRVUFKUWwrZDJFc2ZhdlNiY3h2Vnl6ckpLaVdS?=
 =?utf-8?B?TzhNTmZNQ0ZQRTl4ZkJCckdkWmVpN1dvem43K2RPSnAzRFFWNUtVNjhNUk10?=
 =?utf-8?B?RkREUzRpQ3pSYXM0a0d0YzhtMXhrWUFPTm1kby92c1FaNHUvcExFUEFIaHhz?=
 =?utf-8?B?M0Rpbjkwb0Q2SWxma3VodG1sTmJrdnB5MGc0ZTdTa245YWsvZHFlVkRBWG5T?=
 =?utf-8?B?L29hcldOck1jc1lLVGhNcHkvVlkyMVNpWmVoWnlvRWo4Z2lGSysvVnNocTBX?=
 =?utf-8?B?a25QZWx5TXNiRC9VZkJoTXBMSzdYWUUvUnV2TldXeTJaNGQ3NU8zS1BXOWU0?=
 =?utf-8?B?eUx4Y0FtOWJ1OGdpbW5lU0dKMm1jcDUvRmxxS1RyNy9uazVMNzZGeFdmMjBH?=
 =?utf-8?B?KzIyWmhVT1duQXZYWFBTWXhGQUFQeHUxOWtLb1ZHSkkxYXF3aTlma1ZCMDNF?=
 =?utf-8?B?aGtlTHlEOWRMekwvcDdYZHNFNzh0aE0zMmdDbzBvUlNMTWp3eVNzZ1B3b3Ji?=
 =?utf-8?B?L3VGT05qQ21qUDNmbTQ1WGkzaTQrT21nczQvSER6NnFtNW1uMnlhMFVGbGdD?=
 =?utf-8?B?bU1mTDZmOVB5a1lQUDRuWkl3eW5WbjdMcnZmYTlhTGVnR0NKN2g0d0poUUk5?=
 =?utf-8?B?Z2c0emhNaVFzdkk5QzM1Zkx3SnpxYXIvSDhnRkF6VWxEMVhiMjNpYmtPWkcz?=
 =?utf-8?B?MHduVWtMOCtXNExWUkx6SUQyQUI2Skp3UTVVaWFiMzhLSFdyNWpCMnJNWG9C?=
 =?utf-8?B?dFA5RVlzd0Z3ZG1veUdrZ25EWms1djNpSmtZV25ZS3RvN2hXL2VzTTBIVDdR?=
 =?utf-8?B?UTdqQUtwck1EOFR6T1J3M2N1bE1aZHh0aEc2Q0duQ0ROb0RvcFhXUlBuOFlP?=
 =?utf-8?B?QXJaU1l5TGxhWWZzeExwYitVTHZuVlF1dkdUcy9UalNHR1NiZ0RGVisvMFZX?=
 =?utf-8?B?ZzBqbXd2WHpZSEpibEpTeU5VWDNzNDFPWXFNNmNCMTNCS3gzT3BhZFBaYi9z?=
 =?utf-8?B?S3l6RXVmU3lPSGE0SmZEdzk0TUpDd2wrekZjR2RvT1p1bEdoZDJENkdRNTRn?=
 =?utf-8?B?bTVhZWRIUUU4OWNNSGlnNlA2UkZZa3IxTHl6bCtBVk16NkkyU2ZmYWZoeko1?=
 =?utf-8?B?dElScWk5U3IvVTZTT3FaM1l0R2V6Wm50V1JoUDdWQm5OeHM4Wmo2c2pXS1pH?=
 =?utf-8?B?WjNueVI3NEFqbFFPVUpBRzJWcElZNGJqaXppbG1yMGRta1kwb3JjYUF4YkdJ?=
 =?utf-8?B?cm5tN2ZVdXFiZUc0bDMzNmlsKzBBVVpsMDdPUllnK3JwMEQrcXhvU1p3a2dO?=
 =?utf-8?B?NFNEdmQzdUVFMlIxbUxpV1FhYXRGMzhYNlhGZUxNK0YyUjFaU2pqZXFYcGxU?=
 =?utf-8?B?YTJNTUcyVnVMa2xPTldwZllaTVlxSjJabkdQUnVtelNJZnRmZklnSHkwN2N5?=
 =?utf-8?B?OXlvWDhtL0tIMVd3aFdOQmQySjFxd2RnWkp6dXg0L25YMzh5MU9OY1hUcWN3?=
 =?utf-8?B?K2I4YjRRL2lNcjRRSWJFRTA4TWEwVFhVV3o4cFdHaW9BUGFKcDFDYmQvVXpH?=
 =?utf-8?B?bFRZci9UV3U3RVRzc0xicnhCci9wZnpSaW00VDFKWG1TOElwazRrSittNUdD?=
 =?utf-8?B?N29pTDJidUFvcmdYWFpmN0h4ZEk2VDh1NmM0YURiOXNtY2ZSbnFPc1hSQVZy?=
 =?utf-8?B?Q1hSNEwxRmZqbHUyWjd6K1VlODlRNVRlYU4zRWdJcGRzQ2dWUVlRQldtcGVt?=
 =?utf-8?B?MG5uamxzbFJlY0xXNjM4RVZORDg5L3Q0TG1SU3padWcyamZ4NmhvK2xlSkd1?=
 =?utf-8?Q?6UbEeBWKc0lBvygMqKcMDQWC8u9dIHVj//R+M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFZlQ2gwelRvL3dqT0Vub2IvbHBkVTZBaDl5YnpKVTkrak52aFdwV29FbTlZ?=
 =?utf-8?B?eWp5S1NyWm83NGFCd3kyM0tFcHYveXdrbUtvVmpxR3dvNnFMdHdlQi9qTW05?=
 =?utf-8?B?MFRlbXd1R2lvMGxjM3VtdVVPbFJ3VEV5OWtlbStsOFdCS3lrbi9SZXlrQkFu?=
 =?utf-8?B?M29VL2QvVHJQNWQyUHdyeWFsTVoxZ1JQa1U0c1N4Umx3Z3BhN0IyY28vQkhI?=
 =?utf-8?B?N0J1NXQ1THRQRHN1bm45RjNwSmh3QzdOYk1zZVorT0pCZjhLUWJKbTNFbjNE?=
 =?utf-8?B?dS9LaEdhOERwTGM2a2ZlZkVpcjVNcmVoYVBEamdEUE5pL3BjV0kyQk03alAr?=
 =?utf-8?B?N0JlZ1lTYUwrdUJmcXp2cHdONHFGbmQ1ZzZDR0hrckVIcVZPZUZXcVZmUExp?=
 =?utf-8?B?QzlGdUlkOUhMcFdKZ2ZJekVFZWkyamhkTVYyVVBIejhsTEc2K0xTaUJzamVS?=
 =?utf-8?B?b3ZPZm1YdlQ4RCtpbWhlM0Q1eHNWVUNJK0RvL1Nkd01jQUU3b2EzeTRtWXRw?=
 =?utf-8?B?Z2RMYXFWWEx3MzBERUUvUE5ZbTJabkN5Qm9RSWRLV3FjZFcyUEp6YzBVS3pp?=
 =?utf-8?B?YXM1bU5KVzduR0FNSHgxRGljZys2c1lhRVBFbEhmQzI2TmMvcEtLYlBvVDFP?=
 =?utf-8?B?dy8xM3JGbk5jSWYzK2Vpeit1d3E2aUdqem1uL2tTNmgvK0hsR0Z6NHJncXBS?=
 =?utf-8?B?NGxGYUh6TjhVK0dsVmtiVXh2U3JXdjFUQ3Y5d1UzdmlpamtTME1aRkhiL1Q2?=
 =?utf-8?B?VmNkRHRweGNWUTdiRTQrL3FZVkxhYk80NDlzdDF1SVRISEdqNFlNTGVYSlRy?=
 =?utf-8?B?QUZmcWZlOHFOb2k3ckRtbTZNVHh0YzBOVjhQZm1uOHhFaEREUjVTMys1TDdU?=
 =?utf-8?B?a1liVk5HSTFsMEJZczNKbHdWSFZDVWZpckk5UDNSYWUxTmJFNjZWc051bUJK?=
 =?utf-8?B?VkFYdDJiZS9LL0tmMFN4a2FBcTJXVjkxclZHMC9UelpraWxSelY1a1ZQRmR4?=
 =?utf-8?B?ZU9Mc3RlTWEwa0lMejlrTG9sSWlRYW5OZSszL1JlQmpscUZZc2ozSnl5emdR?=
 =?utf-8?B?VG5tcy8vV2lmMXc5UDVFb254SDhHWEdPM3ZSa1FiekRWSm9Wd3lkeTFoc011?=
 =?utf-8?B?ZHZ2dlh2d3dWalFITVJsT0hSUGR3V1hxb2k0OHVxQzlyS01sbVV6ZG4rVCtE?=
 =?utf-8?B?MDBQZytHSEQ0dDRnbmV5OXY0bTY0N0l0N2xPTDNPbE85VDBNMXgrU09hRlFr?=
 =?utf-8?B?TXhNejlzRzI5a2NBSi9wUVEydXA4QmNRaENEZ0pXUHAyTit6M1RybGZNbWM4?=
 =?utf-8?B?cDVlZ05NU2JhL3VNUUxiRGVSMmlqM2pTQjluUTRHTHR5ajA5eURxREdHZW5I?=
 =?utf-8?B?Z2ZBbkxjNVU0SjkydStrZmlFMUtKRzd1Rnh4bWtmbUlFRG9RcVBmTUU2aEd2?=
 =?utf-8?B?NC90WDB1WkVvd21QTkltTERXc2pQZFJwaE9IVW5udWVHZUlJQ2xoT21YV1Zu?=
 =?utf-8?B?ZzNIV3FHelNvcEl1aTdadnhBbEZNRDh1dnNZSlhYVi9YNisyQlRsbEpXTVpT?=
 =?utf-8?B?YnFYdmdWc1k0aUtaZUFkV0ZybnFxY2NKaisya2VINTd4dmhoYW5jaUpqbS9C?=
 =?utf-8?B?K3pHcHhLbDR5UU5zbDhvTXBCenluclFSL1o0elJjQ1JHU1UyOVZFdHIwSGxp?=
 =?utf-8?B?SlJXbmtGTnRqOW9mSEdoRGxUS2lxSGVsOG9vTExQR0RMVmpZaEpzZVF1OUJB?=
 =?utf-8?B?QnlobThZcXducDZ3SE5WbWJ0SkFKNm1hTkNyL1hOenRMSG83VjRjd004dDJS?=
 =?utf-8?B?K1ZzVUlleGhOQ0hodFZTZVBSYjZXWXl1WWJmemZiNEtHVTRVQkJJSXBTMzFY?=
 =?utf-8?B?WTUwa0hjYnE5SGlQbEhySFUzRGk1alQwK1d2ZWR0enRuNGtVSFFBRVlUcXVk?=
 =?utf-8?B?QXBuRWdLUTUyT1FHR3ovWlh5LzE5cEdGbHErSXBpQ2ZlMmFRRTZlMkNmc1hU?=
 =?utf-8?B?cWQvbm1qcXpOdng2M3Y3MTdzMjZld2h3QjdyWlVBVWdCSkllYmtOcWdEMDVv?=
 =?utf-8?B?RUFOZmNWOWdTZkhGWXN6Q2wyUHlicjVMZVNBZ2QwSGcyakRjOWJzSUowbFZF?=
 =?utf-8?Q?4OcA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0568CFC1C6D6A44D8A469E96E82D30D3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc66c377-4aeb-4d08-7c62-08dc9113079d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 10:23:29.7297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIKFE8BVCrYcmDDXrku/nf5TCKJGXcI53NdfZJG14ornJ/0y36rNHf09sGm3AWUl09oUtGme8VIGoJnnj09C6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7762

T24gMjAyNC82LzIwIDE1OjQzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDYuMjAyNCAw
OTowMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE4IDE3OjEzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOC4wNi4yMDI0IDEwOjEwLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xNyAyMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Ny4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAtLS0gYS90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+Pj4+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4
bF9wY2kuYw0KPj4+Pj4+IEBAIC0xNDA2LDYgKzE0MDYsMTIgQEAgc3RhdGljIGJvb2wgcGNpX3N1
cHBfbGVnYWN5X2lycSh2b2lkKQ0KPj4+Pj4+ICAjZW5kaWYNCj4+Pj4+PiAgfQ0KPj4+Pj4+ICAN
Cj4+Pj4+PiArI2RlZmluZSBQQ0lfREVWSUQoYnVzLCBkZXZmbilcDQo+Pj4+Pj4gKyAgICAgICAg
ICAgICgoKCh1aW50MTZfdCkoYnVzKSkgPDwgOCkgfCAoKGRldmZuKSAmIDB4ZmYpKQ0KPj4+Pj4+
ICsNCj4+Pj4+PiArI2RlZmluZSBQQ0lfU0JERihzZWcsIGJ1cywgZGV2Zm4pIFwNCj4+Pj4+PiAr
ICAgICAgICAgICAgKCgoKHVpbnQzMl90KShzZWcpKSA8PCAxNikgfCAoUENJX0RFVklEKGJ1cywg
ZGV2Zm4pKSkNCj4+Pj4+DQo+Pj4+PiBJJ20gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGZpbGU7
IGlmIEkgd2VyZSwgSSdkIGFzayB0aGF0IGZvciByZWFkYWJpbGl0eSdzDQo+Pj4+PiBzYWtlIGFs
bCBleGNlc3MgcGFyZW50aGVzZXMgYmUgZHJvcHBlZCBmcm9tIHRoZXNlLg0KPj4+PiBJc24ndCBp
dCBhIGNvZGluZyByZXF1aXJlbWVudCB0byBlbmNsb3NlIGVhY2ggZWxlbWVudCBpbiBwYXJlbnRo
ZXNlcyBpbiB0aGUgbWFjcm8gZGVmaW5pdGlvbj8NCj4+Pj4gSXQgc2VlbXMgb3RoZXIgZmlsZXMg
YWxzbyBkbyB0aGlzLiBTZWUgdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+Pj4N
Cj4+PiBBcyBzYWlkLCBJJ20gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUuIFlldCB3aGls
ZSBJJ20gYXdhcmUgdGhhdCBsaWJ4bA0KPj4+IGhhcyBpdHMgb3duIENPRElOR19TVFlMRSwgSSBj
YW4ndCBzcG90IGFueXRoaW5nIHRvd2FyZHMgZXhjZXNzaXZlIHVzZSBvZg0KPj4+IHBhcmVudGhl
c2VzIHRoZXJlLg0KPj4gU28sIHdoaWNoIHBhcmVudGhlc2VzIGRvIHlvdSB0aGluayBhcmUgZXhj
ZXNzaXZlIHVzZT8NCj4gDQo+ICNkZWZpbmUgUENJX0RFVklEKGJ1cywgZGV2Zm4pXA0KPiAgICAg
ICAgICAgICAoKCh1aW50MTZfdCkoYnVzKSA8PCA4KSB8ICgoZGV2Zm4pICYgMHhmZikpDQo+IA0K
PiAjZGVmaW5lIFBDSV9TQkRGKHNlZywgYnVzLCBkZXZmbikgXA0KPiAgICAgICAgICAgICAoKCh1
aW50MzJfdCkoc2VnKSA8PCAxNikgfCBQQ0lfREVWSUQoYnVzLCBkZXZmbikpDQpUaGFua3MsIHdp
bGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+Pj4+PiBAQCAtMTQ4Niw2ICsxNDk2
LDE4IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+Pj4+
Pj4gICAgICAgICAgZ290byBvdXRfbm9faXJxOw0KPj4+Pj4+ICAgICAgfQ0KPj4+Pj4+ICAgICAg
aWYgKChmc2NhbmYoZiwgIiV1IiwgJmlycSkgPT0gMSkgJiYgaXJxKSB7DQo+Pj4+Pj4gKyNpZmRl
ZiBDT05GSUdfWDg2DQo+Pj4+Pj4gKyAgICAgICAgc2JkZiA9IFBDSV9TQkRGKHBjaS0+ZG9tYWlu
LCBwY2ktPmJ1cywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgKFBDSV9ERVZGTihw
Y2ktPmRldiwgcGNpLT5mdW5jKSkpOw0KPj4+Pj4+ICsgICAgICAgIGdzaSA9IHhjX3BoeXNkZXZf
Z3NpX2Zyb21fZGV2KGN0eC0+eGNoLCBzYmRmKTsNCj4+Pj4+PiArICAgICAgICAvKg0KPj4+Pj4+
ICsgICAgICAgICAqIE9sZCBrZXJuZWwgdmVyc2lvbiBtYXkgbm90IHN1cHBvcnQgdGhpcyBmdW5j
dGlvbiwNCj4+Pj4+DQo+Pj4+PiBKdXN0IGtlcm5lbD8NCj4+Pj4gWWVzLCB4Y19waHlzZGV2X2dz
aV9mcm9tX2RldiBkZXBlbmRzIG9uIHRoZSBmdW5jdGlvbiBpbXBsZW1lbnRlZCBvbiBsaW51eCBr
ZXJuZWwgc2lkZS4NCj4+Pg0KPj4+IE9rYXksIGFuZCB3aGVuIHRoZSBrZXJuZWwgc3VwcG9ydHMg
aXQgYnV0IHRoZSB1bmRlcmx5aW5nIGh5cGVydmlzb3IgZG9lc24ndA0KPj4+IHN1cHBvcnQgd2hh
dCB0aGUga2VybmVsIHdhbnRzIHRvIHVzZSBpbiBvcmRlciB0byBmdWxmaWxsIHRoZSByZXF1ZXN0
LCBhbGwNCj4+IEkgZG9uJ3Qga25vdyB3aGF0IHRoaW5ncyB5b3UgbWVudGlvbmVkIGh5cGVydmlz
b3IgZG9lc24ndCBzdXBwb3J0IGFyZSwNCj4+IGJlY2F1c2UgeGNfcGh5c2Rldl9nc2lfZnJvbV9k
ZXYgaXMgdG8gZ2V0IHRoZSBnc2kgb2YgcGNpZGV2IHRocm91Z2ggc2JkZiBpbmZvcm1hdGlvbiwN
Cj4+IHRoYXQgcmVsYXRpb25zaGlwIGNhbiBiZSBnb3Qgb25seSBpbiBkb20wIGluc3RlYWQgb2Yg
WGVuIGh5cGVydmlzb3IuDQo+Pg0KPj4+IGlzIGZpbmU/IChTZWUgYWxzbyBiZWxvdyBmb3Igd2hh
dCBtYXkgYmUgbmVlZGVkIGluIHRoZSBoeXBlcnZpc29yLCBldmVuIGlmDQo+PiBZb3UgbWVhbiB4
Y19waHlzZGV2X21hcF9waXJxIG5lZWRzIGdzaT8NCj4gDQo+IEknZCBwdXQgaXQgc2xpZ2h0bHkg
ZGlmZmVyZW50bHk6IFlvdSBhcnJhbmdlIGZvciB0aGF0IGZ1bmN0aW9uIHRvIG5vdyB0YWtlIGEN
Cj4gR1NJIHdoZW4gdGhlIGNhbGxlciBpcyBQVkguIEJ1dCB5ZXMsIHRoZSBmdW5jdGlvbiwgd2hl
biB1c2VkIHdpdGgNCj4gTUFQX1BJUlFfVFlQRV9HU0ksIGNsZWFybHkgZXhwZWN0cyBhIEdTSSBh
cyBpbnB1dCAoc2VlIGFsc28gYmVsb3cpLg0KPiANCj4+PiB0aGlzIElPQ1RMIHdvdWxkIGJlIHNh
dGlzZmllZCBieSB0aGUga2VybmVsIHdpdGhvdXQgbmVlZGluZyB0byBpbnRlcmFjdCB3aXRoDQo+
Pj4gdGhlIGh5cGVydmlzb3IuKQ0KPj4+DQo+Pj4+Pj4gKyAgICAgICAgICogc28gaWYgZmFpbCwg
a2VlcCB1c2luZyBpcnE7IGlmIHN1Y2Nlc3MsIHVzZSBnc2kNCj4+Pj4+PiArICAgICAgICAgKi8N
Cj4+Pj4+PiArICAgICAgICBpZiAoZ3NpID4gMCkgew0KPj4+Pj4+ICsgICAgICAgICAgICBpcnEg
PSBnc2k7DQo+Pj4+Pg0KPj4+Pj4gSSdtIHN0aWxsIHB1enpsZWQgYnkgdGhpcywgd2hlbiBieSBu
b3cgSSB0aGluayB3ZSd2ZSBzdWZmaWNpZW50bHkgY2xhcmlmaWVkDQo+Pj4+PiB0aGF0IElSUXMg
YW5kIEdTSXMgdXNlIHR3byBkaXN0aW5jdCBudW1iZXJpbmcgc3BhY2VzLg0KPj4+Pj4NCj4+Pj4+
IEFsc28sIGFzIHByZXZpb3VzbHkgaW5kaWNhdGVkLCB5b3UgY2FsbCB0aGlzIGZvciBQViBEb20w
IGFzIHdlbGwuIEFpdWkgb24NCj4+Pj4+IHRoZSBhc3N1bXB0aW9uIHRoYXQgaXQnbGwgZmFpbC4g
V2hhdCBpZiB3ZSBkZWNpZGUgdG8gbWFrZSB0aGUgZnVuY3Rpb25hbGl0eQ0KPj4+Pj4gYXZhaWxh
YmxlIHRoZXJlLCB0b28gKGlmIG9ubHkgZm9yIGluZm9ybWF0aW9uYWwgcHVycG9zZXMsIG9yIGZv
cg0KPj4+Pj4gY29uc2lzdGVuY3kpPyBTdWRkZW5seSB5b3UncmUgZmFsbGJhY2sgbG9naWMgd291
bGRuJ3Qgd29yayBhbnltb3JlLCBhbmQNCj4+Pj4+IHlvdSdkIGNhbGwgLi4uDQo+Pj4+Pg0KPj4+
Pj4+ICsgICAgICAgIH0NCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4gICAgICAgICAgciA9IHhjX3Bo
eXNkZXZfbWFwX3BpcnEoY3R4LT54Y2gsIGRvbWlkLCBpcnEsICZpcnEpOw0KPj4+Pj4NCj4+Pj4+
IC4uLiB0aGUgZnVuY3Rpb24gd2l0aCBhIEdTSSB3aGVuIGEgcElSUSBpcyBtZWFudC4gSW1vLCBh
cyBzdWdnZXN0ZWQgYmVmb3JlLA0KPj4+Pj4geW91IHN0cmljdGx5IHdhbnQgdG8gYXZvaWQgdGhl
IGNhbGwgb24gUFYgRG9tMC4NCj4+Pj4+DQo+Pj4+PiBBbHNvIGZvciBQVkggRG9tMDogSSBkb24n
dCB0aGluayBJJ3ZlIHNlZW4gY2hhbmdlcyB0byB0aGUgaHlwZXJjYWxsDQo+Pj4+PiBoYW5kbGlu
ZywgeWV0LiBIb3cgY2FuIHRoYXQgYmUgd2hlbiBHU0kgYW5kIElSUSBhcmVuJ3QgdGhlIHNhbWUs
IGFuZCBoZW5jZQ0KPj4+Pj4gaW5jb21pbmcgR1NJIHdvdWxkIG5lZWQgdHJhbnNsYXRpbmcgdG8g
SVJRIHNvbWV3aGVyZT8gSSBjYW4gb25jZSBhZ2FpbiBvbmx5DQo+Pj4+PiBhc3N1bWUgYWxsIHlv
dXIgdGVzdGluZyB3YXMgZG9uZSB3aXRoIElSUXMgd2hvc2UgbnVtYmVycyBoYXBwZW5lZCB0byBt
YXRjaA0KPj4+Pj4gdGhlaXIgR1NJIG51bWJlcnMuIChUaGUgZGlmZmVyZW5jZSwgaW1vLCB3b3Vs
ZCBhbHNvIG5lZWQgY2FsbGluZyBvdXQgaW4gdGhlDQo+Pj4+PiBwdWJsaWMgaGVhZGVyLCB3aGVy
ZSB0aGUgcmVzcGVjdGl2ZSBpbnRlcmZhY2Ugc3RydWN0KHMpIGlzL2FyZSBkZWZpbmVkLikNCj4+
Pj4gSSBmZWVsIGxpa2UgeW91IG1pc3NlZCBvdXQgb24gbWFueSBvZiB0aGUgcHJldmlvdXMgZGlz
Y3Vzc2lvbnMuDQo+Pj4+IFdpdGhvdXQgbXkgY2hhbmdlcywgdGhlIG9yaWdpbmFsIGNvZGVzIHVz
ZSBpcnEgKHJlYWQgZnJvbSBmaWxlIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxzYmRmPi9pcnEpIHRv
IGRvIHhjX3BoeXNkZXZfbWFwX3BpcnEsDQo+Pj4+IGJ1dCB4Y19waHlzZGV2X21hcF9waXJxIHJl
cXVpcmUgcGFzc2luZyBpbnRvIGdzaSBpbnN0ZWFkIG9mIGlycSwgc28gd2UgbmVlZCB0byB1c2Ug
Z3NpIHdoZXRoZXIgZG9tMCBpcyBQViBvciBQVkgsIHNvIGZvciB0aGUgb3JpZ2luYWwgY29kZXMs
IHRoZXkgYXJlIHdyb25nLg0KPj4+PiBKdXN0IGJlY2F1c2UgYnkgY2hhbmNlLCB0aGUgaXJxIHZh
bHVlIGluIHRoZSBMaW51eCBrZXJuZWwgb2YgcHYgZG9tMCBpcyBlcXVhbCB0byB0aGUgZ3NpIHZh
bHVlLCBzbyB0aGVyZSB3YXMgbm8gcHJvYmxlbSB3aXRoIHRoZSBvcmlnaW5hbCBwdiBwYXNzdGhy
b3VnaC4NCj4+Pj4gQnV0IG5vdCB3aGVuIHVzaW5nIFBWSCwgc28gcGFzc3Rocm91Z2ggZmFpbGVk
Lg0KPj4+PiBXaXRoIG15IGNoYW5nZXMsIEkgZ290IGdzaSB0aHJvdWdoIGZ1bmN0aW9uIHhjX3Bo
eXNkZXZfZ3NpX2Zyb21fZGV2IGZpcnN0bHksIGFuZCB0byBiZSBjb21wYXRpYmxlIHdpdGggb2xk
IGtlcm5lbCB2ZXJzaW9ucyhpZiB0aGUgaW9jdGwNCj4+Pj4gSU9DVExfUFJJVkNNRF9HU0lfRlJP
TV9ERVYgaXMgbm90IGltcGxlbWVudGVkKSwgSSBzdGlsbCBuZWVkIHRvIHVzZSB0aGUgaXJxIG51
bWJlciwgc28gSSBuZWVkIHRvIGNoZWNrIHRoZSByZXN1bHQNCj4+Pj4gb2YgZ3NpLCBpZiBnc2kg
PiAwIG1lYW5zIElPQ1RMX1BSSVZDTURfR1NJX0ZST01fREVWIGlzIGltcGxlbWVudGVkIEkgY2Fu
IHVzZSB0aGUgcmlnaHQgb25lIGdzaSwgb3RoZXJ3aXNlIGtlZXAgdXNpbmcgd3Jvbmcgb25lIGly
cS4gDQo+Pj4NCj4+PiBJIHVuZGVyc3RhbmQgYWxsIG9mIHRoaXMsIHRvIGEgKEkgdGhpbmspIHN1
ZmZpY2llbnQgZGVncmVlIGF0IGxlYXN0LiBZZXQgd2hhdA0KPj4+IHlvdSdyZSBlZmZlY3RpdmVs
eSBwcm9wb3NpbmcgKHdpdGhvdXQgZXhwbGljaXRseSBzYXlpbmcgc28pIGlzIHRoYXQgZS5nLg0K
Pj4+IHN0cnVjdCBwaHlzZGV2X21hcF9waXJxJ3MgcGlycSBmaWVsZCBzdWRkZW5seSBtYXkgbm8g
bG9uZ2VyIGhvbGQgYSBwSVJRDQo+Pj4gbnVtYmVyLCBidXQgKHdoZW4gdGhlIGNhbGxlciBpcyBQ
VkgpIGEgR1NJLiBUaGlzIG1heSBiZSBhIG5lY2Vzc2FyeSBhZGp1c3RtZW50DQo+Pj4gdG8gbWFr
ZSAoc2ltcGx5IGJlY2F1c2UgdGhlIGNhbGxlciBtYXkgaGF2ZSBubyB3YXkgdG8gZXhwcmVzcyB0
aGluZ3MgaW4gcElSUQ0KPj4+IHRlcm1zKSwgYnV0IHRoZW4gc3VpdGFibGUgYWRqdXN0bWVudHMg
dG8gdGhlIGhhbmRsaW5nIG9mIFBIWVNERVZPUF9tYXBfcGlycQ0KPj4+IHdvdWxkIGJlIG5lY2Vz
c2FyeS4gSW4gZmFjdCB0aGF0IGZpZWxkIGlzIHByZXNlbnRseSBtYXJrZWQgYXMgIklOIG9yIE9V
VCI7DQo+Pj4gd2hlbiByZS1wdXJwb3NlZCB0byB0YWtlIGEgR1NJIG9uIGlucHV0LCBpdCBtYXkg
ZW5kIHVwIGJlaW5nIG5lY2Vzc2FyeSB0byBwYXNzDQo+Pj4gYmFjayB0aGUgcElSUSAoaW4gdGhl
IHN1YmplY3QgZG9tYWluJ3MgbnVtYmVyaW5nIHNwYWNlKS4gT3IgYWx0ZXJuYXRpdmVseSBpdA0K
Pj4+IG1heSBiZSBuZWNlc3NhcnkgdG8gYWRkIHlldCBhbm90aGVyIHN1Yi1mdW5jdGlvbiBzbyB0
aGUgR1NJIGNhbiBiZSB0cmFuc2xhdGVkDQo+Pj4gdG8gdGhlIGNvcnJlc3BvbmRpbmcgcElSUSBm
b3IgdGhlIGRvbWFpbiB0aGF0J3MgZ29pbmcgdG8gdXNlIHRoZSBJUlEsIGZvciB0aGF0DQo+Pj4g
dGhlbiB0byBiZSBwYXNzZWQgaW50byBQSFlTREVWT1BfbWFwX3BpcnEuDQo+PiBJZiBJIHVuZGVy
c3Rvb2QgY29ycmVjdGx5LCB5b3VyIGNvbmNlcm5zIGFib3V0IHRoaXMgcGF0Y2ggYXJlIHR3bzoN
Cj4+IEZpcnN0LCB3aGVuIGRvbTAgaXMgUFYsIEkgc2hvdWxkIG5vdCB1c2UgeGNfcGh5c2Rldl9n
c2lfZnJvbV9kZXYgdG8gZ2V0IGdzaSB0byBkbyB4Y19waHlzZGV2X21hcF9waXJxLCBJIHNob3Vs
ZCBrZWVwIHRoZSBvcmlnaW5hbCBjb2RlIHRoYXQgdXNlIGlycS4NCj4gDQo+IFllcy4NCk9LLCBJ
IGNhbiBjaGFuZ2UgdG8gZG8gdGhpcy4NCkJ1dCBJIHN0aWxsIGhhdmUgYSBjb25jZXJuOg0KQWx0
aG91Z2ggd2l0aG91dCBteSBjaGFuZ2VzLCBwYXNzdGhyb3VnaCBjYW4gd29yayBub3cgd2hlbiBk
b20wIGlzIFBWLg0KQW5kIHlvdSBhbHNvIGFncmVlIHRoYXQ6IGZvciB4Y19waHlzZGV2X21hcF9w
aXJxLCB3aGVuIHVzZSB3aXRoIE1BUF9QSVJRX1RZUEVfR1NJLCBpdCBleHBlY3RzIGEgR1NJIGFz
IGlucHV0Lg0KSXNuJ3QgaXQgYSB3cm9uZyBmb3IgUFYgZG9tMCB0byBwYXNzIGlycSBpbj8gV2h5
IGRvbid0IHdlIHVzZSBnc2kgYXMgaXQgc2hvdWxkIGJlIHVzZWQsIHNpbmNlIHdlIGhhdmUgYSBm
dW5jdGlvbiB0byBnZXQgZ3NpIG5vdz8NCg0KPiANCj4+IFNlY29uZCwgd2hlbiBkb20wIGlzIFBW
SCwgSSBnZXQgdGhlIGdzaSwgYnV0IEkgc2hvdWxkIG5vdCBwYXNzIGdzaSBhcyB0aGUgZm91cnRo
IHBhcmFtZXRlciBvZiB4Y19waHlzZGV2X21hcF9waXJxLCBJIHNob3VsZCBjcmVhdGUgYSBuZXcg
bG9jYWwgcGFyYW1ldGVyIHBpcnE9LTEsIGFuZCBwYXNzIGl0IGluLg0KPiANCj4gSSB0aGluayBz
bywgeWVzLiBZb3UgYWxzbyBtYXkgbmVlZCB0byByZWNvcmQgdGhlIG91dHB1dCB2YWx1ZSwgc28g
eW91IGNhbiBsYXRlcg0KPiB1c2UgaXQgZm9yIHVubWFwLiB4Y19waHlzZGV2X21hcF9waXJxKCkg
bWF5IGFsc28gbmVlZCBhZGp1c3RpbmcsIGFzIHJpZ2h0IG5vdw0KPiBpdCB3b3VsZG4ndCBwdXQg
YSBuZWdhdGl2ZSBpbmNvbWluZyAqcGlycSBpbnRvIHRoZSAucGlycSBmaWVsZC4gDQp4Y19waHlz
ZGV2X21hcF9waXJxJ3MgbG9naWMgaXMgaWYgd2UgcGFzcyBhIG5lZ2F0aXZlIGluLCBpdCBzZXRz
ICpwaXJxIHRvIGluZGV4KGdzaSkuDQpJcyBpdHMgbG9naWMgcmlnaHQ/IElmIG5vdCBob3cgZG8g
d2UgY2hhbmdlIGl0Pw0KDQo+IEkgYWN0dWFsbHkgd29uZGVyIGlmIHRoYXQncyBldmVuIGNvcnJl
Y3QgcmlnaHQgbm93LCBpLmUuIGluZGVwZW5kZW50IG9mIHlvdXIgY2hhbmdlLg0KRXZlbiB3aXRo
b3V0IG15IGNoYW5nZXMsIHBhc3N0aHJvdWdoIGNhbiB3b3JrIGZvciBQViBkb20wLCBub3QgZm9y
IFBWSCBkb20wLg0KQWNjb3JkaW5nIHRvIHRoZSBsb2dpYyBvZiBoeXBlcmNhbGwgUEhZU0RFVk9Q
X21hcF9waXJxLA0KaWYgcGlycSBpcyAtMSwgaXQgY2FsbHMgcGh5c2Rldl9tYXBfcGlycS0+IGFs
bG9jYXRlX2FuZF9tYXBfZ3NpX3BpcnEtPiBhbGxvY2F0ZV9waXJxIC0+IGdldF9mcmVlX3BpcnEg
dG8gZ2V0IHBpcnEuDQpJZiBwaXJxIGlzIHNldCB0byBwb3NpdGl2ZSBiZWZvcmUgY2FsbGluZyBo
eXBlcmNhbGwsIGl0IHNldCBwaXJxIHRvIGl0cyBvd24gdmFsdWUgaW4gYWxsb2NhdGVfcGlycS4N
Cg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

