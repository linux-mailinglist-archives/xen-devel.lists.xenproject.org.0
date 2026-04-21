Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG5FEWXF52lCAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 20:43:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230343EC2D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 20:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289287.1569403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFG3R-0000bn-Lj; Tue, 21 Apr 2026 18:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289287.1569403; Tue, 21 Apr 2026 18:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFG3R-0000aL-Ho; Tue, 21 Apr 2026 18:42:37 +0000
Received: by outflank-mailman (input) for mailman id 1289287;
 Tue, 21 Apr 2026 18:42:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wFG3Q-0000aF-Jy
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 18:42:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFG3Q-00C8jN-0a
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 20:42:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e7c50d-5cb7-0a2a0a5109dd-0a2a4507ca94-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 20:42:35 +0200
Received: from [52.101.57.132]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e7c518-229c-0a2a45070019-346539846e19-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 20:42:33 +0200
Received: from BL1PR13CA0356.namprd13.prod.outlook.com (2603:10b6:208:2c6::31)
 by CH3PR08MB8942.namprd08.prod.outlook.com (2603:10b6:610:1cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 18:42:23 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::76) by BL1PR13CA0356.outlook.office365.com
 (2603:10b6:208:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Tue,
 21 Apr 2026 18:42:23 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 21 Apr 2026 18:42:22 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4g0WRx46b5z1wdM; 
 Tue, 21 Apr 2026 11:42:21 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00104.outbound.protection.outlook.com [40.93.4.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Tue, 21 Apr 2026 11:42:21 -0700 (PDT)
Received: from CH3PR08MB8735.namprd08.prod.outlook.com (2603:10b6:610:160::11)
 by PH7PR08MB8819.namprd08.prod.outlook.com (2603:10b6:510:2eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 18:42:13 +0000
Received: from CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb]) by CH3PR08MB8735.namprd08.prod.outlook.com
 ([fe80::f5d2:ef47:3ccd:92fb%7]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 18:42:12 +0000
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
 b=ZktkJG42FToYIf+eiNQqYWSFSnUIc6+JM9ZwHvCdGPKr5B3sduzANYNH8iQzj2s2jv56rqa6nm4yKUfO8b+HklMq3YgwcOLgkWb9d+thR4c5HXmb0PqPRXf06QS6uAl/0h7W0s5TRxkeg+rVPSdMGznhrevN9rIKgOAQ63uAAJHuYJrTwhMebgoA4MfV6qWjIDRa3egqVykMsIIfwTGgPybGo9fWq7VF8IpAx7rHyahmfq3EzDf+VoAv9QvWPXfhr9YPQ37cUMdcGj7+QhCSvivzMuWViUbxBy6eCZn4r2E+OLnNOPd5e7UVFupCKhGa8SMaiGwv7F3sTafC7Cfaqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zePeV6JogWVgPOLkUovX0ZChv8qdRTuH59k7XA3IYow=;
 b=J5p9zuvIC4o0c+hPio3K4CKPGmPpDGuMI05oki25DpazqizwuIKPJQ4JMmmUQjINfoBvB7IK1rwRqMHoWa1qzl5SMMkAwXFvHhBpEbxBvGiF6E/oOap6PdMB/65uJscTesyGkWHdDZQ3NwKj74ma0RJ/7rz04NQoczz9j5s2Vej61PqaPCHaWYLpmhlD8gqNAAQYy/9yr+HRMNG6kybbFhm4CXAO2VTnIkegbqgZB3xiJBHigbQGXH9O7Pmh5MWy6uKE862b3UEqQgO6lQMusWn02jFkf/UcYAzKwOe7kwkCz3aExTPpaV8sKfRlu0GHR7I4AndjUWHUUu2s7D3Pwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.12) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com] dkim=[1,1,header.d=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zePeV6JogWVgPOLkUovX0ZChv8qdRTuH59k7XA3IYow=;
 b=SmYU/shCUdSusMovNzAvmTF3BqouFgiUt9KF/awkCmvbxSAvbEOBSk93qJfekcqPmNLmnaliS4tlsVtQshV1vuJHvdMxx9dEJbr4LoFBVR4qFNmrAhgFHd9rAPbo/VK/Fkds+gqBuz4Y5P2pVXoPCMWQpURSmmdLsU4u5UDIhZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.12)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.12; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrXkpfs7wvnaPSlcS6hJvU2j4c29MEZUBOw/xOoR45KKPHNnhvyYkRq3SrGcevZRTGmx7+HhsXg6MRnAfc+6aEu1fyVvxB8vkiCtlmdwawbTzz3MOzHlzoOd3HqEK75cvaRfSY/OnJ9aR5TKk0Zso9Hlfff1NWriYVffvNpXykzX8M1pITuPRZWQfhkeu+mltjQOtV/pFV+KFVTiMCrbe75jNhNhJ7W6zVpHcf5Qk1XbGzr9GD3hRSYckUg1s7P/WePx3wClBLzgx16dH5ITonhIlHqNPHD+/nc+DHqfSPK5ZsBfxFyOEO5YnAKGpy0ZH5qk9J2VJTOYIxLYzHwCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zePeV6JogWVgPOLkUovX0ZChv8qdRTuH59k7XA3IYow=;
 b=HJKZKWSyWqrorWg/jr53wJ208IHkczKiiNRuBA7+m4Sm0J3MH3HzEQhvsrFGGda2+/Hlyp4o+svSsrKcHKy6SxLZEXlETK0yE34plTBMfFXEgGORLEPU6zBxfOm1zt2z29rHVepfmVW9uo/j+SLu3yFCFrhrvcE+pKk2CHHXdqgPxqgobAo2Zv1kyTO3ZnhXiwvr5HwJR6T6RHswoKCTmb0rjfdVv1BiyazWfOKFikHiSl5sCHUGIwLmRYurEl+IxDlyZGtCR+BsAXzryn88SI2MSn/B/vuhXVaCBgYEvZiuGdW3seFrpZWlf7NMIJ1BCneU0WejJc0elhYC0TVsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zePeV6JogWVgPOLkUovX0ZChv8qdRTuH59k7XA3IYow=;
 b=SmYU/shCUdSusMovNzAvmTF3BqouFgiUt9KF/awkCmvbxSAvbEOBSk93qJfekcqPmNLmnaliS4tlsVtQshV1vuJHvdMxx9dEJbr4LoFBVR4qFNmrAhgFHd9rAPbo/VK/Fkds+gqBuz4Y5P2pVXoPCMWQpURSmmdLsU4u5UDIhZQ=
From: "Spangler, Rose" <Rose.Spangler@elektrobit.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH v6 42/43] arm/altp2m: Add support for altp2m_flush
Thread-Topic: [RFC PATCH v6 42/43] arm/altp2m: Add support for altp2m_flush
Thread-Index: AQHc0Q1aXIo1jphIuU6k06S1vKsaS7Xp2JVR
Date: Tue, 21 Apr 2026 18:42:12 +0000
Message-ID:
 <CH3PR08MB87355E6A8BF87F54584EAD20912C2@CH3PR08MB8735.namprd08.prod.outlook.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
 <20260420213206.208750-43-Rose.Spangler@elektrobit.com>
In-Reply-To: <20260420213206.208750-43-Rose.Spangler@elektrobit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
x-ms-traffictypediagnostic:
	CH3PR08MB8735:EE_|PH7PR08MB8819:EE_|BN2PEPF000044A9:EE_|CH3PR08MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5b859d-4f90-436d-4508-08de9fd5b9ef
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 +mMRr2vSMcyf8Ei22OSPBGzycQW/vadDUak7j8uz0S5yFeJKeQ/lPoLMlQ/cyy8mjiY2nhBhnXdyJaptKSeJOr830cdpFBrY3v3NTF79mgur8tF9oiHRPIiEIRP13LEDdClxoTSFTE5bszIKnElsT0EKkZD1SlAkaSNguI/KBbiUok/CzhSLZf/VsuATBeVcT0SwE5SuCDdtPWKIc8lw98EOdE6PQPxKZmgYarJgKyn/8oEa1BM9tTMjLXilN97ytcvZasr0H5LMlmlrzMjepk9znzkBTEeVKHUOQugFsgFFiXUG3gH2P84FP3zeVi+WwOalTBuo1DR2O8KkVXAdz98fM6yRseQSS3v3ProU2g6w/ySJacVphjXACdq3pjU1UQORthRpsEf6ENfyZOOrJyXe1//rz2wEDobfMORwVykNzjO94yGLVXOEl4P5EHOgp+QWGDN8/NHT66M0mrG1AQWpXzntwg8cwmW6V6GrP/rqFU8H1kr1/fszbJEZCmNjEI+VpIn1P0hXdTEO0bO0zSDPmwzXCUcOTWZ5aLFkCM8pTxHQ3d/M3yxXgjf6HFrAcXTrWcrapuwANU7WWOHjHsKtIWXmDGHUdtN9B+3RA+kz3yJjRa3hjpUdoSpwMuVTFAZbDeZVOWuXIbMAd64xyXqtSSpw4TUzzCEFwlUhVTyx3OVGqViNsjfYdShcOJJku9n0q1kuj9HiSVOUzr0C7qtFMxvLVrV56wFuh+LnN6z+gQt6FJG2NcKWUIRsfVqV/YvlFp/7v3DRdVpO5b3mZTqBPqU7Bh6JT+rDhnJapRE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR08MB8735.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ATu4YCbDHihEy1KItdVHqJP6guNHRIA2S2mWxQPGTxznfRggD1ifWMZPrBE8PtOMDDH4txquRLjmJgsEvMtbKqOoNoe0Q9pAoKado29BYXHEEyxU18yeIIj7eSlJOxRVJK4ld/bcPPyrAW2sGt1eqzPD9Xe6GBoWXAGUQBq06OkTPVf9Lg4DUtlLzkmcBUpOa8sTAgLsZu2yMY73RI1Y0r8+3eSkDCBzyt2MbQUWgYuLX4JT24VUoje3YeHWELzw4XUUupQan8gkQW9nWHdL4RCgqe4U1Mazm2Zg/+tywIpzk6CWPa2Ka8jXXTLxvUrkBr0IybiAoLhGiowC6PfeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR08MB8819
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.12];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.12];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d557483-3f66-4dfc-a7f6-08de9fd5b3bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|156008|1800799024|376014|36860700016|14060799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?d7HUiL+Ji8/CmGvqfGmR2Gx0bFSuMyq0rgTL9fimJrYuHx2Smi4peYZPwc?=
 =?iso-8859-1?Q?WNnjO+3Tbo9wtQZmPSozvpejTNU3ISvu6YraiSViX1glqgRLQIKKbur0CU?=
 =?iso-8859-1?Q?VceSISqSv0ngWNujMoBuUFN/wQ3Wd4ktu0XrAqviygD78jj5pWE8b6qY2g?=
 =?iso-8859-1?Q?l2cK93+Km6fNTzmy0NUoGrkZLozGSDy1pRWyIatX4dIVP5uLSiNCq5MiRY?=
 =?iso-8859-1?Q?f9XhMPY008e7G6XBdzObviYbyoAFZ4bDg+BQHiCZ/nZeahmYoLHsnFzZH6?=
 =?iso-8859-1?Q?AhprtGpVILMtgt9rps10e5ah4Erby/wWpTyWbkmdENjaLwOBteD6GXtjNa?=
 =?iso-8859-1?Q?EGwKBeEuZo2XC8xfOhMP4BKhVvfeAmrKwMIGWeQOPF7sszZ++9IoSdf+pO?=
 =?iso-8859-1?Q?W2VsSzPy0YaJK0aPojdlQVdvYF0y2szZKo1oiAXrqcqkyzaoBr7UDQKjfg?=
 =?iso-8859-1?Q?/zKlTBFGaK56dSz6t6bVaHetMm7+c0anYEKAuZXguvZpZlqpU2Bnkmm3En?=
 =?iso-8859-1?Q?mz3bqgGYE17rM7GdG3Upa+RMJdQl77DXewpeGbL1BSTQj9HiWaw5RUPXeV?=
 =?iso-8859-1?Q?7ENCu8G11ZycGWLFzmbftw7/06KOKYh/BFVkKf1eSdAR7V/pAtch5kGkGL?=
 =?iso-8859-1?Q?opeBe63e9LJh23SEOV6d//zA2V17TCoiRD3r+HLUBrqVKzgdzbzTGtH+l9?=
 =?iso-8859-1?Q?uEt/frzEuxSJcTT4jDbEWoxp12Z+8R8DRpI7SmQ5lEgJj45Qa8n9CNUlT9?=
 =?iso-8859-1?Q?dxcTj+QStvlOqNoxagMC5aP0Zu78BFFqlbiApLXjaIXZ/lPtVC/01jvjKh?=
 =?iso-8859-1?Q?U93XaEX1WWWsFdzN1bo2FI4Ljang7u/lCRClKML7Uyh4HB1q5G211fxiPC?=
 =?iso-8859-1?Q?+1IQQkZIWjO6n6IghDZYIFkPbEqvpK3nqo7o2LxplvJioTUtjyRRrM7hlD?=
 =?iso-8859-1?Q?C3QujE5WQnzRZHz6wtegQJa94GHGUANWP8oX2kIvvbmdjl+N8luKGMUOOC?=
 =?iso-8859-1?Q?2VbSE0OwuD32BzTfV0dIS2n6Iw7M6fPTxEe/HYn6k1VG5flw5nM9jsNucB?=
 =?iso-8859-1?Q?7oa7vHE1dftk2ZZjVw6Ply17VToBwKjdXTme02oDxNtHV5Pxq4vawP6PTs?=
 =?iso-8859-1?Q?xYCbUOwJqJKp8/rVGCYsmkXJ88IXY7/ATju/Q6aapBirtHEQLJxTR/egFv?=
 =?iso-8859-1?Q?0MaWJahJ2WxHr9O6MdOc+B+aUZpO4NlhXOTnxVNrq4cMOUyWDQM6rJAPSh?=
 =?iso-8859-1?Q?8G65apQrmN1yqvVdU4RA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00104.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(156008)(1800799024)(376014)(36860700016)(14060799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CSXeqFW6ZKiJeWzIw6Zkhi0kFu04IdXBAOhl3Q6hUf192YCk1d02cdjKA8QblYEMvTfSHQJprf0icTWnjMs+LYcZggriJHy7RfJDBig7Fl98/qirKKFzWpTP/F2r8Df6etCCehwc9TDaCsEtjgDv1ui30Jvg7IgbzAb0LtiUaw49sgKcMBAWppvZ0Lu4Xe2wd5z3wC2sIbs32NYnjY6ubagFHVb2y4/n+qtufvQEbyVLs0P/l5AC4ZKXdHPajJAn4+PoA+T9scX+Q6mgMotUzYC42SL6dWhgNArEdqbVSS0f3YkjHYdJXxO1IMtfgwcsQSP8WxFQPMW/L992rNEiNWkhe2oscCMnNpdEVxSTL/o3o/JmEs9xKi7TvFlDVeoMJz6krZfF4qQUu5JjDN/vl5qKW70OiH5sGKbSXJ0PtgzS9IZHERjd7mNWYgtaroLH
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 18:42:22.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5b859d-4f90-436d-4508-08de9fd5b9ef
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB8942
X-purgate-ID: tlsNG-ef75cf/1776796953-14052C48-48E2FF6B/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,elektrobit.com:dkim,CH3PR08MB8735.namprd08.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 7230343EC2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> =A0=A0=A0=A0=A0=A0=A0 altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);=0A=
>-=A0=A0=A0=A0=A0=A0=A0 d->arch.altp2m_eptp[i] =3D mfn_x(INVALID_MFN);=0A=
>-=A0=A0=A0=A0=A0=A0=A0 d->arch.altp2m_visible_eptp[i] =3D mfn_x(INVALID_MF=
N);=0A=
>+=A0 =A0=A0=A0=A0=A0=A0altp2m_set_view_visibility_locked(d, i, 0);=0A=
=0A=
While implementing altp2m_destroy_view_by_id, I realized that I set the=0A=
visibility of the views here instead of actually making them invalid. I've =
fixed=0A=
this in my working branch by adding a new arch-specific function,=0A=
altp2m_deactivate_altp2m, which both calls altp2m_reset_altp2m and sets the=
=0A=
views as invalid by setting the eptp/visible_eptp values to INVALID_MFN on =
x86,=0A=
and sets the altp2m_state value to ALTP2M_INVALID on ARM.=0A=
=0A=
A side effect of this is that altp2m_reset_altp2m doesn't actually need to =
be=0A=
callable from common code anymore, so the concern I raised previously about=
=0A=
ARM's altp2m_reset_altp2m implementation needing a useless altp2m_reset_typ=
e=0A=
parameter is no longer an issue. altp2m_reset_altp2m is used in=0A=
altp2m_propagate_change however, so this issue might pop back up later.=

