Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9CB412D3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 05:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107744.1458019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdxz-000385-97; Wed, 03 Sep 2025 03:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107744.1458019; Wed, 03 Sep 2025 03:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdxz-00036J-6O; Wed, 03 Sep 2025 03:15:23 +0000
Received: by outflank-mailman (input) for mailman id 1107744;
 Wed, 03 Sep 2025 03:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MrA=3O=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1utdxx-0002xH-FX
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 03:15:21 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2406::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38290e29-8874-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 05:15:19 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 03:15:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Wed, 3 Sep 2025
 03:15:15 +0000
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
X-Inumbo-ID: 38290e29-8874-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUz/zQ61G/w4l3uQ+JQYpccNAd4QAWxQhxwckxIPp5ygpYOkwYMHxGJoDdXzfMllAwlbZbhWdWrG+pNIPeYkYRVktLDZyCc0BVyR47ymUci3hGCm3YJGP25YHYnxThrODTFSiCCI+BooPPAuj4B2Z1T0OBLn11zPIjqcOd3H0bi/zFj6vqzq2gvGdIsV2HRSSWwwzuxnWsct+v/8cqqXZDdAlI1b8upA5ilpwnOLJhNclLMZmBk93JQUYhIPwfcrzfoHXZiEecTbaNA3qCx+Yt8qFQVaPQiVj0nqoi7cNnD454Sw7jwWgDlPhgUxDyBqFECb5/QcboW7YXy0Vm8Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBxPuVYPBglpvWBWjpO0e8bUphfMwrIMC+BbUyvkfZY=;
 b=p0ZIT9N3Hg523/qV6XPLkJAoPwAdAX7aaIkVSngB6lnrKMbBbWHEt/e29mdFtgkjHXP8AJi0va9xiX2Mi/YCTUhk6RQB0hEeN/CjL2hr93mxNqKCbjItxEVSStev+SaxnewJ8YzguuP/wlfzpN+ZqTUQQ/AbzzVWCJMyThvKaBILAUvZptZVfs9TvrwzjHBUCS9yBvTwpyVP288SfLATQxucoNCwV0zIGW6czQfc1NRINv7vFhU0JcwfTMk6zJZZuejA+IOruelrMlIzJmCIbP3sdgn0bBIXOIRGxk8Nf7uRQeqN31VMZymI/g8ykqbtMwxEa+2Jy7qEoafoNJADpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBxPuVYPBglpvWBWjpO0e8bUphfMwrIMC+BbUyvkfZY=;
 b=q7OvqVGBA62yk+dgNiV5G2t4NUv+GqZFrDI+VFqz2z/+7iDvP59uOZlE9QwkBODZt96t9kBkF9ulpkFDA/SHJsMowIMmiSsiRnCKkjEWk3LxJHAX3kGEp8P8v/gqnBzGWLusUzWZX+6FaBnq80Y6khvEfG/QVP45Sbli7lv56Cs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 0/8] amd-cppc CPU Performance Scaling Driver
Thread-Topic: [PATCH v8 0/8] amd-cppc CPU Performance Scaling Driver
Thread-Index: AQHcGAMDd72a6pbrUkeHflfdpjpvurR3+VkAgAjYZ1A=
Date: Wed, 3 Sep 2025 03:15:15 +0000
Message-ID:
 <DM4PR12MB84510A50BD66FEE71C7C678DE101A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <a84ed680-9e19-4f35-bd9e-c3effd05ff5b@suse.com>
In-Reply-To: <a84ed680-9e19-4f35-bd9e-c3effd05ff5b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T03:14:47.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6232:EE_
x-ms-office365-filtering-correlation-id: 54c9390b-7fd7-439d-11bb-08ddea981a7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHp5UElPOXRwTkRINWFXU2pxK3FvVmd6QVd4Q1Z2WVl6SWh1RkFHckFjeE9T?=
 =?utf-8?B?bkFZUkt6TTJtYU1GVnp0V0FIQ0M3amZsdmFUL1J4L2Z0elVPcWovMFRwaDhJ?=
 =?utf-8?B?ak1xQVpxbmxUSk92VEY5bzFhMlM0VEpyem1MNDVSd0VwekUvVTNrMERuWkRl?=
 =?utf-8?B?MFJ4a2wxOE51TVpVVGlQSnhFd3I5RDc5TlJvb0JMc2lLWTNOVDVuRzFibDVq?=
 =?utf-8?B?MjNWQXUyalhyZWtFK0NrMGdDL2krS00zZE1udS9YcnVtWXNibWo0YlpEZmJj?=
 =?utf-8?B?K2NvV2dzcEV0ek85cTBqNGd6aEpBZW1EaWJmSmdEYmowY1dsKzYyQ0tMVndY?=
 =?utf-8?B?QkhFbVJHbUFTZEw0QWpPRFZpeHlEYjVtMk9VL0Zodm0wajZVZzlHWU5iKzA4?=
 =?utf-8?B?Z1pGbVJkQnFrSlM0alluM2JUU1FyN1NsTmxTWE8wV1RFY0NvV1ZwaXFnUURZ?=
 =?utf-8?B?ek05ZFdML3ZlUkNaNlJVeUh5YzRqN3Npdkp0dEl1K3h1NndxZnI3aUk0djZ5?=
 =?utf-8?B?M2s0Vmd5Ui9TM1hXWnpYTDYybStPdThWZkt0clVhYWQxcFVBTUpaRzZOOFQ2?=
 =?utf-8?B?YTFzL1RKMjFYTm5jTTVJR1dza3hXQ3d5eUZ6UkMzWTZQcnlaTFlWeWpUVStB?=
 =?utf-8?B?NVZjb0pockVYMWlqZkRVSThXVlN5ZGdJYXdya1hLTjRZZFBpWlk5bWk0YmZp?=
 =?utf-8?B?Z01ab2xtMmNsZW9VRHZjZTU5cE9Hemt6MS8ydnNLNUptdmdBYlR6M2tuYkVK?=
 =?utf-8?B?Ujl5aU5ucHRYem9qYlZFb1RJUnJ4YytFK1RWK1MwYWlDb0hBVWkwRlMrc1ZO?=
 =?utf-8?B?UHoxL0JqVTVST2l3OG9mUm90RDZGdGwraC9HOFJZaXdEeDF1ei9uM25iTWp5?=
 =?utf-8?B?UnlXL05UK1lDQUlBMkVibHhGUHBlQmZBK2Fyb3Jnc1o1Qi8zUHJ2bjVCR293?=
 =?utf-8?B?Wm5qTUYzdTBvS1loa1pBbVdMNFVEZmRFc0RrYkdXakFyemZSZjlSM1VqZW84?=
 =?utf-8?B?akFzQlJlNEw5NlZScFBqaDhpOHNEQjJKZ2YwRjNtTUpoaVhNR3N6RVNBaXg2?=
 =?utf-8?B?UTJVL2h5YVo3VUlCdDlOdUtraTFDZzJkQjhHTjRRMTBCRHpFQjVVbjFjNGRF?=
 =?utf-8?B?VjgwekdGQWhjVEl4WmJYdUxmVUxtbFlxaElmTWJ2YWwxOGJTSVdwbGVuMzEz?=
 =?utf-8?B?MXJSUTRQSHgvWEV3T1hnaHgxejJYbVIyZXNlYVBsL1N2UHNBSkJ4blZJS0NQ?=
 =?utf-8?B?NTZJYVdySzZSaVZKK2xNU01xZUhYSVdlRzZNMHZiVlpIYmdNM01YM2JweEpN?=
 =?utf-8?B?ZHFlM1Y5Vzh1Rzg3SjJJT3BNNjN3d0p5MzEzNFBzTkpCaXdkRWQ1TjU0MnBD?=
 =?utf-8?B?ZG9YOGRCZmQ2WUp4QTRqNGR0SXB5QmVGTlNVN1FFd1Voc0NVTzhOaGhNd2tF?=
 =?utf-8?B?TDE5OEZ6MWJXRE5YaUIwYXEyUnRrakRjQmhTTm9kZDhPcTNPR3NxQit4ZlpD?=
 =?utf-8?B?QzVXREp4TVUzVTRQZitLZEFwNHo0QUgrTmJ6SEhpN0NidlpwcEI5aEpCKzUx?=
 =?utf-8?B?VlRxcUYrSEEwSThPRHhxWlhOZnhHbENYMTNLbDNTbGk2MjhQT01YUEpCMTU1?=
 =?utf-8?B?a2FQK0g4Q2xmOWdKK293b09uemtGZThmVEE1NjFldFZ4cE93bXpPazZITXd4?=
 =?utf-8?B?akFlTjJwYmYwUnZFejNlVXF1QXZqZ2IzRXhWUGdtTnhGZUltRm41bnZHcTlq?=
 =?utf-8?B?WXcyOEVSR1haTUp3cmlZV0Q2dzRQUWdVM3UrQ2xlc2g4VTRuNXM1RVhZSSts?=
 =?utf-8?B?MWVBQllrcE51RUlXeHNMaC9DdThua0dYWE5XcDE1bDM2c3EvU2ZmQ2QvRTNG?=
 =?utf-8?B?cmVGT0NuNUNQaUpycGhqWnpBaUxWZ2svVUNBekZJVVVCVVlOT0Q0ZWxFam1U?=
 =?utf-8?B?ZHBVSVhpVE8wdmxNcVRQTFlQK005RDlyeXpHdCt3dHRqckVJZTFsZjV3Q1or?=
 =?utf-8?B?WFIvUE5jR3NBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3dnbThKRDEzZUZhNkZ5K1BqTGhvNUtVRllaZlArclIvb3pHcUw0UUI0dldB?=
 =?utf-8?B?d1lzNVNQZjZvT2xSRkZnMjlydEVKd0JCUWhRYUZ5Q3VGcTBEKzdvOGxIYmxX?=
 =?utf-8?B?MnJML2tlbzhjbXc0VGluaDgvZUpDNjhmWlNGMzFhSGwwRHNlNVlueGlQZG96?=
 =?utf-8?B?ZEkwVTZsRUJBQzZkbWlSQ1pzT3dudW1mYU1ZLzNXeW10R3pEbnAxeHIvMitK?=
 =?utf-8?B?dTJBWlVlbUtpNW5SNG0vTlhReUJTMlhhR2MrTmYyR20rVXh6ejBiTlNqSURq?=
 =?utf-8?B?d09KMUVCR2pDTlRVbGJheVVHNyt4K2N0c3RoenV3VWFIcmVUUTlXZnU2eVA4?=
 =?utf-8?B?T2xpeGlLY3MwNnF0R05pSjZoZlJSY2JyQzU1N2ZvWkhXQUtMV2dTVm42L2xo?=
 =?utf-8?B?WGQyM2Q0ZGNCamduMDhPeDNSYm9iQ0U4Vis0ak9iL1RKWkdCMEc0a0JFclVS?=
 =?utf-8?B?aFBqM1hXOThMOEdFWFFSejd0WXJwSFFuUUcwWXpQVXVkd2VRdWIxV3JMakJT?=
 =?utf-8?B?S3VQTHZWRXVpZHArQlhOZVpuNmI4WlYwdlRkNWVsMmF3ZWp0eVNqeEtzOEV3?=
 =?utf-8?B?am1Da0RxYXBaYzduVnNGNlZoWHRwNEdBNHZtak9RRW5kdFcySno4LzZxYlo4?=
 =?utf-8?B?dTFBa2c4U2wvUDdmY3BNaWxOU0MwMEM5TUx2S3Q0KzVoRmVVZUpuYS80RDdB?=
 =?utf-8?B?QXBwUVNyOWxGZ0hLSmZFYTVSMUVqNFB4Y2hvaFJuYjd5dkgzZWdRR3E4cnVY?=
 =?utf-8?B?WElsaXNyVFZNZkt2QnA1aFBPQmJRN2NLWVhCa2Vtd1ZuVmRQU1FhVTE2enBi?=
 =?utf-8?B?OGlQbHdaUENDSFpsUmdyKzdaempOMnJEYm1uQzRNTTB3RWd0emJJSE0rVUVv?=
 =?utf-8?B?c1I3WmpTRHk1YWQ3U2J5MU1JMEpadGQ5UDQxeDhpS2wvR0pQQ0xtenhFbSs5?=
 =?utf-8?B?NEphRHh0QzVkMWx5ejVvMG0yeG42dGo5aVo2UGxjNk1IU1lrOWNmMW9XZW1r?=
 =?utf-8?B?N1luUDBEUkFPekloZzU2VFZ5ZWRzUG43MDMyR3ZNcWZtNlpzMW9SUTNRTlNI?=
 =?utf-8?B?dVZra0Q3ZjJad3F3aU9pQWRQVU1iaFpMOUlyMmRVanJHclRaMWZibGtaQkNp?=
 =?utf-8?B?TmVhTDFTblJ2NkFtb2dIaStlVUU2SzYrK2dRbWY0SksrME4yeHY1YkFGc2or?=
 =?utf-8?B?QXVERjRYdkplaHVGUG9TcTVHS3ExVHBlVE5raFBjeEJLSWZYdkh1QnhMYkM5?=
 =?utf-8?B?ZFFXcVNLaDRLd1BJR1ZyRkFkQVpzY2RaM0Jjd1BuS2ljVW9GeXNQVlcxQkdC?=
 =?utf-8?B?L3ByYnZlZGVxLzBiMDVyOEg1aHpEeFVWZFFMV0ExOWtlY29lek5aY2VjMmxo?=
 =?utf-8?B?TDl4ZFZ2VjV0a3ZWckhBZ3dYdXk2cjhKTXZxamFBdGEyczRaU3YzYVltV3dB?=
 =?utf-8?B?UVM4cEdkUDVZTFZGSVVqdUo5dEpodjNQOVRyTS9KUWV5T0V0dXZacWVweUQ2?=
 =?utf-8?B?a25hQTdiQnJpQ1VLaFpaRVZTNGM1WHllN0dLd3pibjdzd21EM1loV3p4NkhD?=
 =?utf-8?B?ZGZmRHlqSmJTVDk2UVhkMEM1d1Rwenh3WjJIMWprTEtrTisrSXdrVEI0bXZj?=
 =?utf-8?B?cXVFL1l3dHo0TmViNDhsQjhydTB4VE12NFUva2pyTGZEN204bll3RlF3VmdQ?=
 =?utf-8?B?S1A1RjZJR05zV1A4b0N6QW5iTTkxV2w3SzBvdy85WU1GSW9teWVLSHlLNGwv?=
 =?utf-8?B?V3BVUlZHblZESXFKSWdRSEFRL1lrSU91TEgyTFlma1hwdkFSUW8xU0RCUmln?=
 =?utf-8?B?TU9WdDJwUytGTW9iK0twV3liRGg5aU9YYmxNVVVwR1BUa1BDbG9hb1lJdytx?=
 =?utf-8?B?TThuQ1NlbjJSclhudHRlTTR1ZFRmc1hGZFlzSHYzSFF4bm8rcmpQenVHZm9S?=
 =?utf-8?B?M1ZPZ1BCb1h1bXVldk9nbVEvNk5OeWlhNUhSL2JPWHl0NmpVNXk0K05BQUcv?=
 =?utf-8?B?d1pudFRtTU50QjVtMFc2T2JMV0RIQzUwOHBkSWpVeUVhVTZhbWkrY0NWd05G?=
 =?utf-8?B?d2k0b2xsRGhQVUtMbHlOOFVTbERsSFpFV1lQbWVJWnlrNWVyc1oyTnp0bWJu?=
 =?utf-8?Q?8I7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c9390b-7fd7-439d-11bb-08ddea981a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 03:15:15.6318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWEFUaPryk5HrsEoInGvXqy7HGQOQt4+8SjAjgVHs61vuJsEXvhfuE9Rr8SAYq8lqhic3NUvlGzs7auydG+xIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgODoxMCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9y
emVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAwLzhdIGFtZC1jcHBjIENQ
VSBQZXJmb3JtYW5jZSBTY2FsaW5nIERyaXZlcg0KPg0KPiBPbiAyOC4wOC4yMDI1IDEyOjAyLCBQ
ZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBhbWQtY3BwYyBpcyB0aGUgQU1EIENQVSBwZXJmb3JtYW5j
ZSBzY2FsaW5nIGRyaXZlciB0aGF0IGludHJvZHVjZXMgYQ0KPiA+IG5ldyBDUFUgZnJlcXVlbmN5
IGNvbnRyb2wgbWVjaGFuaXNtIG9uIG1vZGVybiBBTUQgQVBVIGFuZCBDUFUgc2VyaWVzDQo+ID4g
aW4gWGVuLiBUaGUgbmV3IG1lY2hhbmlzbSBpcyBiYXNlZCBvbiBDb2xsYWJvcmF0aXZlIFByb2Nl
c3Nvcg0KPiA+IFBlcmZvcm1hbmNlIENvbnRyb2wgKENQUEMpIHdoaWNoIHByb3ZpZGVzIGZpbmVy
IGdyYWluIGZyZXF1ZW5jeQ0KPiA+IG1hbmFnZW1lbnQgdGhhbiBsZWdhY3kgQUNQSSBoYXJkd2Fy
ZSBQLVN0YXRlcy4gQ3VycmVudCBBTUQgQ1BVL0FQVQ0KPiA+IHBsYXRmb3JtcyBhcmUgdXNpbmcg
dGhlIEFDUEkgUC1zdGF0ZXMgZHJpdmVyIHRvIG1hbmFnZSBDUFUgZnJlcXVlbmN5DQo+ID4gYW5k
IGNsb2NrcyB3aXRoIHN3aXRjaGluZyBvbmx5IGluIDMgUC1zdGF0ZXMuIENQUEMgcmVwbGFjZXMg
dGhlIEFDUEkNCj4gPiBQLXN0YXRlcyBjb250cm9scyBhbmQgYWxsb3dzIGEgZmxleGlibGUsIGxv
dy1sYXRlbmN5IGludGVyZmFjZSBmb3IgWGVuDQo+ID4gdG8gZGlyZWN0bHkgY29tbXVuaWNhdGUg
dGhlIHBlcmZvcm1hbmNlIGhpbnRzIHRvIGhhcmR3YXJlLg0KPiA+DQo+ID4gYW1kX2NwcGMgZHJp
dmVyIGhhcyAyIG9wZXJhdGlvbiBtb2RlczogYXV0b25vbW91cyAoYWN0aXZlKSBtb2RlLCBhbmQN
Cj4gPiBub24tYXV0b25vbW91cyAocGFzc2l2ZSkgbW9kZS4gV2UgcmVnaXN0ZXIgZGlmZmVyZW50
IENQVUZyZXEgZHJpdmVyDQo+ID4gZm9yIGRpZmZlcmVudCBtb2RlcywgImFtZC1jcHBjIiBmb3Ig
cGFzc2l2ZSBtb2RlIGFuZCAiYW1kLWNwcGMtZXBwIg0KPiA+IGZvciBhY3RpdmUgbW9kZS4NCj4g
Pg0KPiA+IFRoZSBwYXNzaXZlIG1vZGUgbGV2ZXJhZ2VzIGNvbW1vbiBnb3Zlcm5vcnMgc3VjaCBh
cyAqb25kZW1hbmQqLA0KPiA+ICpwZXJmb3JtYW5jZSosIGV0YywgdG8gbWFuYWdlIHRoZSBwZXJm
b3JtYW5jZSB0dW5pbmcuIFdoaWxlIHRoZSBhY3RpdmUNCj4gPiBtb2RlIHVzZXMgZXBwIHRvIHBy
b3ZpZGVzIGEgaGludCB0byB0aGUgaGFyZHdhcmUgaWYgc29mdHdhcmUgd2FudHMgdG8NCj4gPiBi
aWFzIHRvd2FyZCBwZXJmb3JtYW5jZSAoMHgwKSBvciBlbmVyZ3kgZWZmaWNpZW5jeSAoMHhmZiku
IENQUEMgcG93ZXINCj4gPiBhbGdvcml0aG0gaW4gaGFyZHdhcmUgd2lsbCBhdXRvbWF0aWNhbGx5
IGNhbGN1bGF0ZSB0aGUgcnVudGltZQ0KPiA+IHdvcmtsb2FkIGFuZCBhZGp1c3QgdGhlIHJlYWx0
aW1lIGNwdSBjb3JlcyBmcmVxdWVuY3kgYWNjb3JkaW5nIHRvIHRoZQ0KPiA+IHBvd2VyIHN1cHBs
eSBhbmQgdGhlcm1hbCwgY29yZSB2b2x0YWdlIGFuZCBzb21lIG90aGVyIGhhcmR3YXJlIGNvbmRp
dGlvbnMuDQo+ID4NCj4gPiBhbWQtY3BwYyBpcyBlbmFibGVkIG9uIHBhc3NpdmUgbW9kZSB3aXRo
IGEgdG9wLWxldmVsDQo+ID4gYGNwdWZyZXE9YW1kLWNwcGNgIG9wdGlvbiwgd2hpbGUgdXNlcnMg
YWRkIGV4dHJhIGBhY3RpdmVgIGZsYWcgdG8gc2VsZWN0IGFjdGl2ZQ0KPiBtb2RlLg0KPiA+DQo+
ID4gV2l0aCBgY3B1ZnJlcT1hbWQtY3BwYyxhY3RpdmVgLCB3ZSBkaWQgYSA2MHMgc2FtcGxpbmcg
dGVzdCB0byBzZWUgdGhlDQo+ID4gQ1BVIGZyZXF1ZW5jeSBjaGFuZ2UsIHRocm91Z2ggdHdlYWtp
bmcgdGhlIGVuZXJneV9wZXJmIHByZWZlcmVuY2UgZnJvbQ0KPiA+IGB4ZW5wbSBzZXQtY3B1ZnJl
cS1jcHBjIHBvd2Vyc2F2ZWAgdG8gYHhlbnBtIHNldC1jcHVmcmVxLWNwcGMgcGVyZm9ybWFuY2Vg
Lg0KPiA+IFRoZSBvdXRwdXRzIGFyZSBhcyBmb2xsb3dzOg0KPiA+IGBgYA0KPiA+IFNldHRpbmcg
Q1BVIGluIHBvd2Vyc2F2ZSBtb2RlDQo+ID4gU2FtcGxpbmcgYW5kIE91dHB1dHM6DQo+ID4gICBB
dmcgZnJlcSAgICAgIDU4MDAwMCBLSHoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNTgwMDAwIEtIeg0K
PiA+ICAgQXZnIGZyZXEgICAgICA1ODAwMDAgS0h6DQo+ID4gU2V0dGluZyBDUFUgaW4gcGVyZm9y
bWFuY2UgbW9kZQ0KPiA+IFNhbXBsaW5nIGFuZCBPdXRwdXRzOg0KPiA+ICAgQXZnIGZyZXEgICAg
ICA0NjQwMDAwIEtIeg0KPiA+ICAgQXZnIGZyZXEgICAgICA0MjIwMDAwIEtIeg0KPiA+ICAgQXZn
IGZyZXEgICAgICA0NjQwMDAwIEtIeg0KPiA+IGBgYA0KPiA+DQo+ID4gUGVubnkgWmhlbmcgKDgp
Og0KPiA+ICAgeGVuL2NwdWZyZXE6IGludHJvZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0byBwcm9w
YWdhdGUgQ1BQQyBkYXRhDQo+ID4gICB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlICJjcHVmcmVxPWFt
ZC1jcHBjIiB4ZW4gY21kbGluZSBhbmQgYW1kLWNwcGMNCj4gPiAgICAgZHJpdmVyDQo+ID4gICB4
ZW4vY3B1ZnJlcTogaW1wbGVtZW50IGFtZC1jcHBjIGRyaXZlciBmb3IgQ1BQQyBpbiBwYXNzaXZl
IG1vZGUNCj4gPiAgIHhlbi9jcHVmcmVxOiBpbXBsZW1lbnQgYW1kLWNwcGMtZXBwIGRyaXZlciBm
b3IgQ1BQQyBpbiBhY3RpdmUgbW9kZQ0KPiA+ICAgeGVuL2NwdWZyZXE6IGdldCBwZXJmb3JtYW5j
ZSBwb2xpY3kgZnJvbSBnb3Zlcm5vciBzZXQgdmlhIHhlbnBtDQo+ID4gICB0b29scy9jcHVmcmVx
OiBleHRyYWN0IENQUEMgcGFyYSBmcm9tIGNwdWZyZXEgcGFyYQ0KPiA+ICAgeGVuL2NwdWZyZXE6
IGJ5cGFzcyBnb3Zlcm5vci1yZWxhdGVkIHBhcmEgZm9yIGFtZC1jcHBjLWVwcA0KPiA+ICAgeGVu
L2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDIHhlbl9zeXNjdGxfcG1fb3AgZm9y
IGFtZC0NCj4gY3BwYw0KPiA+ICAgICBkcml2ZXINCj4gPg0KPiA+ICBkb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MgICAgICAgICB8ICAxNCArLQ0KPiA+ICB0b29scy9pbmNsdWRlL3hl
bmN0cmwuaCAgICAgICAgICAgICAgICAgICB8ICAgMyArLQ0KPiA+ICB0b29scy9saWJzL2N0cmwv
eGNfcG0uYyAgICAgICAgICAgICAgICAgICB8ICAyNSArLQ0KPiA+ICB0b29scy9taXNjL3hlbnBt
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA5NCArKy0NCj4gPiAgeGVuL2FyY2gveDg2L2Fj
cGkvY3B1ZnJlcS9NYWtlZmlsZSAgICAgICAgfCAgIDEgKw0KPiA+ICB4ZW4vYXJjaC94ODYvYWNw
aS9jcHVmcmVxL2FtZC1jcHBjLmMgICAgICB8IDc2NiArKysrKysrKysrKysrKysrKysrKysrDQo+
ID4gIHhlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5jICAgICAgIHwgIDY5ICstDQo+
ID4gIHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgICAgICAgICAgICAgICAgICAgIHwgICA4ICstDQo+
ID4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hbWQuaCAgICAgICAgICAgIHwgICAyICsNCj4g
PiAgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5oICAgICAgfCAgIDYgKw0KPiA+
ICB4ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMgICAgICAgICB8ICAxOSArDQo+ID4g
IHhlbi9hcmNoL3g4Ni94ODZfNjQvY3B1ZnJlcS5jICAgICAgICAgICAgIHwgIDE5ICsNCj4gPiAg
eGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYyAgfCAgIDMgKw0KPiA+ICB4
ZW4vZHJpdmVycy9hY3BpL3BtLW9wLmMgICAgICAgICAgICAgICAgICB8ICA2OCArLQ0KPiA+ICB4
ZW4vZHJpdmVycy9hY3BpL3Btc3RhdC5jICAgICAgICAgICAgICAgICB8ICAgNCArDQo+ID4gIHhl
bi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jICAgICAgICAgICAgIHwgMTM3ICsrKy0NCj4gPiAg
eGVuL2RyaXZlcnMvY3B1ZnJlcS91dGlsaXR5LmMgICAgICAgICAgICAgfCAgMTUgKw0KPiA+ICB4
ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5oICAgICAgICB8ICA0MCArLQ0KPiA+ICB4
ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvcHJvY2Vzc29yX3BlcmYuaCB8ICAxNCArLQ0KPiA+ICB4
ZW4vaW5jbHVkZS9wdWJsaWMvcGxhdGZvcm0uaCAgICAgICAgICAgICB8ICAyNiArDQo+ID4gIHhl
bi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgICAgICAgICAgICAgIHwgICA1ICstDQo+ID4gIHhl
bi9pbmNsdWRlL3hlbi9wbXN0YXQuaCAgICAgICAgICAgICAgICAgIHwgICA1ICsNCj4gPiAgeGVu
L2luY2x1ZGUveGxhdC5sc3QgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICAyMyBm
aWxlcyBjaGFuZ2VkLCAxMjgzIGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKSAgY3JlYXRl
IG1vZGUNCj4gPiAxMDA2NDQgeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtY3BwYy5jDQo+
DQo+IE9oLCBhbmQgLSB3aGF0IGlzIHN0aWxsIG1pc3NpbmcgaXMgYSBDSEFOR0VMT0cubWQgZW50
cnkuDQoNClRoeCwgdW5kZXJzdG9vZC4NCg0KPg0KPiBKYW4NCg==

