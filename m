Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F90ADFEA4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 09:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019759.1396254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS9fc-0005yM-Ly; Thu, 19 Jun 2025 07:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019759.1396254; Thu, 19 Jun 2025 07:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS9fc-0005wq-Ij; Thu, 19 Jun 2025 07:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1019759;
 Thu, 19 Jun 2025 07:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aO=ZC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uS9fb-0005wk-6M
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 07:26:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0cafb0b-4cde-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 09:26:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 07:26:41 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:26:40 +0000
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
X-Inumbo-ID: c0cafb0b-4cde-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrga4XHVaoDcsVfvNGjylfqDgPfeRxrO9ObTK+DaoiOMME0yDM8byxkXudj1EEaI2ooxDsVvNkPQstsgj2SWX2n/Mm0i9iEmin72AuXqfxbJx3yHQPzXagM1IT9+3tVKcGqtYu0TqLxBnHNkQ3eQj2SKQzVxS30h36yxQuZ5jjn3m0zJtANS6pCtxjy8rOB70ujFModsXBWTYjvjEV2d7PIputJ/cFGSA65Vyzjgh98pNmg4Z5EM3rSKP4k0dsIdSPyY34Q/B6tyPxE0Y+C0SjGsH5tk8k6b5Cpy+4b4u3UdOJws+d45Sv5Y/F78/Katu39aRFizPjy3JE2HMVBBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4VKaBeGdc86MRbLrlgOPvn3xfUD8EuxN664Q06HNaY=;
 b=v4LyvarjOhqrchmwexbWKdEZkhJz+0lhrVyeH+wEm+8IoElnWWMXqjwg9O0itIJ9Z9KdrIFqavsXp7rADzDH/VMS3JVCnLqQphfBa3qa8DEI9NJowMuPOB1Gewxpy1Bt/gFKjPlOOSD+IpLV86zPZ+5mzKSGVO0d5IbEtrZc+rZ2H7XxnypAAOoeopkKnjRohi0hOQ16zm3kNEHWdshLWHoqLnCIrCYLB607cVyV3Iq4XQmK6fWbfMD5J3mzHjBQxHBUNt7G3IJK/VQOihQFYiCp+u/SWDTtH0aYZf90/YtXUG2hP70avifWLQPNRajPQOG/pfAG1UM5SjO2XEQpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4VKaBeGdc86MRbLrlgOPvn3xfUD8EuxN664Q06HNaY=;
 b=G8RaFAo2qfqDTcFTZRLdYvYBY8MRmjlDpsmfvcGKbmMt9d1nqc4UociZtfN5ql8kPiR19Cpt4aENkrBmKNVWs30TPIWl5gdDyoWGLmygxQVQB5FIHjYtb9ijyTbSeVE9s6MqvPsyYCcXcq8NRbGfugO9863HAdB8v+LCCFrFaNQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 3/8] vpci: Hide legacy capability when it fails to
 initialize
Thread-Topic: [PATCH v6 3/8] vpci: Hide legacy capability when it fails to
 initialize
Thread-Index: AQHb23ydSLPIKyE480C9STMPmN1Rl7QI/lUAgAGnEoA=
Date: Thu, 19 Jun 2025 07:26:40 +0000
Message-ID:
 <BL1PR12MB58496779D13AF06CD5FF542DE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-4-Jiqian.Chen@amd.com>
 <2708d242-1a11-4c2b-a3df-595b0bc23bfb@suse.com>
In-Reply-To: <2708d242-1a11-4c2b-a3df-595b0bc23bfb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW6PR12MB8913:EE_
x-ms-office365-filtering-correlation-id: 4d68c18f-b84f-463e-b6f3-08ddaf02a292
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFhwYytZM2gxeDMwVGJOdFJ5YWZSNm1oOG5Rbm9la21MbUQ4REF0ZVRxNU5N?=
 =?utf-8?B?WlpyUUo4QS9Db21XMWowdjVJYnF0V20rZkRSS1laczF4aXRtRmpNTFVManVH?=
 =?utf-8?B?WXJnMHF4RVY2amVYbk5Nc0MxcmRZajFWMkE4eWhOWVgrK2x1LzJtUmN5L1VM?=
 =?utf-8?B?WVhBMHB2YmNyWmY3bjQ1ajVETHZ2dHBTVWFIMU9lQld4YUN5a0pBL3ZUZjdl?=
 =?utf-8?B?b3dZMjFBQVNES0RGSUdWaU1jZVJ5QTdrMWRVemczQ0thRzJOWDg4QXMyc1RQ?=
 =?utf-8?B?M1doaDZ6NUk0eGdQdmswamxySENmbG95QTJwTk9TS1pET3pqZGRNUHZsWmFq?=
 =?utf-8?B?MXJNRmdGdUN0L25hQjNoNk5SUnB5MlB5NWFqZS8yQUMxdG4vREhoTWpNSTRL?=
 =?utf-8?B?TlBzenVxQzdnUDlFdzlIRHkyeldBYnNnTVQxcVZyNUJkMUxZSFNkU1JJRThK?=
 =?utf-8?B?SVlHbWpQRWFKL3VIM2o2a0FySTk0REtvYXBoa3YrWEkxNkFJNDAwYkFEa0ZQ?=
 =?utf-8?B?WWZSTmdTUHdNU1BXTzJ2blpLeTMyT0t3d21hMGR3anp2aTJ0a05RWGM2SkZM?=
 =?utf-8?B?ak84b2VYd3hEdkZUNnlhQTkxa2VvQWZIc1lUd1lpTC95WHh3bHZLcEdPamkr?=
 =?utf-8?B?VFltK3BEU3VvZzdrbU5LVklqNC8xeWxabGNaSXZNNm1la0owOVJjMkoySk94?=
 =?utf-8?B?dEV0VXZGdnpNQmZJd2Y2TXNmN3FSWjFmaTRaN2RETVdQR2c2bENndEo0YlZO?=
 =?utf-8?B?eUgxcGJYYWtBM3hkaTdqcEdTMWNiNlZHdTZuM2FJb3VhSERZNytzbVRVNGx3?=
 =?utf-8?B?WTdSMzAvUTY2RDRwTnNMcmZXL2xJa1BiREZwUnprd1JOS2dpZ0s2aFo5d3ZX?=
 =?utf-8?B?djdZVlo4R2JHSTNmbTlHNTc2bWhubkQrV01CSFA1N2lKdlkva3Z1UzBZK0Jp?=
 =?utf-8?B?elYyamJQWXh3V2lUZE9ZMktubVhHeXRva2p3YmdBaTRiT1FXc2RaVGFVWHc4?=
 =?utf-8?B?dzgwaHhCcm1QRW5ZU0tueGEyMEdybUFBVDdpMG9JdlROa05mTklQT2RuUXJq?=
 =?utf-8?B?djZ0UlBURnR0WEMxM0tzNWg1L3EyUmNxaWNsTU5JSnkxYzBFY3ZkMDFRTVU4?=
 =?utf-8?B?eUlaVWpvVWo4Q3o3b0NjV2ZYUm5kTDRMTnZYYU5HNnE4RVJRUW0xU0J1VlZG?=
 =?utf-8?B?dnVncWJ2b21BTE5XWHRSV0RoRlhxL00xaDNaOWIwRk02cUdmOEVwS3dPRzRN?=
 =?utf-8?B?aE9QZTQzQ1ZLdGRLM2ZOYzIxREE5RndWM3l1aXF3L2NwQ1BGSk90WThzUDRM?=
 =?utf-8?B?L25xVlRVMVBSZnFsUmNhZXBHeVRvdi9ZZFhJUk9jVGZkcHhhMHpJTnd2V29s?=
 =?utf-8?B?SzlvZS9SM1lPdG9tYTZralFHWE9QZ1hWV0dvdE5SQ3A5VktoMXNiQ1hUOElp?=
 =?utf-8?B?S3JsQS9ZSHdxdElPWGMyc1ltQkFnaHdWcjR2WjNLdWdXMEdzQkZ4TG8xNHZs?=
 =?utf-8?B?K0hEZ20zMEVpM05YVEZmYzZtQ3pwaU5YOU5jbmx3YzJwb1cySHRLempoeVFs?=
 =?utf-8?B?RG8vekdKUUxXSW5kZlRvd3dwWktjRk92RnBhSmNYcjQxdS9WLzRUcGhnZWZW?=
 =?utf-8?B?ckVUdHFUY1lpa2ZLcmVxV294Y0J2NWMzRUJPbUpUNVkxRTB3ZVhSLzRheHBS?=
 =?utf-8?B?ZGlPTzgydTdtYW1JYmVoUG9Jbzgwd0pZaDZKL2FCZDk3clZUQ1NTOHU3VUpn?=
 =?utf-8?B?WjNNWlQzbHlrdHI1MDdjdTNMK0NTVjI4N1hCVFcvckhObFhDMVEraWltY0hu?=
 =?utf-8?B?V3Q1TE1qMnpvTlg3NHRETTNIb3JvOThpMlUvQk9zQ1UxbDBDWGJEaU0wbzlh?=
 =?utf-8?B?cjMvTEZoVGh3czM0eFRyYW8wL3V3enVONzlZbUpOSG1MYWVhelpEcG1qa3kx?=
 =?utf-8?B?OFJOZ3M5cTdxM0tkWGlYbVlBYnBEeGRSRTczZFBOajBMYU5iZGlEZUV2OGxV?=
 =?utf-8?Q?puW2c/oycxZeqHE1z5pWJUfrGYUBK4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFNFaVlTelpsZHJCYktYcmdNSDl1TkRMQUhFakw1OExqSEZxYzYrWjZMMmxK?=
 =?utf-8?B?cU00WUNkSnp2SWxpMHhNUGFYV0NlMTNMQkhUNFk4RjhwdHBaL2lnZkVyWXRO?=
 =?utf-8?B?T3lLRmhhK29pL2RIOGFXNW55QmY2TlQ5Yy9UTG9CQjQ5QUw4dmV4R2N4eUJ2?=
 =?utf-8?B?Ym1wcmE4NlI0c0k0M1ZubWFBZWo5MlZhUVVNYStkeXJ3aHVROTJHM3BxYzU1?=
 =?utf-8?B?d0JrL2FUSUdHbXN1SlZ6Z29LUVJ5VThOc1g2VkhremFGblMxSkNHd21nVWFz?=
 =?utf-8?B?cEk5L0p2QkRBS2Q2SStSNzJpUnEwQ2pvUEQ5UnA3aUYwcGRrOEUvcHBoMUFo?=
 =?utf-8?B?WkxIWGpmZkt0ZTczMU9SQURlZEl3eTRETnBTSkZncmhzbDdKTStpTUEwalJ0?=
 =?utf-8?B?Z1o5S1NXL09VUVZwaklDNTFrakhKT0s3YWEyekk4SC9velVOU2FTRUV2a2Vr?=
 =?utf-8?B?ajkyaENodzhGN0JLZE5KdElvR1JGSEVCVldsWHFhZkZPOExlbmVPUjlCNURn?=
 =?utf-8?B?RGdYaXpQTHVuMFFreFZnZlBkdkludmN6aHUwZHdqMDRCa2dsam9peTB4VlQv?=
 =?utf-8?B?dThic2x2WXdNekU5Qk5iOWhDRVlGOFdPOFdvdis0ZElHNFVNb05VTW5VWHBB?=
 =?utf-8?B?VEQ1ZXNobm95SEk5UXhKU210dWgxek9veWpocXVndkVpeXlZSVF6QjhvNlZo?=
 =?utf-8?B?amhialplVktzTFluWWZrZVpwbXNwcnlOWDFXdkEwbFNJZkhrcDlsM0lxU211?=
 =?utf-8?B?KzRWUkh3VnQ4MHpTZ2FmYmxCeitRcWNQb0pjTXNrNkhLOGxCQ0FkQXA5ek9y?=
 =?utf-8?B?NXlnRThHOWRhclZOVDlYbkE4YjBrcUNrdXVLa2xtakVGdFdQODRtb1k1WEkr?=
 =?utf-8?B?UnJ1TVhMWVZFWVdGNGd4VUd5czBZa29UY0JQb2ZGWnJ1STFCUzUrS3d5WEF0?=
 =?utf-8?B?ZENkOUs2UVc2TFhoMHlXTjVMMXg0ZERuaTVkcDlrRjhBVmVLTDl5NjhINmE2?=
 =?utf-8?B?NDJoRDFlRUc0YWJJMXJHYWZ5SllGdWxlRmU5ZkY2S2thOHFTZHFhNHBCTTJj?=
 =?utf-8?B?dUl5cEtMbUVtNTNMbDhuVk1yU0QyQ0VIK2RyaStQRUd0MkJ0MVZVYTAzRW1k?=
 =?utf-8?B?R1F4eGlNcTFRc3p4cmtZMitpcEJrSWw3YkZuSlkyUHhJK212TzFPTWh1NzJR?=
 =?utf-8?B?UEpRcjluelM2ejVVejF2aWxmdytqa2t2dlNMQjBnblJLQ09Kc2RhZC9sOFBB?=
 =?utf-8?B?dlQ3WkdNSHh3VWdON1B4YTJySHpBMTgzNmVIUzBlRlVHaklvT1YyVXBYb3ph?=
 =?utf-8?B?a21vOGpQUTdjNDJlZUNEUDhCQ3FCeFdZZVA1VFBicHNhTFgyZVlzWnJ2TXFk?=
 =?utf-8?B?ZDNaWU4wUVdmUjFCckFRVS9Sc2tNSW5mdWxhS3JtdGdpRW5Nck1Tek9NaWxK?=
 =?utf-8?B?KzQ3THppWkZ0VG9SQzBGZktFejdta0N0Y1hPYkxNWnZWN2tSZU5lSXcrSHQy?=
 =?utf-8?B?a2oyTm9jWlpQK00rVnR6WFNzMENnY3lRWmc5YlFzWEtPdjk0Y3lDbm9leFRv?=
 =?utf-8?B?UnMvTFR0K0Vaa0hkeDRITytSa3NGQlJiSjQrNDd6ZkJPMURIckxpcVlWSUcv?=
 =?utf-8?B?bUhtMnJGeDZWbmdGYW9TcmJEcjJ3TGhvOVVwRVNBZFhnVnRlbGdMYXUyVzU0?=
 =?utf-8?B?NVlTWC9kWVhtWHV3ODFrblVWSVR6L1Ivblg1cmlIUWZ2MXp4Tm9PL3o5Sklt?=
 =?utf-8?B?MWFiQSt2YXdybVVZS1VOUTQ4eitzMGFQNVZaUGhNQWJGMVowRHM5bnVtdEV0?=
 =?utf-8?B?cW8zZ2pGYTNTMktTOUMrb0FoT2h5ODBRQ1pUU0dCcUdkUGhvck5qMjd0RGtv?=
 =?utf-8?B?dDVGVGppckJNZlgvM3dmV2VGL3Q2QVJHL1FUT0k1YzV2NXY2QlFWcmgrMjRE?=
 =?utf-8?B?dmhlMXh1OFdDbjhJdnk0R3lFME9iYThTTzFFR0ZIcFhnSmpTRjJEV3JSaTBX?=
 =?utf-8?B?NUF6MVo0OE1KalJ2MnhqQXgvbi9NZTY4UHdrRFJqc1dtYVJIQVl4RkJqWEJj?=
 =?utf-8?B?YTRTQiswZXlFOWNhNU5LWFh3TE9HOC9rNGkwdVVTTXFxVkZaU2lOcFdJODF5?=
 =?utf-8?Q?PLTg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <253095774D72644A83BE4B68165AD830@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d68c18f-b84f-463e-b6f3-08ddaf02a292
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 07:26:40.8165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FQUKEG9bttdBz2kTn6mrEqthBoMWc+js/bePRjeoI09Uear2JeodTq6WBfLswj1Cgcycz5YxOb1L8kyauxj+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

T24gMjAyNS82LzE4IDIyOjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IEBAIC04Myw2ICs4Myw4OCBA
QCBzdGF0aWMgaW50IGFzc2lnbl92aXJ0dWFsX3NiZGYoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
PiAgDQo+PiAgI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+PiAg
DQo+PiArc3RhdGljIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICp2cGNpX2dldF9yZWdpc3RlcihzdHJ1
Y3QgdnBjaSAqdnBjaSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+ICt7DQo+PiAr
ICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyOw0KPj4gKw0KPj4gKyAgICBBU1NFUlQoc3Bpbl9p
c19sb2NrZWQoJnZwY2ktPmxvY2spKTsNCj4+ICsNCj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eSAoIHIsICZ2cGNpLT5oYW5kbGVycywgbm9kZSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlm
ICggci0+b2Zmc2V0ID09IG9mZnNldCAmJiByLT5zaXplID09IHNpemUgKQ0KPj4gKyAgICAgICAg
ICAgIHJldHVybiByOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBvZmZzZXQgPD0gci0+b2Zmc2V0
ICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1
cm4gTlVMTDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICp2
cGNpX2dldF9wcmV2aW91c19jYXBfcmVnaXN0ZXIoDQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNp
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPj4gK3sNCj4+ICsgICAgdWludDMyX3QgbmV4dDsNCj4+
ICsgICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnI7DQo+PiArDQo+PiArICAgIGlmICggb2Zmc2V0
IDwgMHg0MCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0K
Pj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgZm9yICgg
ciA9IHZwY2lfZ2V0X3JlZ2lzdGVyKHZwY2ksIFBDSV9DQVBBQklMSVRZX0xJU1QsIDEpOyByOw0K
Pj4gKyAgICAgICAgICByID0gbmV4dCA+PSAweDQwID8gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5leHQg
KyBQQ0lfQ0FQX0xJU1RfTkVYVCwgMSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICA6
IE5VTEwgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBuZXh0ID0gKHVpbnQzMl90KSh1aW50cHRy
X3Qpci0+cHJpdmF0ZTsNCj4+ICsgICAgICAgIEFTU0VSVChuZXh0ID09ICh1aW50cHRyX3Qpci0+
cHJpdmF0ZSk7DQo+PiArICAgICAgICBpZiAoIG5leHQgPT0gb2Zmc2V0ICkNCj4+ICsgICAgICAg
ICAgICBicmVhazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gcjsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGludCB2cGNpX2NhcGFiaWxpdHlfaGlkZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgdW5zaWduZWQgaW50IGNhcCkNCj4gDQo+IEkgcmVhbGx5IG9ubHkgbm90aWNlZCBpdCBp
biB0aGUgbmV4dCBwYXRjaCwgYnV0IHRoZSBxdWVzdGlvbiBhcHBsaWVzIGVxdWFsbHkNCj4gaGVy
ZTogQW55IHJlYXNvbiB0aGUgZmlyc3QgcGFyYW1ldGVyIGlzbid0IHBvaW50ZXItdG8tY29uc3Q/
DQpXaWxsIGNoYW5nZSB0aGUgcGFyYW1ldGVycyB0byBiZSBjb25zdCBvZiBteSBuZXcgZnVuY3Rp
b25zIGluIHRoaXMgYW5kIG5leHQgcGF0Y2hlcy4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

