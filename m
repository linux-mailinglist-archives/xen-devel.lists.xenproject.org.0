Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E6A6DADC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925508.1328377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhaE-0003Me-NN; Mon, 24 Mar 2025 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925508.1328377; Mon, 24 Mar 2025 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhaE-0003LY-Kc; Mon, 24 Mar 2025 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 925508;
 Mon, 24 Mar 2025 13:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvQq=WL=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1twhaD-0003LS-G6
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:11:13 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73d83e7a-08b1-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 14:11:09 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PA4PR03MB7198.eurprd03.prod.outlook.com (2603:10a6:102:107::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:11:07 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:11:07 +0000
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
X-Inumbo-ID: 73d83e7a-08b1-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAenr9ddtQ4p7c1M2rN/8ZpZZUrSqeoWWUxXhwaipDDtHacyb24boFHFMxzjR4XNBzZagDMC0Vj7VRYSY9+wWzEjNSmrwHnU/N18keJXYMBEV9EgtVE4toZCnHOZARilSxSUohArk1PV//fS1jLc7Gf/otUjOqNbXimCO1bW7eYdeF16yyUX265/Pi8twOZgbBYfPiI9ovf4pHcw2PD2yX0ilH2NlFPKbdM7Y1k8t+A/1KvM0q4LCKC3+Y+ooPajfGBiH5nJkc/T5V9PF5vCqYAgrvttWK/JipCvzZcJerF2CJASY9qldS2O/4ri9yypY5zMPnUKdX4XHCbRyvn1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvDGwbdZo8ARdx0B9NdsufmR/vzlAwwKZLi4lHYNGYQ=;
 b=HBJqmyv5rXa4/FeypJ+FTDyCoJB+ZX3FhrNiIe4yJgbPvrZGADu23tdJLOVa2zv7TWPq+FCDi5StRo6+iv/HFyeBLW7iVoDzo8oAOlx+Uj0f4vKBPBKezqej1jrEQru76Op2KwhLGdwhRvI/kIcmME1+sCoKsWyY3pD2S6fvwxV7tSWKwgdNbvXeuB6NHRvX13Bbu6e9n8q+2jjOtmgURnYn54xoxDljuylYKEpp/4T85I3RrDGVE59ulINx22UF9LH50iA+RHvpKSecWa7/Odd3g8BGDiNJWckEdJJSM+MywXnadHFp0n3CrT9oDhxVBEUPXT7IzHrvHAruXjLvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvDGwbdZo8ARdx0B9NdsufmR/vzlAwwKZLi4lHYNGYQ=;
 b=JMME0hPV26zOo/bXdqf2dFkfTm1rQHrrVQFQjnAtjfs0Ij9gyPlavlWZ0pxE3mbtC3JxH8LpWyfmLNYivO3m3YNa4hRGxsOKjqKzisnMEqQZJcz1Lc9WhXSbaLHpZMiDta6Nm78+dd4g+7mhQjQRRrVX9B8c6PMuM9aYCBl2MtlAzeeILgDTy3/UNpigHZaLhl8f4LiXZ1k+89e/VnoMVOP1PKIy8wowoWQxvccNukU9kl2nLfkhqpGs1bUgj8/ST1IjX90Px0+N63aRtd9wQafQjB2BlBcOkxSPjpSIaIjPrKTwFMNBaQiYUR4TWNY+hJObLBvwpFBXRIynkHGGcw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Grygorii Strashko <gragst.linux@gmail.com>
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
Thread-Topic: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
Thread-Index: AQHbkncOeD3VtJHazEm60TGwzYlR9LNt0I6AgBRAzACAABJNAIAAM9CA
Date: Mon, 24 Mar 2025 13:11:06 +0000
Message-ID: <b1593e57-bb34-4aa4-b282-0f2de001c598@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
 <5190f71c-4a93-4f66-91d0-aec43a97ddab@epam.com>
 <15bea88c-8294-4164-83df-7ccdb61f9697@suse.com>
In-Reply-To: <15bea88c-8294-4164-83df-7ccdb61f9697@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PA4PR03MB7198:EE_
x-ms-office365-filtering-correlation-id: 20de80ee-9999-4fc8-efd0-08dd6ad55695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejE4S2NQS0xGZ2xSaDRrVTZHVituWGpoREw1ZnlRV0VxUzdJN1VWVkZMSXZX?=
 =?utf-8?B?bldFeERZdmpLY01YV3Z5djNvbUNaNnUxQ2pWdmVQR0VBdlI5Slg2bWpycGlG?=
 =?utf-8?B?UXVBdVFyc0FjeWMzTmY5ZXIzVFFuREdJMGJLekVneGQwd1F6WTVFY2NwV3h5?=
 =?utf-8?B?cXROZ1FFQW5iYThqMWpnVmlEVC9iK2pRSWhhS0RqQ3VVZkJ6dkFjWk0rWmEy?=
 =?utf-8?B?RGxKY1RSU3ZIK0xuS3JZaW5QUzBRdFU3YzlHcER4T1BjbkZSZUNMS0pqR2hW?=
 =?utf-8?B?N1VacVlnRFJ0NXNiQ213Rmx6Vmx1a0xIQ2NIc2NHajlvMmQ5WEptS0RVN01Z?=
 =?utf-8?B?a1UrbHJ2YXU3ZnRjN1ROOVI3MG02S21XRnRKUWNWS3Z4aUpEN0ZNLzZ6dzF4?=
 =?utf-8?B?T1dCMmlVQk9GRzYyWW1PZmhIUGNGejJBOVlFeWRPLzlJaCt3WXowd1ROc2hY?=
 =?utf-8?B?RTAzUDh0L0dGemNMMXg1cDVIbkI3Zlp3ZUYySzZLdkp2TzFycGtUblBhbXp0?=
 =?utf-8?B?ZTBqeDRuNUhFZ0d3TGN4ZUtoSEc4T1NxRjdkdFRMZjN5eC9pYXo0TWk0TEJF?=
 =?utf-8?B?ZlhSNEZyemlhOXVZTW1DRjFhVkYzTnp1YzA3VE01dUJtWnZhVDhRUlJjRkU2?=
 =?utf-8?B?UndRbTFKVlF2c1BTYk5lWGIyNGJnMWx5UU9rWWRCSU82T3RvblFCMGdMRWJ6?=
 =?utf-8?B?S09udVFFcEVTanFPZzNacnBMWlNKdlVYUXBkQSs2RisvM2NGdGc2MThGMEFZ?=
 =?utf-8?B?Tk51UmlhSHJhekE5MVN5aWFSMmcvd0V3MHg3cC94aHp3ZnFRR3dZeXN1THEv?=
 =?utf-8?B?WmNZYUFoaUVJNkFsNXZURkNRQjVJdTFoMGpTeHJEeTRlbndOeklmOW53UmR4?=
 =?utf-8?B?b3YzTHNIMnZQZDVjRXdpdFpveStxdnRKQlZKeEcyTW4xdzZ6R0YyRXhlV1hZ?=
 =?utf-8?B?NTZWNEdESzBMOUtxbkVLYk5rTjNwRWZpQ1hEaUNrR1FrTUh3cm5RT0k1L2pm?=
 =?utf-8?B?Ukk0L0lBYnJTNktEaUthK2dIaDh1S1JsSUg2TDdmK2dSVzlmdDdZVWRRZyt4?=
 =?utf-8?B?NlYvYk0vTmE2Yk0yMFVYamsySDhPR3M5QjJkYzh1NjVpZTE3Y2NpRUlNelVO?=
 =?utf-8?B?NXVlcUdaVzh4aFpvaUt0S0dkR1FRQmN5OG53elpTeVVLTGR5REp0NWNnaUhj?=
 =?utf-8?B?elBjUDIwbHNBMGFPU2FSaDVtVGxvWUE3VldtVWd5VGdyU0NvcjhMRFhJQzhY?=
 =?utf-8?B?TUVNY0N2Y1BNeC9wUVJLbk9NK1FhMmsvcTFReWJnS0h3VmRBVjg1enUxMFlm?=
 =?utf-8?B?Zk5EY2hTcTBkYXVlcGJyQ3FVdEZOVlE1c1J1eUZ6dDlWa012eGhCb1JjdEdM?=
 =?utf-8?B?M0dQQWw1YzFMTEZ6d1BiOVFBcTFIL09FSXZTQ0JHYWs0SmNWc3RnWEZ3UVFI?=
 =?utf-8?B?c1ZXUTEzRlMwazR3MHNwZXdzdkorRitwTmExblNLSlo2dXJnaVZvR0lNSFpq?=
 =?utf-8?B?Tk1wUkU2anppRFRqOG9QYnJUVDZnTDQ2UDVjL2k4Ny8wRXVJM3Rya1BhTzRQ?=
 =?utf-8?B?YklTMzZBblJtSkdvaGxNMVVFeFhOZHhNV1FyZGc2bGx4Q3JPSXhBcmRMZ0xN?=
 =?utf-8?B?ZzhQa3VZVlZMa0dqa2ZXS0dlWjVycFFTSE9ySk5yd2JzUkRSMi9IMTlsalhV?=
 =?utf-8?B?Qm15M25TRGhPTkVHUVM5dWQ5L3UzekJYSnBwaStRL1YxUE9NRktaWkovdUlp?=
 =?utf-8?B?Q2I2ZlN1NDNseHJFczdOQ2VMYjlLa0kydllEZURVOFZSbzRJQ0JtRFJVQWdL?=
 =?utf-8?B?eE1Wdmhvd3o0elpvZTJvZ3l5Ty8rVThGTzR3b0dXbGp1MCtWZnNCeGFXZ0Vz?=
 =?utf-8?B?YWUyem1tMUZFaG5JMHdNbDBBU0dMR1NENHBEWEd6SkJKM3V5ajRHYm80bkFC?=
 =?utf-8?B?bDIwcnBaNnRDQURBZUZsUDAycFJLNzl2dVlQNW8rUkwrUnNwTzByWitWL0NG?=
 =?utf-8?B?RnIrRzExOEJnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFFIdFA5WjRoc0p2OFp3WDBhOW81N09wRlQxcW4xUTRMNmRHWS95K1BVcFd6?=
 =?utf-8?B?VHNoMU5GeUpTR1FmdFBsQ0p3UzFidDVJYm4vK3kzS0hYN2d5dkUyZmJtWHVP?=
 =?utf-8?B?bjBaVURLKzUzbkU4YTBuQU5yWjNrZVdONk1kbGZybkV6b3doaktxUG1JMlFT?=
 =?utf-8?B?ZjI3ci9WdVlWMG5EKzNYVzlsMHpxVkV0WWFvWjJxbHFKVEFiRG9xUTJFWDlh?=
 =?utf-8?B?ajk5Z2NHLy9KTDVRU0NOWnYyempqTTF2bzlzUzlGdFZvUlRkRG1yRFhsSVk1?=
 =?utf-8?B?OTBmUy9zcWttQnQwT3FRV1JKOFBTVTBVNUhqeDVLQmlZUW51ZUMwZllDckV0?=
 =?utf-8?B?RXdOUDRyUXZyYkU4a1YyN1h2RW51QmIrTGliR0ZSd004YW5vS0hRUjJTUWx5?=
 =?utf-8?B?OEdCRVluaUYxTFlvdTlkNVoxVDgvb1NXR3dxQ1dYWTJzNi9uQzhLMlhTQWpL?=
 =?utf-8?B?Z2luUVV4aXVYWFUyeTZqVlFUNmJKTEUvTC93S090VzNqQnBBMGIwa25pTFRN?=
 =?utf-8?B?dURKNFlFQ2s3b2FsanBhS2lTTTFYZnVJVUkrRFR5bnJoVnN0bzFPbmI4dmc0?=
 =?utf-8?B?UElXaU8xVXBLazZUd0dVQ1hRQ3lEZVhvNmgxdzZhM3BUeldtWmdFb1dwU0RK?=
 =?utf-8?B?d1pDRTc3aEY4SnJScnQyRzkyb3FtM2Y5MFNGanZ2RDFpU1pTS2MxSkRTazFp?=
 =?utf-8?B?ZG9aTUQ3Z29tcG5xOGdwQ2hud1VSbm96K2NrSWc2UTViWkJBZVUwWGNRcW5Z?=
 =?utf-8?B?N0pzYzh5VjdvWXVGWjQ2YkJJRFE0WDBoT3NXck9JV0VqQklMK2Y1clBkVk1q?=
 =?utf-8?B?MHJiOFcreG44SjZENzZFT0VaSVRWSGRZOTY2MTRwWXVSOFBNZFVNRW9BdjQ2?=
 =?utf-8?B?ODUwbVNpK3lJbzdPM0tGZTZOOU9oYnVSVnBuc2hrV1VXRUxQRjhUY1RZUGlG?=
 =?utf-8?B?R1NNTldTVTk1OTlPNjYzUkFMWkJKbHdSODZwcE5USG9mU3o4YzRkV0JDeGRh?=
 =?utf-8?B?dGhFK1dxejR0cUVBcGJISEZTWlVlSnhURHQ1SG5ZTVhPOEhxQlhNZ0hXY2lY?=
 =?utf-8?B?K21FTEVvbG5HUnFRYmFKK0J0VDhYaGFWclBzNnR4VEtqSEtTaWxHbGNENjFh?=
 =?utf-8?B?VE5NeWs0Wk1OVmhUWUI0MTQxaUZZUHBiUitQeUJKQWFXY010SHd2NXp5RG1l?=
 =?utf-8?B?WWZDVkhCbnpldE9GTnpjRHNQTUhyRjFQcVNHUmQ2TStFRnB1VWVkaHlCRXJx?=
 =?utf-8?B?YW1ETDc5b09peDh0L2RVR0RlSkFpbDZLMUc4RlpVWi9taDhiRkRkVGRTL1ZN?=
 =?utf-8?B?eXZ0eDU0V3pvUkx6Sm9sc3Z6RWZiQ1J4ckZlRmpQWVo1M0FrUEt0bUs0dW5N?=
 =?utf-8?B?Zml1R1lsazRoTGtpOWthTExNU3dmNjJoazdHdkljUnY0aG9DcEx4UkVVby9i?=
 =?utf-8?B?bVBJTDRlTXlQcGptVXZiSnFkNXl0eDlKS2syZ21KNDVEY2NpRzZ3TzVRYnlh?=
 =?utf-8?B?S0RHTzErbHdNa01BbUhveG1MZnp3OEE2OWhOekxqaEpxdm5vanNiUFpERGJ0?=
 =?utf-8?B?NTJpQ0drUDdZNjYzKzBqdVRMSHNCZ3BOMGpiRlFiUnVqMlMrWncyUW5OMkdh?=
 =?utf-8?B?K0FNbWxxSUdNREFWaEZkOXlzRU8yeW9rZHh3bG45NjBCUjVWOFJYLzk2b05p?=
 =?utf-8?B?RURkTEJsU2dWZ0ZTMVlqVGphaDN4RjhLQmxjZ2FLSzVRZGpSV0dITEtnKzNX?=
 =?utf-8?B?L3ZTTElobFlFVTAzOFJaNnBIK2ZWc05LT2dZbTZpZ2EzQ3NpOWVITlhuNmky?=
 =?utf-8?B?UmVTdCtWMGtkK24zcnVHVUpHSFNmc3VJcGNTbnBkRUx3TmtHL2U3SDRTRDRi?=
 =?utf-8?B?NzhVRWJQeFY4czQ3RE5iUjN2NG1penlVSmE5QXVEMENRSW1INElWckhKQmFz?=
 =?utf-8?B?QWRqb3NOT2FGK1dydkhDTllxaDZMOW14WXN4K3NFQ0ZTSVhXQTdJeUJOQUFS?=
 =?utf-8?B?dnF1aGc1cWxwVUZ5MEJDYTh4SzJGYkdER29XUWZIRjJ1bk1Mdk5LemVpcVky?=
 =?utf-8?B?L0FoTDBYbHJsTkN6S2dqTTQxRjZwUG9qTzc0amM5RFA3UytBRE5GNUZaKytz?=
 =?utf-8?B?TmJwNTVSeHArKzkwWHBDSlZPaHZGTWVEZWNYeFJvMlowYUJCeC9WVEduMXFp?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22B85D7776D8524DA04035A099845D98@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20de80ee-9999-4fc8-efd0-08dd6ad55695
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 13:11:06.9217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1/OIYWwktX8/SteTtfgbWuAZqVkwYueYHj0W2PY3Ekk0+PnHNvijRXTp49SQ4qt2q+zQDfBIMn0p4dxTYuQksZrSlAO/8k7q3Xp3P5vy2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7198

SGkgSmFuLA0KDQpPbiAyNC8wMy8yMDI1IDEyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MjQuMDMuMjAyNSAxMDowMCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBIaSBKYW4sDQo+
Pg0KPj4gTGV0IG1lIGFuc3dlciBvbmUgb2YgeW91ciBjb21tZW50LiBQbGVhc2Ugc2VlIGJlbG93
Og0KPj4NCj4+IE9uIDExLzAzLzIwMjUgMTM6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9u
IDExLjAzLjIwMjUgMTI6MTYsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPj4+PiAtLS0gYS9N
QUlOVEFJTkVSUw0KPj4+PiArKysgYi9NQUlOVEFJTkVSUw0KPj4+PiBAQCAtNTI2LDYgKzUyNiwx
MiBAQCBTOglTdXBwb3J0ZWQNCj4+Pj4gICAgRjoJeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Rl
ZS8NCj4+IFtzbmlwXQ0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0K
Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPj4+PiBAQCAtMzI3LDYg
KzMyNyw4IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29udGV4dF90KTsN
Cj4+Pj4gICAgI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19URUVfT1BURUUgICAgIDENCj4+Pj4g
ICAgI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19URUVfRkZBICAgICAgIDINCj4+Pj4gICAgDQo+
Pj4+ICsjZGVmaW5lIFhFTl9ET01DVExfQ09ORklHX0FSTV9TQ0lfTk9ORSAgICAgIDANCj4+Pj4g
Kw0KPj4+PiAgICBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsNCj4+Pj4gICAgICAgIC8q
IElOL09VVCAqLw0KPj4+PiAgICAgICAgdWludDhfdCBnaWNfdmVyc2lvbjsNCj4+Pj4gQEAgLTM1
MCw2ICszNTIsOCBAQCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsNCj4+Pj4gICAgICAg
ICAqDQo+Pj4+ICAgICAgICAgKi8NCj4+Pj4gICAgICAgIHVpbnQzMl90IGNsb2NrX2ZyZXF1ZW5j
eTsNCj4+Pj4gKyAgICAvKiBJTiAqLw0KPj4+PiArICAgIHVpbnQ4X3QgYXJtX3NjaV90eXBlOw0K
Pj4+PiAgICB9Ow0KPj4+IFlvdSdyZSBub3QgcmUtdXNpbmcgYSBwcmUtZXhpc3RpbmcgcGFkZGlu
ZyBmaWVsZCwgc28gSSBkb24ndCBzZWUgaG93IHlvdQ0KPj4+IGNhbiBnZXQgYXdheSB3aXRob3V0
IGJ1bXBpbmcgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTi4NCj4+IFdlIGFyZSByZXVzaW5n
IGFuIGV4aXN0aW5nIHBhZGRpbmcgZmllbGQgaW4geGVuX2RvbWN0bCwgd2hpY2ggaXMgZGVmaW5l
ZA0KPj4gYXMgcGFkWzEyOF0uDQo+Pg0KPj4gVGhlIHhlbl9hcmNoX2RvbWFpbmNvbmZpZyBzdHJ1
Y3R1cmUgaXMgYSBwYXJ0IG9mIHRoZSBmb2xsb3dpbmcgZG9tY3RsDQo+PiBzdHJ1Y3R1cmVzOg0K
Pj4NCj4+IC0geGVuX2RvbWN0bF9jcmVhdGVkb21haW4NCj4+DQo+PiAtIHhlbl9kb21jdGxfZ2V0
ZG9tYWluaW5mbw0KPj4NCj4+IFRoZXNlIHN0cnVjdHVyZXMgYXJlIGluY2x1ZGVkIGluIHRoZSB1
bmlvbiB3aXRoaW4geGVuX2RvbWN0bCwgd2hpY2gNCj4+IGRlZmluZXMgcGFkWzEyOF0gZm9yIHBh
ZGRpbmcuDQo+IEV4Y2VwdCB0aGF0ICJhbiBleGlzdGluZyBwYWRkaW5nIGZpZWxkIiBtZWFucyBh
IGZpZWxkIHdoaWNoIGlzbid0IGp1c3QNCj4gdGhlcmUgaW4gc3BhY2UsIGJ1dCBpcyBhbHNvIGNo
ZWNrZWQgdG8gYmUgemVybyByaWdodCBub3cuIFRoYXQgaXMsIG5ldw0KPiBjb2RlIHNldHRpbmcg
dGhlIGZpZWxkIHRvIG5vbi16ZXJvIG5lZWRzIHRvIHByb3Blcmx5IGdldCBhbiBlcnJvcg0KPiBp
bmRpY2F0b3IgYmFjayBmcm9tIGFuIG9sZGVyIGh5cGVydmlzb3IuDQoNCkkgY29tcGxldGVseSBh
Z3JlZSB3aXRoIHlvdSB0aGF0IFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gc2hvdWxkIGJl
IA0KaW5jcmVtZW50ZWQNCg0KYmVmb3JlIHRoZSBjaGFuZ2VzIGFyZSBtZXJnZWQuIEkganVzdCB3
YW50ZWQgdG8gcG9pbnQgb3V0IHRoYXQgd2UgZG8gbm90IA0KZXhjZWVkIHRoZSBzaXplIG9mIHRo
ZSB4ZW5fZG9tY3RsIHBhZGRpbmcuIElmIHlvdSBhcmUgb2theSB3aXRoIHRoZSANCmZpZWxkcyB3
ZSBoYXZlIGFkZGVkLCB0aGVuIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gd2lsbCBiZSB1
cGRhdGVkIA0KaW4gdGhlIG5leHQgcGF0Y2ggc2VyaWVzLg0KDQo+IGJ1dCBpcyBhbHNvIGNoZWNr
ZWQgdG8gYmUgemVybyByaWdodCBub3cuDQoNCkp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgSSBoYXZl
IG9uZSBtb3JlIHF1ZXN0aW9uOiBJIGNvdWxkbid0IGZpbmQgdGhlIA0KY2hlY2sgeW91J3ZlIG1l
bnRpb25lZC4gQ291bGQgeW91IHBvaW50IG1lIHRvIHdoZXJlIFhlbiBvcg0KDQp0aGUgdG9vbHN0
YWNrIGNoZWNrcyB0aGUgZG9tY3RsIHN0cnVjdHVyZSBmb3IgMD8gSSB3b3VsZCBncmVhdGx5IA0K
YXBwcmVjaWF0ZSBpdCBpZiB5b3UgY291bGQgc2hvdyBtZS4NCg0KDQpXQlIsDQoNCk9sZWtzaWku
DQo=

