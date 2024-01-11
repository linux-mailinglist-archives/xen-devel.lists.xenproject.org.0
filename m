Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5E82A61D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 03:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665851.1036135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNkvo-0007Dm-DV; Thu, 11 Jan 2024 02:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665851.1036135; Thu, 11 Jan 2024 02:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNkvo-0007B1-AW; Thu, 11 Jan 2024 02:36:32 +0000
Received: by outflank-mailman (input) for mailman id 665851;
 Thu, 11 Jan 2024 02:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXkz=IV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rNkvn-0007Ap-4N
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 02:36:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38721705-b02a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 03:36:29 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 02:36:23 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33%6]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 02:36:23 +0000
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
X-Inumbo-ID: 38721705-b02a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLesn8eaebvzwhJQnRy2t5xSphHWBxp7z0lt+aI22QTcXkDL6Hh0TTaIj+/xVLinHvChTsAnmNTZ7WI53W95+rk5ixyVHe112cgj4InSK9k0WTjUwHIlKTd8alB8Kq2fnp22UiQO0E5LW8HgfiFuaiI9GyQeKRcTXWTrjKPzFwPQwAOWc5VF82u7RmsCggtlTmzbwdGxcf8Fj4MLi9UpiY7dJeBuDtpy3DrCpnheJ3lapzOk37fDDWJT7ltQz9+1O0SIsrV+P3mKrmo7eEbJyT8qHyuKZM403zibd9PDDjv5plqqY74TdH1SV10yWQgY8a91ICLvL7IOsiOEa4q3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAm2y2f9mxG1L6fJRCLllKwedFmPKAjJe+UAACa/sCg=;
 b=lYVu0t6Sdx+YbkYH5oMEQxW4G1OB+u7VxzQ0WF66WfsLNIxzT4Wb0tbW5jw2UjpsKnUq2KuSbZsyREPWb2CNJI9D3e4dPavGsyCePWx2RwKLLOrcejm0rRZ4IqFaJxJhrqhkufICU7sgZFgHozW1Ctgcu19NCQi8aRx2jJAjkI/GaJojmZY2ll48W1In8m1CwoaRz5n1+30v9Wdeqr166StQJ/Va4/hXWJTGJXr9kmTMKThOcX3sXaqmFHrs3cQxRgvxcGBo2bZvFkhltwwEP1vtWT1XYf0LJ+bQwn0LcIt21iU7cgtULICgUvKOPOH7fB3yqiezsMjxIcMSdeuzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAm2y2f9mxG1L6fJRCLllKwedFmPKAjJe+UAACa/sCg=;
 b=ADgzPKsWDgvabeVBvdATKIMD+BJ1nrgbcKYE2rhO0LZqq/MU2FeBexcKK7dw7w/CJv+FKPh/cmmS6hVtrS+s9CTTe4a8SfullJTnlsgSYIpBbGSrd7WkXybt7r3gVVdAGI3IOg1XrlgF3w+yoHt3WjbMMP9y3/nce0Uf1p0XeW8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaP6YrwTeuO8u85U6eXqUvf5Gm3LDRoHaAgAF/ZoD///38AIABVnwA
Date: Thu, 11 Jan 2024 02:36:23 +0000
Message-ID:
 <BL1PR12MB58496FB5005BEF3437ACB130E7682@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-2-Jiqian.Chen@amd.com>
 <70add06b-59c6-469a-8570-f7a6f5bc15fb@amd.com>
 <BL1PR12MB58494843C4BCE9A522A0E674E7692@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0bbb2260-3fde-4b0f-949d-01ffd03029ce@amd.com>
In-Reply-To: <0bbb2260-3fde-4b0f-949d-01ffd03029ce@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7567.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6063:EE_
x-ms-office365-filtering-correlation-id: 2b26724a-13e8-4c65-9632-08dc124e1a46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0DUfHtBZPM9v/6cq3ovcsc1W88cJM4SjxgWJBnvh73yYTfHmuj7Tm7NlQIK9nEdithAce0InxMs6U3ulXl/ZfCUB3P/xIQc+sQ8o3cT22SVkRN8TNXUYXjDFj+GdzcU0rTF+z7ju1TCNKdbsTSD74FwuoYQANWEqcqnZnvxhHaDJSr9vzuB4Kgew4E314ol5F5ntl4O440sSsPQrkytIwz1jDd8jH31p4FuShq9RbgSziteBTFydhkEyKTuzwZIbhoqO9iM205nHtQdk7y9SNdQfI4VaADfRc/xltCGOpCnVhFWCFMsUgQoNfpDNg3DmnIaVQduRTINWRLnk8+xZTY3k5zNElYk8H6fr/QItY4ul9GsAHS+YTi1Z2W1UJ/citLzfksg0k7CIX6m+2SFHmFS1TF9DauWWNI25A4rXq35TAYtcywehQSBDM8Yq3CxezSj0HMbsy4/folAVfaq4Vn3ZGm+uYdvm7TqEGWu+/MzI6fDCG3qVWzudOJo3PfFzPWk8kieaqi9iqQbSpY8gsPBByqyf2WC3ogfxXTPv5zun3fay7Av0IoiA+N4fcCxAm+uK3TIuJ8lGDjKk48p2XbT4Twhvb16Rebg04ASSOrc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(55016003)(6506007)(26005)(53546011)(9686003)(7696005)(478600001)(71200400001)(966005)(38100700002)(122000001)(33656002)(66446008)(41300700001)(2906002)(66476007)(64756008)(66556008)(7416002)(76116006)(83380400001)(5660300002)(54906003)(38070700009)(8676002)(4326008)(316002)(6636002)(66946007)(8936002)(52536014)(6862004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzZRdjhNSVlZeFNDaHoyUFd6RVlLUG4vZk5CbXk3VUM1Y1dNV0tiZk11ZS93?=
 =?utf-8?B?Y2ZnVWxUTlRGK0lkemlQZTFZeWg4a2sxZjNJM0tveXlXa2ZKZ0U5Q0Fsb0NN?=
 =?utf-8?B?SWFZeTEyMHN4SHFEY0JlU3JKcEdnKzc0ZDQzR2FHNW1GMUJZdFdGQWFsN21F?=
 =?utf-8?B?UGhza3ZBSzNQd2JrSW5vdjVRSU1ORXVXd2V5NU1vSXNoVER1SVRnNnRxQnFQ?=
 =?utf-8?B?VTNrcXhRWU9EbXZQaXJWNEt4ZlYwTDh1QkZFYUdCTVdRd2NVUkRtRGRDMndY?=
 =?utf-8?B?MXpvNjYzTUcranQ5eDBGbjJNd2MxSnNJRWlBb0VCVndYMnlmdFpCQnFDY3R6?=
 =?utf-8?B?WXYvenVwR2E1TmxreWxRR1pvbytGWUp2cWQvVEVDQU5iZHYycDZxT3NTb2wr?=
 =?utf-8?B?Z0VOajk3V2RaMmFiN0tUL2dPOWZuTkNoNkNKdmdEZDVaL20ranh2SkpHS1Nx?=
 =?utf-8?B?d3hiK2dRYy9WcjVKbnNPQ0tvTjFBanFsWVJ5UHVPSndZUktTYWxXOGFGbjR5?=
 =?utf-8?B?SldmcURCcWoycERDR3h3OXo0UEV6a0dMZGdWcTh4REl2Vm5WeXFSL3lZNGNW?=
 =?utf-8?B?cHpBR21hL2pTazFvVjVGNEJEUlJ1cFhQOWxtRHZ4d3RTMjNBcUlYcGtzV0Ni?=
 =?utf-8?B?a0xjcHA5Z2poYmZveWVsTjBhYnJBbm9YQ3pHUWJVcDRVTzkzWWJjM1E2U21J?=
 =?utf-8?B?OTFHcWI0Ynh5WjU2VHlZZWhzZ3hUTFRoWVZvSE9PTFNQMHF0RmgxN1hCcE1D?=
 =?utf-8?B?akpnUE9ydVZUaXVuMTBCb1M2eGVnQmpWWjlQclJkRm5MZVlVNW9kd0plM3NK?=
 =?utf-8?B?VksvZmF6b1E0c01XdzIxWEpTREk1WlJzR2FvTkR6TFJHaTcwM0lQcHJLUjlE?=
 =?utf-8?B?NGNkVWJab2ZTR3k2YzBISEkyZys4V3lXdE9nTk1xL01ub055OUxmakR1YXYx?=
 =?utf-8?B?YnJyTDRxRUxTRVdVT1BhZG1Rc3M0QytXTU9odXZVVWpjbVZKdjFTM1pmZ0ZZ?=
 =?utf-8?B?NXcyclVVV0lnVFE3MllCN2NCRnN3TmxWTjN4OUJjVUxOUVNGd1BxaFJzSWtJ?=
 =?utf-8?B?QzQwdXNtR1ROYmlTRVVmd2JwSm5zVVIwSHRVbVgrNGNzNFZ0ZDFwOGgybUtX?=
 =?utf-8?B?SzVSVW5oM1Z2eTl0RW9SOWxGS1FaRmN3K1JxUzZQMm0wNThXb0paOHVXQXlP?=
 =?utf-8?B?ZzNTbDJSVmZwcnpsVlZ2RExnZ2Q1MEJLY1loQWovcEpzZFYxbkFvWVp6a3o4?=
 =?utf-8?B?OFArcm5Fa2JRUEZsVWUyNXpVMVJmVVYrSDlRR2tjVTRLZjNGSTRweitrWTU1?=
 =?utf-8?B?NDA1aFFXR2Q1aXN3YjFTbXdVb3RlOHpYNUM1UXVoRndLR3dPUWNHcmx0eHMw?=
 =?utf-8?B?ZzRMWVp2dXlTbXhrZlduOWlkWFBlZjlmcHRXY2dNdjVGaEhFT2VNYWFxZjcr?=
 =?utf-8?B?dTAvSkZFUFZQemc1aXg5M0wyZlovZ0dhYStVTHl4dTVRMURDM28xOHZVNVA3?=
 =?utf-8?B?V1NSb3pHZ1VSNTg3YkRONkRYbVNocklaQURIRzZwNXVPTFFCZTlob2NIUDZ5?=
 =?utf-8?B?c0JscVBUQVFaTXU1RzRNTmdzOWpGK2hmYnZwdzhYUUV0SlltOGIvUllZM0Vx?=
 =?utf-8?B?NnRLUXQ4U3VPWk43UldCaHB5aHg2MCsza1BmRStHaEE4eHhxei9XTEVJM3lh?=
 =?utf-8?B?dXpWZnZTZjJwWlZYcTZ5ZDJLc1pmSmtDZ2w3TS9wNGpQN1JHaUZMWnU2TWow?=
 =?utf-8?B?MW1IQnkwZGdSU0tPYngxQnl4SGs0Uld6V01pSEs2TldnYUNJU05EQlQyTmc5?=
 =?utf-8?B?ekhlMGVvaTZOZUlwRUFoOHc3UUIwZXVQTTh3WjFoYThubCs5MHlXMFh5Tmpy?=
 =?utf-8?B?dEdkMFJsdUlvL3krVEtpa0RyUktFMW5TVTJMcDduT3czcWZJTmN0Q294U1Rh?=
 =?utf-8?B?V245Y2ZYTlo0NVQ2aW9BVjlVRVlqZ0l4T2hxRzFYa3BOMmorNXJKME5kNnJj?=
 =?utf-8?B?Ky8wUGNzeGZaMjhBYTBGQVpBUnNYUFVtYktldXc0cEhlUmdEZEJrdmNycjcx?=
 =?utf-8?B?Y3kxUFp5RGovbXN1NTdOcDZQSURyRmxqSVQvd0FnSlFFMjk1Qzk3T2hmV1dy?=
 =?utf-8?Q?IUSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F6E14321429042A3461D01B23B83EC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b26724a-13e8-4c65-9632-08dc124e1a46
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 02:36:23.7098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NssdCtgIJyc8qJUy5VEGBPiqFBMytNDsHfskRPl3kkRWwhBqjrKKIei40YWoG4GKYq7dXPTnET25eZCz0/HO3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

T24gMjAyNC8xLzEwIDIyOjA5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+IE9uIDEvMTAv
MjQgMDE6MjQsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvMS85IDIzOjI0LCBTdGV3
YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+Pj4gT24gMS81LzI0IDAyOjA5LCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMgYi94ZW4v
ZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+Pj4+IGluZGV4IDQyZGIzZTZkMTMzYy4uNTUyY2NiZjc0
N2NiIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+Pj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMNCj4+Pj4gQEAgLTY3LDYgKzY4LDM5IEBAIHJl
dF90IHBjaV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkg
YXJnKQ0KPj4+PiAgICAgICAgICBicmVhazsNCj4+Pj4gICAgICB9DQo+Pj4+ICANCj4+Pj4gKyAg
ICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0OiB7DQo+Pj4+ICsgICAgICAg
IHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2UgZGV2Ow0KPj4+PiArICAgICAgICBzdHJ1Y3QgcGNp
X2RldiAqcGRldjsNCj4+Pj4gKyAgICAgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4+PiArDQo+Pj4+
ICsgICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KPj4+PiArICAg
ICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIHJldCA9
IC1FRkFVTFQ7DQo+Pj4+ICsgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZkZXYsIGFyZywg
MSkgIT0gMCApDQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgc2JkZiA9
IFBDSV9TQkRGKGRldi5zZWcsIGRldi5idXMsIGRldi5kZXZmbik7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICAgICAgcmV0ID0geHNtX3Jlc291cmNlX3NldHVwX3BjaShYU01fUFJJViwgc2JkZi5zYmRmKTsN
Cj4+Pj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgICAgcGNpZGV2c19sb2NrKCk7DQo+Pj4+ICsgICAgICAgIHBkZXYgPSBw
Y2lfZ2V0X3BkZXYoTlVMTCwgc2JkZik7DQo+Pj4+ICsgICAgICAgIGlmICggIXBkZXYgKQ0KPj4+
PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4+PiAr
ICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+
PiArICAgICAgICB9DQo+Pj4+ICsNCj4+Pg0KPj4+ICAgICAgICAgd3JpdGVfbG9jaygmcGRldi0+
ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4NCj4+Pj4gKyAgICAgICAgcmV0ID0gdnBjaV9yZXNldF9k
ZXZpY2Vfc3RhdGUocGRldik7DQo+Pj4NCj4+PiAgICAgICAgIHdyaXRlX3VubG9jaygmcGRldi0+
ZG9tYWluLT5wY2lfbG9jayk7DQo+PiB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSBvbmx5IHJlc2V0
IHRoZSB2cGNpIHN0YXRlIG9mIHBkZXYgd2l0aG91dCBkZWxldGluZyBwZGV2IGZyb20gZG9tYWlu
LCBhbmQgaGVyZSBoYXMgaGVsZCBwY2lkZXZzX2xvY2ssIGl0IGhhcyBubyBuZWVkIHRvIGxvY2sg
cGNpX2xvY2s/DQo+IA0KPiBTdHJpY3RseSBzcGVha2luZywgaXQgaXMgbm90IGVuZm9yY2VkIHll
dC4gSG93ZXZlciwgYW4gdXBjb21pbmcgY2hhbmdlIFsxXSB3aWxsIGV4cGFuZCB0aGUgc2NvcGUg
b2YgZC0+cGNpX2xvY2sgdG8gaW5jbHVkZSBwcm90ZWN0aW5nIHRoZSBwZGV2LT52cGNpIHN0cnVj
dHVyZSB0byBhbiBleHRlbnQsIHNvIGl0IHdpbGwgYmUgcmVxdWlyZWQgb25jZSB0aGF0IGNoYW5n
ZSBpcyBjb21taXR0ZWQuIEluIG15IG9waW5pb24gdGhlcmUgaXMgbm8gaGFybSBpbiBhZGRpbmcg
dGhlIGFkZGl0aW9uYWwgbG9jayBub3cuIElmIHlvdSBwcmVmZXIgdG8gd2FpdCBJIHdvdWxkIG5v
dCBvYmplY3QsIGJ1dCBpbiB0aGlzIGNhc2UgSSB3b3VsZCBhdCBsZWFzdCBhc2sgZm9yIGEgVE9E
TyBjb21tZW50IHRvIGhlbHAgcmVtaW5kIHVzIHRvIGFkZHJlc3MgaXQgbGF0ZXIuDQo+IA0KPiBb
MV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDI0LTAxL21zZzAwNDQ2Lmh0bWwNCj4gDQpPaywgSSBzZWUuIEkgd2lsbCBhZGQgcGNpX2xvY2sg
aW4gbmV4dCB2ZXJzaW9uLCB0aGFuayB5b3UgZm9yIHJlbWluZGluZyBtZS4NCg0KPj4NCj4+Pg0K
Pj4+PiArICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4+PiArICAgICAgICBpZiAoIHJldCAp
DQo+Pj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBwOiBmYWlsZWQgdG8gcmVz
ZXQgUENJIGRldmljZSBzdGF0ZVxuIiwgJnNiZGYpOw0KPj4+PiArICAgICAgICBicmVhazsNCj4+
Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gICAgICBkZWZhdWx0Og0KPj4+PiAgICAgICAgICByZXQg
PSAtRU5PU1lTOw0KPj4+PiAgICAgICAgICBicmVhazsNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gaW5kZXgg
NzJlZjI3N2M0ZjhlLi4zYzY0Y2IxMGNjYmIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IEBA
IC0xMDcsNiArMTA3LDE1IEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+Pj4gIA0KPj4+PiAgICAgIHJldHVybiByYzsNCj4+Pj4gIH0NCj4+Pj4gKw0KPj4+
PiAraW50IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+
PiArew0KPj4+PiArICAgIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsNCj4+Pg0KPj4+ICAgICBB
U1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKSk7DQo+Pj4N
Cj4+Pj4gKw0KPj4+PiArICAgIHZwY2lfcmVtb3ZlX2RldmljZShwZGV2KTsNCj4+Pj4gKyAgICBy
ZXR1cm4gdnBjaV9hZGRfaGFuZGxlcnMocGRldik7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gICNl
bmRpZiAvKiBfX1hFTl9fICovDQo+Pj4+ICANCj4+Pj4gIHN0YXRpYyBpbnQgdnBjaV9yZWdpc3Rl
cl9jbXAoY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIxLA0KPj4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

