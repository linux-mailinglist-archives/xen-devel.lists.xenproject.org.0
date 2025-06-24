Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67FAE5FDA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023435.1399427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzKV-0001hU-J0; Tue, 24 Jun 2025 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023435.1399427; Tue, 24 Jun 2025 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzKV-0001fR-FF; Tue, 24 Jun 2025 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1023435;
 Tue, 24 Jun 2025 08:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMwc=ZH=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uTzKU-0001dI-B0
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:48:34 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 024e4af6-50d8-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:48:33 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GVXPR03MB8404.eurprd03.prod.outlook.com (2603:10a6:150:6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 08:48:30 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:48:30 +0000
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
X-Inumbo-ID: 024e4af6-50d8-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOzMihWDDhmCqO4GlQ+/iWoyUQSMir0MkS8br2WmODrfXpXjcY/gj51NgL42gqlDHmDWfPuYcqSbihkD3XOJmMy6kZmKvzeGLZ8NLkzYb2CS4kykEfB90wnklCNtZSR2JmvZXs3Ty8WsG2Lw7pIk+lx9LeXeFobmbcWdO+PCWxG1tDkF7E9V70+Dc0B9/9TFbOdA/P3lsQ5kHae75zpfZghKmlk2TAjXXOZICCJ6lA3s4eakZ3Ia4HmrFFZzeGtCTQuzPJJ9vre8ZiZkrAgtpxbxRsitCYrSXpqxlV4fQz1onFwr+EK488GQs2J3UqheMGdkXeWf4jojOW0RQ/uB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taSQdpx+IBaxZR1DgnuNIvUAec8NTTp4wATXlmgziBw=;
 b=lsybjOaHqbyIDbzWDTGL9qCUioLUvweLv8zIuCu6sUK9bOxv0Q6XZ6PO5pojMOo1EjHnqsatWQXWkKxDWsXmPo0UwaevZ/GBDxr5Zn8BrsvpEhMAmXYw6+z2LMExmhC7RQF7bDzv2GAyJxzGS8v1kGTqUS0s+FXHVm4YqlirV54TWaCGMg5LQjWqq/o+Lrw6teU5wdQTpdjdinO2XkyTmFJSgL6dryHOXeDov/7E5gA7ZyneOch4oZJgZ/RTKt84mTEp5L9g+p8OyaVNNIsOMX6MiMx45CRfXx6zY8XYl1Dcu9CMBu2fnhTrQA4HW3m0tC3OjQgW9p+T2hthWAlSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taSQdpx+IBaxZR1DgnuNIvUAec8NTTp4wATXlmgziBw=;
 b=UzjF4+dVqQr6LJ0scUI/8Xrbg4Mh44fCYBSDWKY59SL4PtNzi7JbocopZ0itr8GfkubFPZd6adkzh2ni+RyFTGlC/c2ewEAgR2U9pESzQVMnQwMzXGvFE3yqPMe26LgAQ2TzubXT/TgBhGvI8x6PbfhFYuxdCF4dujJHCRy3DDs6Q6tc5yU86wbfxzcoXOGz0QsygPrRndds6ihn6x3t0rPtuo2XYFDo+5THaEcuN+io0FKJVeJJged9PyglJd3JpOfJb7rY3qVKzcn24XXP3LR6Roa0yhho8/Lcb/yW0LYai7Br579IzqDNnkUHh1qo0e7CSGctqKaJB9ozajdDgg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAUPLACAAk4fgIAAATaAgAAAWoA=
Date: Tue, 24 Jun 2025 08:48:29 +0000
Message-ID: <fd05ec49-6b5c-45cc-a216-be7b412910ab@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <alpine.DEB.2.22.394.2506221428420.8066@ubuntu-linux-20-04-desktop>
 <4b69568b-3b21-4426-b78a-222ca11632e4@epam.com>
 <033988d2-5b4f-4182-b26e-f860e740cb4a@suse.com>
In-Reply-To: <033988d2-5b4f-4182-b26e-f860e740cb4a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GVXPR03MB8404:EE_
x-ms-office365-filtering-correlation-id: 7a25519d-059e-4bdf-2544-08ddb2fbe4ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzBPNkpGRnliY1dZM1FWQ21jUUxWbllUWFIvbU9XOGxOTG9XVXM3dmI1a1Js?=
 =?utf-8?B?a2VIdkYwWldaTmFtaTZJTnV2bXo3SytrQU9tSHUvMVZoV0J0citkSnA1UzlE?=
 =?utf-8?B?TC9YQWNjUkh1S2FvNDVqQ25wZE5aR0xCODZXbjNNRFZSVFBMNVBhR3FRZDFo?=
 =?utf-8?B?SEkrbFpVci9ncHhGQlB2SmRWZ2E5RThSRzF3ZS9NNFpmcStqRzZhK0J0eFZz?=
 =?utf-8?B?ZnlTdE03djczTGFOWVFKcGRPMnI2aGRUMllEQWFNMTBkNnh1N2RaMi9CWXFF?=
 =?utf-8?B?QWxRcGJjS2krVFBqZm9QOTVHREppMzRXOGJtU0dzWVF1aWxYUnRod0RWNjJ4?=
 =?utf-8?B?cW5jcm5zWXgvYmozNU4rd0FzUlhNUHZEaDVsWVMzR0hieHVwUC9LcElFc2d6?=
 =?utf-8?B?Y0VtaUY0NGk0aXZ4WVIwaXkvL3NvT0dOU1lmUjRXclV6dUpmMVhTSjZhYjlj?=
 =?utf-8?B?K0tnQjVzcXlLdW02eGR2cGVGTS9UOGJpbUEwTW1FdVFSMGVCUlRvRXpGc0xm?=
 =?utf-8?B?VmNQM29qanJxYzJ0OU04RTYxVm5uZm5HZ3FYbFFrUVh0Q1NaM2dCM25TUFFW?=
 =?utf-8?B?cWt2RTZYRk9GcHJ0c0grbVM3d1pvcWdPNUNXVE9NenF6QVZwZyt0N3BwaHo5?=
 =?utf-8?B?ckNrQlFKMTdkamQxMzVYa0JNTVBxK01XRDBkM0tnbWpLNTN5REtoM256WHJi?=
 =?utf-8?B?Uy8yQmpzVGc0YXFDT3hEUW1YOW53TC9iUzhGMWxqNk5HU2ZYKzEvYkZVMUxH?=
 =?utf-8?B?aUw3L2tsd3M0ZTdkdUZFekpPZy9nVmwyQXJGTUFnMlJGNjI2V1ExZURLSmhU?=
 =?utf-8?B?bkpqdjJVeE1xSzhYRmNWUlVxYkpZdWswZ2hodnhMb0hwTmFNam8xdEpvNFBD?=
 =?utf-8?B?Mm04UEZGTVVRdHhJdjZBSjJ3VjNOSzBYSEFOY1pPMmJvakZjRmF1eXc2ek5j?=
 =?utf-8?B?TzY5MUFCTjR6ME5BZm5mbGNHV3V6OVh4anRZdEJjZDcxck9JN2NYenEzbi9X?=
 =?utf-8?B?OGR1VEJHbVZVSjkwS1QwcVRPUlpUd3V1bGphb0J0UzI4NGQ4RVNIQWJpeTQ1?=
 =?utf-8?B?UEQ0KzA2dkY1RVhLSXp2UmNuRkVwRGVUUGw3MW5jcWp0OHkzNzVLVjFrclhR?=
 =?utf-8?B?dE5NeDd6a3ZDaGFFL0RrL2NDVnRGaFNOaWprOGQzaWpNY3NjejE1VyticFlR?=
 =?utf-8?B?KzgrTmR4K2NrdUV1TkpkS3dOMVN3QmZhSXZyN1F0eEJpNDNiSVhvbFQxMDFa?=
 =?utf-8?B?WG1sYkQ0bXR6VW9VMkJDck5ZNjNJNlhhQzRvaWZxcW5IU3pSMmFEMnN4ZmdR?=
 =?utf-8?B?ZXNROEhZeTNPU3BWZGF1enZrbldxc01EL3kralgzNHlLL2w4K015Ui9FQmtE?=
 =?utf-8?B?Y0ppUm85RjViTDRobXg4a0F6cGVjM2tWY29QNnRzaHd0VlUxZkNlTVdHZ216?=
 =?utf-8?B?MUVmT2g3OG1ZWU1RTmpraGsrWHY1dGVYVW9pcWdHUCtSUXNxQS9ZZ25oR2VQ?=
 =?utf-8?B?MFZ1eU5maWJwcXFkei8xYWtFcWFSaVNYUU11VW5MSzZZMy9lSWVlM3pNOUNz?=
 =?utf-8?B?U3phNUFpVW1obC91WDREc2UvSTZ1Vm1ML2toUkI0MnBhUmYydUJmZEZQREtL?=
 =?utf-8?B?WVEyWmJOTCswMW93WDVYU24zTDFuWTNtU2wwK1hKMlNzeXJRT3Y1UDBiRUZE?=
 =?utf-8?B?WFZ2MXNoUUthKzcwMXVmZG1pT0w2a0daWWk2ZUZnZGxsMFBsT2ozSkJnQy9J?=
 =?utf-8?B?ZFhYYnIrUFlkQlJhUENqdHB5ZGZqeGVxakxvYXdXZUFJN2lHYUlvZjRiVWw4?=
 =?utf-8?B?eThoMXVyWHRCdnF3REtDZ3hKMXRwYkdBRVd5TEIwNmhJZ2VBL28zTUdlcFR3?=
 =?utf-8?B?QTVMcXoySWVOc3lYZFM3QUxxMmNEVmFteERKbmJYR0w0Z1ZEdlBmaDIzT0VN?=
 =?utf-8?B?eDQvalFyU0pxQUI5UXdlZnNpVkJ5dzh2OER2SVpMRXJwVXlHcWNQaHIyTDdu?=
 =?utf-8?B?cisyNDRHTHlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHlNZCs3cmdmK0wxRUp6UlpHRjhvbDlDdG5JQ3Q0Mm51U1BKc096NDNBdW5J?=
 =?utf-8?B?bVR1OGpVVURVbVVNcStIVElYZ2I4QzgwRjJaRTdUYkMrN2pZWmN5Nm9QMG9B?=
 =?utf-8?B?UHNNMkpEbStwM2FCWnpHV0ZoVktTbG1EQjdKbXlXRXRhcE1HMlVodWZrV2pJ?=
 =?utf-8?B?c0pvVE91Zit6ZW9wZXNkTUNNY0ZLRlI5bFpWVXFrbU4vNjVCVUxmUmQwRXpQ?=
 =?utf-8?B?NUMzVUdvZkdnSk81Wm9rZythN1BXWnVBYVVoYm0xUFRQaWpjR0hndWprNVhT?=
 =?utf-8?B?V01oZFdrRVA3dW1sUDNhdEZ0Z0YxcUlKQ2F2ZlNJekFMWk9oTk1KN2x0MmM1?=
 =?utf-8?B?a1l2ckF5Rm4xSjdtVHpURjJ4MkVmbjVJc2lZbzlCTlVrZU5hTTJZQnR3RG1Y?=
 =?utf-8?B?SHdlZWhZbkQ1VEwwemRuWkhvamJKY1ZaNWVDWXM1WmJpTHNiRHg2cU5xbXdK?=
 =?utf-8?B?bkgvKzlYNExUVmsvYzFlbkxNSi83WThPUUdtMWk4d21kRkFtZHdYVnEwSmpy?=
 =?utf-8?B?UndVbHUvbHBSNy9seE9EVmJsYm9FRjFiRXJsM3RqNHNrdlF2SUl0WlQ3MU5U?=
 =?utf-8?B?RmJZektNVUZhcGs0OFMyNGl3WWttVjZVQjN4citQbVIxT3FHK2ZVaWEzS3lX?=
 =?utf-8?B?dUtyYmxoQldtNmxEbDJObWIwUWJhVkE5L244cWM5cTZvR0pBdElMTkVSQjRy?=
 =?utf-8?B?YzQvd0dtdlhvTVZJbnRPRHlKcjJ4d016UnhxZnE1eGtlUlpIZnh3SlhNbHk5?=
 =?utf-8?B?ckxZd3J3ZjJIL256bEtXR1RtcjRBN1hyY3I5QU5JWVNqRWwvcGZtNFNCcVIr?=
 =?utf-8?B?MEt1UU85eVM5THAxR2xFcEdvRzlFTFNhYmUrRDQrR00zdVh3K2NpY0lmekx6?=
 =?utf-8?B?czlka1I4WWJ4RUtLTE9JRkF0TWJkSXV3ZGpVZ2pjOFhpRW1PaTVNT0Rad2lt?=
 =?utf-8?B?TjM5cGRrdlFrMklJdFZXTjByM3BTMlRsOGxCeEJmRTVzbElveGJaaFZ5bzN0?=
 =?utf-8?B?RkVXWG5ORjlHSjAxNjlTdzJESVdDRGw2eHlYbVgzcy94NFVvc3d0UTdxU2dt?=
 =?utf-8?B?M2tJQ3Bza2lWb0VuNk04cWV6TnRZa3gyWlUyeWFycmJGUW52ejNCbzNHR1FT?=
 =?utf-8?B?c3J4TlNuODIxZzVSZmZ4ZXFndEhsVE5ZeisyUlR4MGJzaXZBYVkxTm9VQzNw?=
 =?utf-8?B?OXFqc1YzbW5nNlVDL29DdUhncUtBT2p3SHJnKzc3MENta08rT0t4VjBQMjVn?=
 =?utf-8?B?elQ5M3VBdUg4dmdqejJraU1Ua2llMEZHS0piSVhUbnVBRVNUREMxUTUzaDRG?=
 =?utf-8?B?anpHMm1yREpSSVNEZlYvTzBaSXoxbFd3VnczRTFIRFRGTHBiRzE1WlZIa1R1?=
 =?utf-8?B?dVd6VFhtbWFobkh5bHJPVUQrdlYzOUdlY0RJVm1hM3kzN1lnMm5OTkozZ2tj?=
 =?utf-8?B?bWVyaFR2elEzZjlZUUNQWHZHS1NHNE5mQmdVeUY2K05vYmQ2QktaVDc4bWMw?=
 =?utf-8?B?R0NOamthSUVIR2tvbkVVMGd1U2F3UEpQTVRXM2hCK3VybHQ2QTNBNlYzeXg1?=
 =?utf-8?B?Sm1ZYWdQaE1MZHBRMituZUZKR3g3U280Z3FIamdydlNrUFNDd1ZKd0dyOGc5?=
 =?utf-8?B?Q0Zreis2ZnNxemlWQjMwQ0Z4SmlxY0RqckVjNEt3TFhBMkc4VHZPcG53Z0My?=
 =?utf-8?B?ZjRJZGY1UHA1MWc4b2JtTklPMEtacGZidmFyYkJaUWNGZUkrTytaYzRHd243?=
 =?utf-8?B?bG9DWCtpaEJrVGw2ejIwT0lSWUhPM1lIV0Z0NzczOFJDcDJpNHR0anMzeEVa?=
 =?utf-8?B?ZlM2d1RIRjZ6K2ovQ2ZCeWZnUjV4M09uVERjWmVUUmhzR0VKRUFnS0hGRFJR?=
 =?utf-8?B?Q1NweWRWSkVKeVp1UkhFSUFvR25od1c4ZDNwUWVDZjdsYnRLVnVERTJGOGJv?=
 =?utf-8?B?cEJyLzlqelNrWXV1cndWUERjVGhKSFRyM0ZDbUtUZHlCQ0NZZ1A3T2lDZDBk?=
 =?utf-8?B?ak0yTkR6TDQ5UnE2R0k5ZnpaNGZQdTZzdHIwOEU0dFFIWXA0OTgzTzlwaGVu?=
 =?utf-8?B?eHBqVzZpWndQN1ZuZ0hkVk5vQTlyNy9Vanhnc0E1V3dOZ1ppM29xVFpLN3Vw?=
 =?utf-8?B?Mmk0ek5XUXNRUXRGUkF5Nm0zdmQvNXh4U3d6T0lEYVpsYVJGSWMwL0UrN0dD?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <268FB5296FEBE04BAC2605E7646A2F9B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a25519d-059e-4bdf-2544-08ddb2fbe4ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:48:29.8984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVt4E44Rs+IY/CmAR18u5kKg9sOC6Y+Pk9vRnV10d0UGKlk2Zs+q1Q/FlORWT7pfCUFM5Omq1vcSvcVCB2CNrfh3RqBJkm8vk209BST2xl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8404

DQpPbiAyNC8wNi8yMDI1IDExOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAy
NSAxMDo0MiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBBZGRpbmcgUm9nZXIgYW5kIEph
biB0byB0aGUgY29udmVyc2F0aW9uLg0KPj4NCj4+IFBsZWFzZSBzZWUgYmVsb3cuDQo+IFdoeSBp
cyB0aGlzPyBJIGRpZCBhbnN3ZXIgdGhhdCBxdWVzdGlvbiBhdCB0aGUgYm90dG9tIGFscmVhZHku
DQo+DQo+IEphbg0KT2ggc29ycnksIG1pc3NlZCB0aGlzIGVtYWlsLi4NCj4+IE9uIDIzLzA2LzIw
MjUgMDA6MzAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBUaHUsIDE5IEp1biAy
MDI1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gT24gMTgvMDYvMjAyNSAwMzowNCwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCAxMiBKdW4gMjAyNSwgT2xl
a3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+Pj4gSGkgU3RlZmFubywNCj4+Pj4+Pg0KPj4+Pj4+
IEknbSB2ZXJ5IHNvcnJ5IGZvciBhIGxvbmcgc2lsZW5jZS4gUGxlYXNlIHNlZSBteSBhbnN3ZXJz
IGJlbG93Og0KPj4+Pj4+DQo+Pj4+Pj4gT24gMjIvMDUvMjAyNSAwMzoyNSwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4+Pj4+PiBPbiBNb24sIDE5IE1heSAyMDI1LCBPbGVrc2lpIE1vaXNp
ZWlldiB3cm90ZToNCj4+Pj4+Pj4+IEZyb206IEdyeWdvcmlpIFN0cmFzaGtvPGdyeWdvcmlpX3N0
cmFzaGtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFkZCBjaGFpbmVkIGhhbmRsaW5n
IG9mIGFzc2lnbmVkIERUIGRldmljZXMgdG8gc3VwcG9ydCBhY2Nlc3MtY29udHJvbGxlcg0KPj4+
Pj4+Pj4gZnVuY3Rpb25hbGl0eSB0aHJvdWdoIFNDSSBmcmFtZXdvcmssIHNvIERUIGRldmljZSBh
c3NpZ24gcmVxdWVzdCBjYW4gYmUNCj4+Pj4+Pj4+IHBhc3NlZCB0byBGVyBmb3IgcHJvY2Vzc2lu
ZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHJlcXVlc3RlZCBkZXZpY2UNCj4+Pj4+Pj4+IChm
b3IgZXhhbXBsZSwgZGV2aWNlIHBvd2VyIG1hbmFnZW1lbnQgdGhyb3VnaCBGVyBpbnRlcmZhY2Ug
bGlrZSBTQ01JKS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGUgU0NJIGFjY2Vzcy1jb250cm9sbGVy
IERUIGRldmljZSBwcm9jZXNzaW5nIGlzIGNoYWluZWQgYWZ0ZXIgSU9NTVUNCj4+Pj4+Pj4+IHBy
b2Nlc3NpbmcgYW5kIGV4cGVjdGVkIHRvIGJlIGV4ZWN1dGVkIGZvciBhbnkgRFQgZGV2aWNlIHJl
Z2FyZGxlc3Mgb2YgaXRzDQo+Pj4+Pj4+PiBwcm90ZWN0aW9uIGJ5IElPTU1VIChvciBpZiBJT01N
VSBpcyBkaXNhYmxlZCkuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyBhbGxvd3MgdG8gcGFzcyBu
b3Qgb25seSBJT01NVSBwcm90ZWN0ZWQgRFQgZGV2aWNlIHRocm91Z2gNCj4+Pj4+Pj4+IHhsLmNm
ZzoiZHRkZXYiIHByb3BlcnR5IGZvciBwcm9jZXNzaW5nOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGR0
ZGV2ID0gWw0KPj4+Pj4+Pj4gICAgICAgICAiL3NvYy92aWRlb0BlNmVmMDAwMCIsIDwtIElPTU1V
IHByb3RlY3RlZCBkZXZpY2UNCj4+Pj4+Pj4+ICAgICAgICAgIi9zb2MvaTJjQGU2NTA4MDAwIiwg
PC0gbm90IElPTU1VIHByb3RlY3RlZCBkZXZpY2UNCj4+Pj4+Pj4+IF0NCj4+Pj4+Pj4+DQo+Pj4+
Pj4+PiBUaGUgY2hhbmdlIGlzIGRvbmUgaW4gdHdvIHBhcnRzOg0KPj4+Pj4+Pj4gMSkgdXBkYXRl
IGlvbW11X2RvX2R0X2RvbWN0bCgpIHRvIGNoZWNrIGZvciBkdF9kZXZpY2VfaXNfcHJvdGVjdGVk
KCkgYW5kDQo+Pj4+Pj4+PiBub3QgZmFpbCBpZiBEVCBkZXZpY2UgaXMgbm90IHByb3RlY3RlZCBi
eSBJT01NVQ0KPj4+Pj4+Pj4gMikgYWRkIGNoYWluZWQgY2FsbCB0byBzY2lfZG9fZG9tY3RsKCkg
aW4gZG9fZG9tY3RsKCkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHcnlnb3Jp
aSBTdHJhc2hrbzxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2PG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPj4+
Pj4+Pj4gLS0tDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgIHhl
bi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYyAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+Pj4+Pj4+ICAgICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13
YXJlL3NjaS5oIHwgMTQgKysrKysrKysrKw0KPj4+Pj4+Pj4gICAgICB4ZW4vY29tbW9uL2RvbWN0
bC5jICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrDQo+Pj4+Pj4+PiAgICAg
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgICB8ICA2ICsrKysNCj4+Pj4+
Pj4+ICAgICAgNCBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYyBiL3hlbi9hcmNo
L2FybS9maXJtd2FyZS9zY2kuYw0KPj4+Pj4+Pj4gaW5kZXggZTE1MjJlMTBlMi4uOGVmZDU0MWM0
ZiAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KPj4+
Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4+PiBAQCAtMTI2
LDYgKzEyNiw0MyBAQCBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYpDQo+Pj4+Pj4+PiAgICAgICAgICByZXR1cm4gMDsN
Cj4+Pj4+Pj4+ICAgICAgfQ0KPj4+Pj4+Pj4gICAgICANCj4+Pj4+Pj4+ICtpbnQgc2NpX2RvX2Rv
bWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90
KSB1X2RvbWN0bCkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAgIHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqZGV2Ow0KPj4+Pj4+Pj4gKyAgICBpbnQgcmV0ID0gMDsNCj4+Pj4+Pj4+ICsNCj4+Pj4+
Pj4+ICsgICAgc3dpdGNoICggZG9tY3RsLT5jbWQgKQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+
PiArICAgIGNhc2UgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlOg0KPj4+Pj4+Pj4gKyAgICAgICAg
cmV0ID0gLUVPUE5PVFNVUFA7DQo+Pj4+Pj4+IEFyZSB5b3Ugc3VyZSAtRU9QTk9UU1VQUCBpcyB0
aGUgcmlnaHQgZXJyb3IgY29kZSBmb3IgdGhlIDMgY2hlY2tzIGJlbG93Pw0KPj4+Pj4+IFRoZSAt
RU9QTk9UU1VQUCBjb2RlIGlzIHVzZWQgYmVjYXVzZSB0aGlzIGlzIHBhcnQgb2YgYSBjaGFpbmVk
IGNhbGwgYWZ0ZXINCj4+Pj4+PiBpb21tdV9kb19kb21jdGwsIGFzIHN0YXRlZCBpbiB4ZW4vY29t
bW9uL2RvbWN0bC5jOjg1OS4gVGhlDQo+Pj4+Pj4gWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlDQo+
Pj4+Pj4gY2FsbCBpcyBleHBlY3RlZCB0byBoYW5kbGUgYW55IERUIGRldmljZSwgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIHRoZSBEVA0KPj4+Pj4+IGRldmljZSBpcw0KPj4+Pj4+IHByb3RlY3RlZCBi
eSBhbiBJT01NVSBvciBpZiB0aGUgSU9NTVUgaXMgZGlzYWJsZWQuDQo+Pj4+Pj4gVGhlIGZvbGxv
d2luZyBjYXNlcyBhcmUgY29uc2lkZXJlZDoNCj4+Pj4+Pg0KPj4+Pj4+IDEuIElPTU1VIFByb3Rl
Y3RlZCBEZXZpY2UgKFN1Y2Nlc3MpDQo+Pj4+Pj4NCj4+Pj4+PiBJZiB0aGUgZGV2aWNlIGlzIHBy
b3RlY3RlZCBieSB0aGUgSU9NTVUgYW5kIGlvbW11X2RvX2RvbWN0bCByZXR1cm5zIDAsDQo+Pj4+
Pj4gd2UgY29udGludWUNCj4+Pj4+PiBwcm9jZXNzaW5nIHRoZSBEVCBkZXZpY2UgYnkgY2FsbGlu
ZyBzY2lfZG9fZG9tY3RsLg0KPj4+Pj4+DQo+Pj4+Pj4gMi4gSU9NTVUgRGlzYWJsZWQgKC1FT1BO
T1RTVVBQIGZyb20gaW9tbXVfZG9fZG9tY3RsKQ0KPj4+Pj4+DQo+Pj4+Pj4gSWYgaW9tbXVfZG9f
ZG9tY3RsIHJldHVybnMgLUVPUE5PVFNVUFAsIGluZGljYXRpbmcgdGhhdCB0aGUgSU9NTVUgaXMN
Cj4+Pj4+PiBkaXNhYmxlZCwNCj4+Pj4+PiB3ZSBzdGlsbCBwcm9jZWVkIHRvIGNhbGwgc2NpX2Rv
X2RvbWN0bC4NCj4+Pj4+IE9LIHRoaXMgbWFrZXMgc2Vuc2UuICBJIHRoaW5rIGl0IGlzIE9LIHRv
IGhhdmUgYSBzcGVjaWFsIGVycm9yIGNvZGUgdG8NCj4+Pj4+IHNheSAidGhlIElPTU1VIGlzIGRp
c2FibGVkIiBidXQgSSBkb24ndCBrbm93IGlmIGl0IGlzIGEgZ29vZCBpZGVhIHRvIHRyeQ0KPj4+
Pj4gdG8gdXNlIC1FT1BOT1RTVVBQIGZvciB0aGF0LiAtRU9QTk9UU1VQUCBjb3VsZCBtZWFuIGEg
aHlwZXJ2aXNvcg0KPj4+Pj4gY29uZmlndXJhdGlvbiB3aXRoIGRvbWN0bCBkaXNhYmxlZCwgZm9y
IGluc3RhbmNlLg0KPj4+Pj4NCj4+Pj4+IEl0IG1pZ2h0IGJlIHdpc2VyIHRvIHVzZSBhIGRpZmZl
cmVudCBlcnJvciBjb2RlLiBNYXliZSBFTk9FTlQ/DQo+Pj4+Pg0KPj4+PiBJIHNlZSB0aGF0IGlu
IHRoZSBmb2xsb3dpbmcgY29tbWl0Og0KPj4+Pg0KPj4+PiA3MWU2MTdhNmI4ICh1c2UgaXNfaW9t
bXVfZW5hYmxlZCgpIHdoZXJlIGFwcHJvcHJpYXRlLi4uLCAyMDE5LTA5LTE3KQ0KPj4+Pg0KPj4+
PiAtRU5PU1lTIHJldHVybiBjb2RlIHdhcyBjaGFuZ2VkIHRvIC1FT1BOT1RTVVBQIGluIGlvbW11
X2RvX2RvbWN0bC4NCj4+Pj4NCj4+Pj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoaXMgd2Fz
IGRvbmUgZnJvbSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLg0KPj4+Pg0KPj4+PiBNYXliZSB3ZSBz
aG91bGQgYWRkIGNvbW1pdCBhdXRob3I/DQo+Pj4gUm9nZXIgYW5kIEphbiBtaWdodCBrbm93

