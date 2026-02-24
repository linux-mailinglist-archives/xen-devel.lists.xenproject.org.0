Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEpgMZ8FnmmhTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 21:10:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6E18C493
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 21:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240263.1541706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuyin-0001x3-DI; Tue, 24 Feb 2026 20:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240263.1541706; Tue, 24 Feb 2026 20:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuyin-0001uE-AS; Tue, 24 Feb 2026 20:09:29 +0000
Received: by outflank-mailman (input) for mailman id 1240263;
 Tue, 24 Feb 2026 20:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuyim-0001u8-5j
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 20:09:28 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a90c3d-11bc-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 21:09:27 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB7016.namprd03.prod.outlook.com (2603:10b6:8:43::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 20:09:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:09:22 +0000
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
X-Inumbo-ID: b7a90c3d-11bc-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUT6zptSmrJ0qsc4qS1UT6NNp8cFcPeW/qkIMElQskriU8+51SGf8q3hR9Dg2R/9OYrbN2ieh6LfjfUCppFT2INtFv3QcJlQv2IuuXFGRRPEXigXqF70/inrEApeNL9Mwir0h1p700O0TOUswd9Cc0G6s+j2UAXcGhW3wTv9MY/dtzrycRt50DIf5pxYSAVOugdXedicxSYGEApgTrMsk2d2mh0mYx8HCov6kqE5wWaifZMSJMVan4xRh6w3AeEMoMAy8LEgmKLx5Vf7b6vOcRgdgH6ABwrM50UV55gn+McIsRiNPNHOtR52IjTUXQ9GnFp5VIqYcE76sjovfGnjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJa/HdC4Kas9p2+hCTJKxBWMalwg8ZXGBwrBt1brkig=;
 b=q+FRhmUqxP+1AtYHUdETmuga/I8qir9m48W6iHG+Cy5ODhHn8ShZOdCFnuR45FZ4zdg5afm8zCUzyP3RUjv4/W/EPrF3DW8XMQZagSrRXGDvekA8ZcBwdmgILDLRf73TSPoPD2F1nwpm9bMHdF2XFZ0wdnAAm0e5LiGxtNY/TjGLJ1/PNgRkZdtNhnxoRGRLlTCHvs4ThxGv0YIKirB8viBlB3FTkEmRK1QzWgwpbcEK9MKvEudJLWuzZsIhVi/gw43esE3UZex5nrkWb+e7noT5Jzuxmm1SB5EMxGUNX75LdPpHqKh0f2KHH4hgZzhyKkY2QHoykR2ecAmZBxkO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJa/HdC4Kas9p2+hCTJKxBWMalwg8ZXGBwrBt1brkig=;
 b=GkAHKvKPr0iQZqUPFgWLWIEYyIgW1ufueKykINDl/Sllan6ljUfbBqT9XApSV/TffnCCIw6K1afm5EExIBFIqNK5prFfUAaicrEi4DChAI6t/ICooVBXvgKltZOZPr39z6R1RpT7PxaH+kNzgcR9wZqXYra67drqwlJU48FMoaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/efi: remove unreachable efi_halt_system() function
Date: Tue, 24 Feb 2026 21:07:08 +0100
Message-ID: <20260224200708.51120-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 74663bf2-e839-49b7-bd46-08de73e09967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEpDVEVNdUE3WXhtWExrN2ovQk1YM2Z2eXdIY0xLbE5MZUxKSTlxUCt6RjE2?=
 =?utf-8?B?eUN2eFJLazI1bmhyZjkwTVovZ2Nxci9VTEQ1TUd5UlcwME1GNlZXbEYzdUZ1?=
 =?utf-8?B?aUtyTms3ajFQckRXMTE2anZud2YyTlExVXBSK2gyejZ6R2ZDTk5Wam5Rbkpy?=
 =?utf-8?B?Zkl6TjNZV0dwYS8wQjlLWnovVUtWSnRuVVRrK0toVUhVRVJacVQyTjhzRzBD?=
 =?utf-8?B?b1R6VlBtbTlTdjJGVjBLeEJ1dDVxVUQ2QUY2Yjc0SVlBc1p5V2JUQkdUMElT?=
 =?utf-8?B?U0lCc3BQRVd1MW02dks1UzF6ZFB6S2F6YWJkZ1FSczhOTmErRHh6bis4eVpT?=
 =?utf-8?B?dFUvSTJTU0J3YXJhUjdYeWJRU1IvV0lLTTNCVkg1dndlMVFUV2VRenBMZ0F4?=
 =?utf-8?B?aFpKb1ArSmgrK2VYS3lwWGRuNWtPQUxVMFN1YXVpYjBrakxmSEY1d1FydG9F?=
 =?utf-8?B?R1lHVUV3M1d5eE5TOFcrLy9SL2JBdnF2NkZQWWxXUEF5UVVxTjk5Z0lGanU0?=
 =?utf-8?B?eS9oNFkrWXJldC9BeWdpM0FkdC9ic3NpV0gxMWg3QnFhMEdmSXdKRlRlOVhH?=
 =?utf-8?B?am52T0QxVUF5cllRRHl6Zit0MGNjVFF0WUltcTlsUkw4d3M2QVhlcXR5VlZY?=
 =?utf-8?B?MkUyL3F5M1R6d1ZQZ3ppeXJOdktBOUpJQ3hOb2JhM3lPMExSbWRxUERzbjNW?=
 =?utf-8?B?OFd3Yys1UEk3UThmWDY2R1VDMWw2V1VoVk9MaHU5WnJIVitkeXpGdUUrUVNj?=
 =?utf-8?B?NkxWajd4Mzh5ZmRvSXgvV25TL0RZaEQvcEFjU0lHQUI3eloySUE0QllPVXFT?=
 =?utf-8?B?Q2dvUjhKTzQ4M2h0ZFN4OGdiVE4zWnBXVi85NWhWN3JHekZsN3M5U2RKbzJW?=
 =?utf-8?B?N2Qvam85VjhiZmlLSUlQUGpCVU96Si8zY3gvcDNJczlBWE16NjNBelFHRFY4?=
 =?utf-8?B?UVVZRVNJTVN1ekZzRUtRaG5aQllLVmFWRmJDVldmalNpMDhTdkh4QXpVZUxu?=
 =?utf-8?B?dXhBdGJOcURZVTBuYW1xdTNWVFNBNlJBVEtJTnhFbEpSd1E4VFp3Z2M3RUR0?=
 =?utf-8?B?bUZCRXQ0eHJQbWFEajlKTStNZWJMVWQ2Y3JDMDRXbzEyNGFrWlRJSTFtS0hL?=
 =?utf-8?B?ZkFiRUxHdlYxQVBRbTNSREprSDlPNzIxbHM2OXlqLzhtQ1htZndDQ2x1ZEhw?=
 =?utf-8?B?by9qWnYzclpBcEgvb3RIVlZ4Qkp2K1ZuMzF0UC9aeS9YcytjWUdlejRhSi9z?=
 =?utf-8?B?dWxxU2lOZDhVK2ZnQUlnWmJtYTIxcFRPR3JMVCt0bThqbWhLV01QRzZVeVg3?=
 =?utf-8?B?aWVQTHMvS2dmcFpqdlZMc2pLZnQrSkJvSHhVVTdEWkhxdDZZdnltT0FGSmoz?=
 =?utf-8?B?eHI2b09UZlo2L0JZVTJuaE9iRjdaTUIyT015TlpqamZFWWlVbm5TVW5Ebjlz?=
 =?utf-8?B?OFRtS1BzTSszamkvOUI4d3R3a2dNb1VEaURZNXFqSE5sNldoaVN0c050dXdx?=
 =?utf-8?B?OUlLWmF2WWpxZUk3YmtoQ2FLdnNzSXM4WHU3bzV0a2RxbzdxcXdQZ2dlWndn?=
 =?utf-8?B?TXBrTm9TMmk5Y01BZ2JxZzdxaUYrZFYydEdxQ3JOTHJSNE45dEFnNGJjVkg2?=
 =?utf-8?B?UUY1eGh5aW5WcGxWcnNSc04rVmFSNjQ2TGdKRXVLbS9SZXBYeVNWeGNPbXZ0?=
 =?utf-8?B?NlhiZnUvY3pFTEx3S1VRNis1VStUS3BOeTZ0RElhWTZNZEdrbVZhWFJtSVJB?=
 =?utf-8?B?Ymh3S1VpbHNPSzFJUS9QOGlGQUJsOTM4UG5uL0E0QktHVE5zY1BYM3VMdXpW?=
 =?utf-8?B?QmFkZEtibE9LUlhvNHptQVk4dXo2Nm05Nm1nRytjV0FhdjZXVGhBRTJNcDAz?=
 =?utf-8?B?Z0E2amxxbk5hTy9zSXExNCthcXFrNTh5QitKeDdTUk5RdkJ2c2tXVnpwUlFM?=
 =?utf-8?B?MW5yaGRhVXQ2czRPLzJKa2lZaWp2RE5hRVQzYW4vZForeEc1NjJTU0kvQVRD?=
 =?utf-8?B?c3dHczJxT0FyQTNsa3paNHdqYm5rV0JhSzZaNmJYUDh6QnRWUVlEY1B4bjZ1?=
 =?utf-8?B?RTdlOGRvUGZLcG5DNitjRld0dktHbC9RTFFMMUNXQnNVYy8vRE9IR3pWTUtl?=
 =?utf-8?Q?JXY4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0V0NWx3UVdTdkZLcGFVaUkrSzQza3IxU2JRVmpGREd2MllUamh1bFlHeXha?=
 =?utf-8?B?ZG5FODB5UldQcDdvZk5HbHFnWTNhdmNpQzUramVlRWxzM2Z2OG5oU2llY3Vw?=
 =?utf-8?B?MzdJOGZPRDlFRHErWG5oZHR1Wk9QY0grdWhuTzFGZzlleTA2STVLbGVoazBC?=
 =?utf-8?B?SERUckcrL1VLLzBzVWVtdGE4MmQ3ajNjZlBNQlZVM0wzYnJWY1Z3M1V2bEJv?=
 =?utf-8?B?aEwzaDNxK0JKa2dUaFJHZzZXVEZiR3dVWDlPWlh0cGR4aU9wZ3lsbHZ0UnY2?=
 =?utf-8?B?MzQvN0V1Y1Znb0hKb1dNclYvNVFseiszMitPVS9zODZiVTF3djBHYlIvYzIr?=
 =?utf-8?B?dUxmUXMzVC9qVnZ3NU1ZOFNCOHcrdDREaW1CcGtoSDQyNzdGRlgyVmxaeEdZ?=
 =?utf-8?B?MzlWR2dma1QxWmhuWXE4WXBOUUFTTGlIc0ZOSkhha1pkL2FzcHNtZDlYYUxL?=
 =?utf-8?B?T1RSNFpQKzBaZ1NYT0lZZkFyRVJJODNCNnhncW5ZT29vUUJ0WjZQNXdoRU80?=
 =?utf-8?B?NVk2ZzNFV2dwWjZUL3M5U2xuc1FwM0dnbmhLcWdScmo0MHJuVTJkb0FLWE5k?=
 =?utf-8?B?NjB1Yk8wQ2ozZlFqV0Iyd0drU0pNTzNjQ20wTU14S2tLM3lYR2lKaWhQV0ZI?=
 =?utf-8?B?eDZqR0lLZldoQ1pKZHR6ZjZ1SHhTNDV1dTBveFcreXdFbHl6NUJpek1vNlg4?=
 =?utf-8?B?N2dEbkxBS2FiUWhldm5DaGRIcFdVMkw2eUxWSE0rU01DdFE1MHZGc1BoQ0pJ?=
 =?utf-8?B?NndLdjJBYWtONCtMUDdyd3pIcVVMbWRoT0tCNzhQcGk5NU95d05GQXh2M0xO?=
 =?utf-8?B?OWdHNjRjWFhuMkJwL2d3OGMxRlRJRlhUcHFMZ25tNmtUQVlFWk5mSm1XaVZX?=
 =?utf-8?B?RG8xRU5UTUxVNHV6ZURncUVUNnNod2lUNVFyNkNiaG1PcGdxOHZBdE92aXAr?=
 =?utf-8?B?R3E4V0VSWVdqL2wwT2piYUN5SVVzK2N5VllWZ1VYaUZzaW9aVGUxb0RmR1B4?=
 =?utf-8?B?RnpybXh4VVVKOTN6VmhsYjNLUW9FOHdYTDNuc3h5THRQc0xwUWEreExWV05z?=
 =?utf-8?B?OCt3NEs4TTB5Nk1iUi9PV1dxZElrOFUvdnhaeURrM1lTaGhsV3NjN2xhSUpn?=
 =?utf-8?B?RitmTkllbCtFSi85SlZHNXJBREFJV0JzZXgrZVJ0MDJIdTNzaDlQa1VZQXor?=
 =?utf-8?B?VUlvL2cvOVNvV1VETUNiRG1Wb2liZVliNk91VDRWbkNidndrbGwvenNJYS96?=
 =?utf-8?B?clFBYkpwVXN3OEk4R1JlaTAzbGdPZ2hnRzZRSDZiSGcwN1hoY2JZSG8rbzZy?=
 =?utf-8?B?eHdLbGpFSi9FV2dhMkNjNVdHcGZoTnVNeFA3Ulo0T0JGTFI0ZFdId2lTUmFw?=
 =?utf-8?B?L2NnVHBDdXVKTHpKQVNzeXltWVhZK04yNmVEYThyaWVlaVRmclMxT0FSaW4z?=
 =?utf-8?B?cHJRZndoa3lEdjNzTXA1YzROSFAzME5SeWczQWdIMndPaGpJTHpBOUlTOTZj?=
 =?utf-8?B?a1lGck56ZGdKMTFBbnRBMzg2dlhZaXNGWS91QjY5U0tUZDI3SU9RbFVVaGpC?=
 =?utf-8?B?b2VJcXNLM0NxclJRc2pKTHhid29rZmF2QXdlWFZHQnBJQzNZSmZaY1ZxeEpT?=
 =?utf-8?B?c1I1eTY1VEpiWE5BVzhZbmthNUxmbzFDUnh4eUh6clhjN1RoNDlHSnFZWjlu?=
 =?utf-8?B?cFJGNFFsUnh6YlVPOEMrUm9Uc1VRWVNXRUhYVCtzTDhJNUhKM3JJLzRTUkwx?=
 =?utf-8?B?YWFCZ0FEWHVwNGYxeFE5dEpuOW40UzBnQlZWb1hyTmRuUTBNZ21rRHcxUnlH?=
 =?utf-8?B?MFIrcDh2eTViN25MWTJWVk9rTDhLUDkyRmY0MUFUY0ZkR2ZlQ0xsSG41VVNQ?=
 =?utf-8?B?eFRZZms2bStCbmVYS2xnbXJyT1Z1K00yTW4wZHdzUElGbVduRE9yWkZyNDBE?=
 =?utf-8?B?eE10N251eklDMmw1ZFRnVnBkMlZ3T3EwYTlLOXdocitOOVZOTmRLVFd5SGNs?=
 =?utf-8?B?ckFlZStJVGtUYWdFcGdpSlNNWFR6cmJsNkRiOXNtaFpZU0pmNnRNcDErTlFO?=
 =?utf-8?B?ZXZZdVBYdXJDY2tIMHBjY0pUaWdMNmk3MTNORGNPSGZiTWoweklNRzNYelYw?=
 =?utf-8?B?YkN2Tzk4Qm9vblZXV1FiSWVoYi94WG5aWThPTzVqN3kybnRMa2VqbTJpWWlr?=
 =?utf-8?B?Q1ZoVkFNM0RqTWh2RTNRVytjL1VoVGcrREI0QUhmc25xNDJzbktzQlM3dUtK?=
 =?utf-8?B?SzRsdmNZUXczWU9pUWpRRE1zRUJIck05RjBkUmQvMUNROWdLcGt6VDZzTndM?=
 =?utf-8?B?OHIrek1iNGVNZC9ZZUlkSzhJL0Nkd1JFOWhBbEZDTklpamwrakhKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74663bf2-e839-49b7-bd46-08de73e09967
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:09:21.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGW+jxANJviYjGTzj6NnE1nauLYWHlPcm/5ZbbgHuBvWUzUYd/LbeYvj0xKrvTTPCPx/5l8NUym2SJwyH3/jzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 29A6E18C493
X-Rspamd-Action: no action

After e4c3755d4dd7 the function efi_halt_system() is unreachable, remove it
from the file.

No functional change expected, as the function is not called.

Fixes: e4c3755d4dd7 ("x86-64/EFI: don't call EfiResetSystem() from machine_halt()")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/efi/common-stub.c |  1 -
 xen/common/efi/runtime.c     | 13 -------------
 xen/include/xen/efi.h        |  1 -
 3 files changed, 15 deletions(-)

diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
index 77f138a6c574..9dc8aa538cc1 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -18,7 +18,6 @@ unsigned long efi_get_time(void)
     return 0;
 }
 
-void efi_halt_system(void) { }
 void efi_reset_system(bool warm) { }
 
 int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index f786ceb00763..ba27c62132d2 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -188,19 +188,6 @@ unsigned long efi_get_time(void)
                   time.Hour, time.Minute, time.Second);
 }
 
-void efi_halt_system(void)
-{
-    EFI_STATUS status;
-    struct efi_rs_state state = efi_rs_enter();
-
-    if ( !state.cr3 )
-        return;
-    status = efi_rs->ResetSystem(EfiResetShutdown, EFI_SUCCESS, 0, NULL);
-    efi_rs_leave(&state);
-
-    printk(XENLOG_WARNING "EFI: could not halt system (%#lx)\n", status);
-}
-
 void efi_reset_system(bool warm)
 {
     EFI_STATUS status;
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 723cb8085270..2e36b01e205b 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -42,7 +42,6 @@ void efi_init_memory(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
 unsigned long efi_get_time(void);
-void efi_halt_system(void);
 void efi_reset_system(bool warm);
 #ifndef COMPAT
 int efi_get_info(uint32_t idx, union xenpf_efi_info *info);
-- 
2.51.0


