Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JqxHq2E52m+9gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:07:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC343BC42
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 16:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289016.1569250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBl9-0008QA-DZ; Tue, 21 Apr 2026 14:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289016.1569250; Tue, 21 Apr 2026 14:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBl9-0008Ob-AA; Tue, 21 Apr 2026 14:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1289016;
 Tue, 21 Apr 2026 14:07:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wFBl8-0008OV-F5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:07:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFBl7-00BTel-Ov
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:07:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e78493-2eae-0a2a0a5409dd-0a2a450ceb08-30
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:07:25 +0200
Received: from [52.101.43.137]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e7849b-62f1-0a2a450c0019-34652b89b4c3-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:07:25 +0200
Received: from SJ0PR13CA0227.namprd13.prod.outlook.com (2603:10b6:a03:2c1::22)
 by DS0PR08MB10938.namprd08.prod.outlook.com (2603:10b6:8:312::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:07:20 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::2e) by SJ0PR13CA0227.outlook.office365.com
 (2603:10b6:a03:2c1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Tue,
 21 Apr 2026 14:07:20 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 14:07:19 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4g0PLb1kcWz1wdM; 
 Tue, 21 Apr 2026 07:07:19 -0700 (PDT)
Received: from DS2PR08CU001.outbound.protection.outlook.com
 (mail-ds2pr08cu00100.outbound.protection.outlook.com [40.93.13.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Tue, 21 Apr 2026 07:07:18 -0700 (PDT)
Received: from CH3PR08MB8735.namprd08.prod.outlook.com (2603:10b6:610:160::11)
 by CH3PR08MB9275.namprd08.prod.outlook.com (2603:10b6:610:1c0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:07:09 +0000
Received: from CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb]) by CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb%7]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 14:07:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ohk4ZpoRy70VEe5dKDdppBaATqt8JiIrLub2bzLX5CA55aL3p3nDNGA0+il8EZfExeLx6sdYeeon/qiu3AWgfROQhm1PlxRhtgbojYkzAjTYRZCgfd66XYAxzbyIevf6LUqj72OF0EQpcuTORTq6kKEFQGQo3puDsIK9gZXmpgwvgmqZ8kKYOwgebLUkbU+oz/uMh173hq5Zc7Ky1uk7oDGVHw1aqPzUo1L7DRJu37gTh/eGYjkaCShQPfkWdZ1+VKu0eV08YhRX/M48TuzCx+GT1nGSpdLCcOOT3p5V+sBAv5j2XSk5PmYY6DxUTRbCdYBtVTLXB8dWp3OURLVJYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMAbdzkmZ5IVwEOyN/4S2RtyRj/t40Q5Se0zwlSipfc=;
 b=GQwGxP7/W4BIBRDXWwo7DGMOL3lCAIU3DIPP8pEe7rotSn8VstbAZFzKHlY7zn/sCUCWoU2II+kh0kDOd7z5433C9gQa0dsCSh44RiDCEZkbnsrLfccG2hA7DL8dvmZlvqBG8OuLlwnv/jiPK+rjvmHwkgvLmJo21GDtS8o9VS9laxvSbYrgdbCbJFmruisGwzd1VXBO/xpqOZP11Z/S6SJkZN6oM/6AS9NL+mf2CXujOvhth+L/EH7gs/RtGzxlc7xNDs61XedDHfqIhfxDsfHX9k0Lw7NU2/vUGpQ4pxWqp+D6c3nJIFFAzm4yzgOTP85LtmO1T5xir49Or35eRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.72) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com] dkim=[1,1,header.d=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMAbdzkmZ5IVwEOyN/4S2RtyRj/t40Q5Se0zwlSipfc=;
 b=GMjt5lBIh4iB+TpZD719z1AJYza7nPMFhTYse8QVnC3I+byKU5woR5HWqbswMpp1m5sCipUvI5yF3WNYZ14eY1zjoaCp3RG+l14IUBeta1EE1B9KpQ5Unq5Ag0RHS9epxBeCIYeFX3dxI4zFmP0veht6ZlztbY/WtJRdfP0eYOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.72)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.72; helo=DS2PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eza6aFsbNfGxfxgIflKMn1QYcVsIPU2fYEcPELTv9Lr4QUaXco2k+CAeMNBGqjRpEQcE0OI+zDr8fWa2Wb5RSxaum8xDQkNF7lwfGppo0CYUkSDsjJkfUoFxnM2rk6Yp6s3kx/6HFkTgLwv/ZwA7R4eYgA6UXuysY0eYPox4b0kBDzSz5+nKR2vSwplpdGAAwhGwPZ7kYEFcFyqK3PBZiHasXMFI3Icx0raxF80sInZZzCFc5D8m784voFAhq5bO+KM+2V/v92ybz+u9tWFxgpwVVa7SV0jDK0dVl7KRCR8YhZdxXAd46KvxhmGZWw3FEr2Dk5FpK5Jesa3bcG3ICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMAbdzkmZ5IVwEOyN/4S2RtyRj/t40Q5Se0zwlSipfc=;
 b=yQ6v1vi8Q8fAEhJUnJ+aT7+J8FtPlonCOy1u/2XHleh3A5u/RzlNLRlaQNHLPahWcY0nCMIWVF4Q7+xKlad16Fgvr76jdgO+c+vokKGICmGxVGP7+W+B/hT/1ij/l9nukzz07u2gITUqVZI5Opa2fDJPqYaTvQ4bTzPJAfwgAmqD4tf+MBxBLSD8dJULdRTeEM7G0R3pN/sfjjbd0W9fOMLEXzkVGXqvbhaitlymPvAYVOlSqv0HqIEpeZjsmb5bUyIm5CrHfeVl8gQ7hhFVMCtvr9J7y0HHOQtalCA9lOSRX+/fAh2jtoC00YPnnwtAinN8SdeCkRbaX3GgkvSBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMAbdzkmZ5IVwEOyN/4S2RtyRj/t40Q5Se0zwlSipfc=;
 b=GMjt5lBIh4iB+TpZD719z1AJYza7nPMFhTYse8QVnC3I+byKU5woR5HWqbswMpp1m5sCipUvI5yF3WNYZ14eY1zjoaCp3RG+l14IUBeta1EE1B9KpQ5Unq5Ag0RHS9epxBeCIYeFX3dxI4zFmP0veht6ZlztbY/WtJRdfP0eYOU=
From: "Spangler, Rose" <Rose.Spangler@elektrobit.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
Thread-Topic: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
Thread-Index: AQHc0Q08g9UjbgeVPU23tPISZnL/sLXpdhuAgAAVnXI=
Date: Tue, 21 Apr 2026 14:07:09 +0000
Message-ID:
 <CH3PR08MB8735846D3C525C40DE983AAC912C2@CH3PR08MB8735.namprd08.prod.outlook.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
 <20260420213206.208750-9-Rose.Spangler@elektrobit.com>
 <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
In-Reply-To:
 <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
x-ms-traffictypediagnostic:
	CH3PR08MB8735:EE_|CH3PR08MB9275:EE_|SJ5PEPF000001EC:EE_|DS0PR08MB10938:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fc4ad9-f930-41ab-e4cd-08de9faf4d63
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Va2uBBWZfPoCZh6Vlp1g85DgHDjLh4UiVflYNFNb0Lem8Ku/6AtISkZr7DCdY/nKxUJzSFhUbMofWz6naJ6CMxPq7NCP/X5wSgX5hCaRb/mH7leNV+gb+JMZ8WpdrzNVf+YtM3p3IWyM1TvqHuUghiA7a3yoaPu6S2WeTeBNVnUGx90UtRTjsUs4DacV4BYV6ED6K9x+WA/o35ePEB+zFQoxUSopU5c0raWRSINbVxB1Fs239Wn0BJpvCGwC1iHOJ5El5akSXzxA7PhaKJ51kGpmVV8bBEQm7ZByejh5Nx0IzzLkgODnlZLuKySeKekWbMi+iJlh29qdR3HQjzsEeeqsr3M6YOzn1R9CL8Sqa67dITTQTSex/VBEFEVZdo4nUpB9spCMrrG++e0Wj4Sv3Zwk57UM2B9oC5G4kr6zgimCnSVSfm3pc5IaYw2VqvW1l+i1gxsD44rXfLZqPxeCu5SmJvHvsqEMcJmmbPWFdAd3shnN61kap2r+CXN+h+UM0ZZKCN5GLbzQiByuWr/zvP2zygMsF9a7mcAobNHfUh8KpKyJ21qfxn7CRnSahDLICDdP9poDwGoddPEyJ+vtg0AfGsuAl5UWFxqPlKix3XAS5ByU9feyO+gZATMFacmPV1JCnJRz4e70n2Hg8s5dpNOhySuWVQZGLy6ji3UuV5LJbo1H7peI5iGxlL4UJwiXgDaBYTRpjwgslfd13Wew5wvFHC5d0Zx1edPUv8bAOAHTndV7xf+BpphXI2bdYtlIS9m/1xfGh1DIwrvRLiqc73JlTqbA4t6IAeu7zYXCs6o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR08MB8735.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 hN3HgwlLo6agyIAoGJ323jfvDgQDcnaxRVkLGzhxOXHTfU7nmrAAoWn65xquMv8syk0QeX9WObrZiixIJIAviHC3Ww2SfWG+jSnID1jxKF2C10yB53gT7WmNEV/Pc9oS86tIQg/aHqG0bdiDEx2u5WwBB/Io7lCDuD63p4a6zqDh2qrSwbP4x0LxVe04LQ92c/mdBZUXWvJXNGEGr9huI9wBrs0Wn9IH8ZUxRjFFjqcLDiq2FrjZdXGuqqVqJ3leAeFtDSsjOMWXBF9pevd8ErBKbVO4tMZZOd1IetSkO+uOLLCwhcWgF7ykbctlWs3ZhPMnog56i3R7z9rzpgU4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9275
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.13.72];domain=DS2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.13.72];domain=DS2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	062531d0-de48-4225-80d9-08de9faf474c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|1800799024|376014|7416014|14060799003|82310400026|156008|36860700016|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?nKI6DqFWh+odrzMjNcNAS7sLkVRDzsXLtlcYC4xKr9VXtbgadBnIhnIO6m?=
 =?iso-8859-1?Q?DHAGuz5Z2exXaPbgn0/hZgzj3TlSsm3xGcLAxnKquutkWV14xKLFCSHyFJ?=
 =?iso-8859-1?Q?mDpl75X4fPcGX1VPbajBSIptZMFCT9GNquRYEfbssB8bSBOFIF4RweNRmN?=
 =?iso-8859-1?Q?nCyw4kniGS2VB6ZsafKJI4SfAAMpMl9QFDNK8tgztezcNPI43ZBAMSnk/8?=
 =?iso-8859-1?Q?THPf9Fk9Oi9h+gRsUbdFHuAlWshVBSvEhYK+BAOIax/iago3uHomZ6+rry?=
 =?iso-8859-1?Q?QCQWaftdeiUH+bWPNX/9JmSOZzb2f27/fwjNfyeqIOLYO/BcWnRCn6tKOO?=
 =?iso-8859-1?Q?IN6cAj9C9I56AMG9PFWfZEgy6C9bxrpk8f+CRt4E/ZSV0Xp5iX5r2/vrtX?=
 =?iso-8859-1?Q?DbPBL1E+iTC3ivqr88Si0uSbgTjWTD70yLYeF77Q2+8dqB7+n2/HMqP3Mh?=
 =?iso-8859-1?Q?mmY8ii71abbOxFJ5AJhhPBhbsDGDDDYL1xy2Ej/RsGYXZa1NiM3sBvtd8g?=
 =?iso-8859-1?Q?jzhleUXSPObEOc4iS5MvaVNFtwnBmwvEL7erNSdoM9+B6x8E0cVva3X/fY?=
 =?iso-8859-1?Q?BbEH5CaYxUocjmVgeCoOPsJMpa+rsGKDYodn11Gu0g7I8ePn8V8P3VxjWE?=
 =?iso-8859-1?Q?I9n7OqqDvNlTs3evEePVmefZM5N/jOoYjuBR8fKqZzdhEjrTmBBfWSBTb0?=
 =?iso-8859-1?Q?mj+21px0i6oEhAJcufHQs2Q5U/Twjvm/12qnhU9XDlqILZRf+PpG+vYgCb?=
 =?iso-8859-1?Q?UlmU/KteayIiuE2/Li/bAYF34Yc6buDSls9MlmOnWeCkJHfwCZGlbhWPJU?=
 =?iso-8859-1?Q?K6AIBEhPl34Lf9hDaoHPm207t9iTm61R10CYg8uvM3LnSehVdOk7kVLWqS?=
 =?iso-8859-1?Q?RU031NxRfxPWhx46xgub1XskSG8jh3eMBE40Avf3B1744tdZIVmwcfzcVH?=
 =?iso-8859-1?Q?dt0Z72z3DLbOK5acMrN11gU9db0d7zjwchpiMlGx8d/KJ+c36p4UbsN8+l?=
 =?iso-8859-1?Q?Er4di2Qd0TsPm93nc9Mku7nL+AqYqxvXWLLz/uMdYsetVgcnyTpykOUeM/?=
 =?iso-8859-1?Q?GPsOz95jRtWRXkUN8T30mi0x6/DPVvMNTA/AOOW+tkYVgfz7TWH4f7hM61?=
 =?iso-8859-1?Q?kTwnhkuSJ3zp66VSlN3ieO6CW1hJA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR08CU001.outbound.protection.outlook.com;PTR:mail-ds2pr08cu00100.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(1800799024)(376014)(7416014)(14060799003)(82310400026)(156008)(36860700016)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JNh/0st8fKYb7DQsFRzW67MZZJDatAoJzEoRp4DErSbFtyEFEQdiHBLrkxE0KlKjx4qdS4c8DcWhDxAZmSSnd9WSTp/o2/yTRki6gTf415MRjQPTIGPw6PJA8UmNjisV1Mq+yiRDyt/+WDItM5OOB9X2/3S7fdXmYt2J0zZKsmBnHuzWWyEQVoFcgUuBTU/lr3QJgTvC2GPhufGvcatr56WlHSQj6tmtZQ9Y5iiiOsmVc30cXMpHo7TxmsHc3Qom143dHtd/LUYJghOcGv2AsblXT2HfIONHHkPZtlwg04CwcSyuhrhgh3TQ8TaG2xSeSAcDzSNNLXGxlvyLXQwtFgUU+0SMM6eXTXR2si63PN32AZPmPfq5zBzW7tnawO79Pqv7W2oD+lChEOaljDEnYDW9cRsTHF4I6vBMNK4YJOscX2C9OX6ujVMrQvZDYR9C
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:07:19.7089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fc4ad9-f930-41ab-e4cd-08de9faf4d63
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB10938
X-purgate-ID: tlsNG-d25034/1776780445-F7C1FCF5-7301F3AC/0/0
X-purgate-type: clean
X-purgate-size: 998
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tamas@tklengyel.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,CH3PR08MB8735.namprd08.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C1CC343BC42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>The following function names could reasonably drop the _altp2m suffix:=0A=
>=0A=
>=0A=
>> - p2m_get_altp2m -> altp2m_get_altp2m=0A=
>> - p2m_set_altp2m -> altp2m_set_altp2m=0A=
>> - p2m_reset_altp2m -> altp2m_reset_altp2m=0A=
>> - p2m_activate_altp2m -> altp2m_activate_altp2m=0A=
=0A=
I used these names to try to differentiate between these functions, which=
=0A=
operate on a single altp2m view, and the altp2m_init / altp2m_teardown /=0A=
altp2m_flush functions, which operate on all the views of a domain. For exa=
mple,=0A=
without the suffix I don't think it's necessarily immediately obvious that=
=0A=
"altp2m_activate" or "altp2m_reset" operate on only a single view. That bei=
ng=0A=
said, some of the other functions such as "altp2m_change_gfn" and=0A=
"altp2m_get_or_propagate" don't follow this convention so I could go either=
 way=0A=
on this, I just think the suffix /could/ provide a bit more clarity for the=
se=0A=
functions.=0A=
=0A=
Best,=0A=
Rose=

