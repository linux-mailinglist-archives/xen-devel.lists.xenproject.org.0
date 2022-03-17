Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1ED4DBF03
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 07:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291378.494496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUjKU-0000YZ-Uu; Thu, 17 Mar 2022 06:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291378.494496; Thu, 17 Mar 2022 06:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUjKU-0000WS-Ql; Thu, 17 Mar 2022 06:09:46 +0000
Received: by outflank-mailman (input) for mailman id 291378;
 Thu, 17 Mar 2022 06:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nUjKT-0000Vz-Bx
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 06:09:45 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d590aae1-a5b8-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 07:09:44 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:09:41 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 16 Mar 2022 23:09:41 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 23:09:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 16 Mar 2022 23:09:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 16 Mar 2022 23:09:40 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3802.namprd11.prod.outlook.com (2603:10b6:5:143::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 06:09:38 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5081.014; Thu, 17 Mar 2022
 06:09:38 +0000
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
X-Inumbo-ID: d590aae1-a5b8-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647497384; x=1679033384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wN7koKXZBXPWqPTLF/mnwgFdVLMxZ59WtsUHzv8TZV4=;
  b=ctn4ez1kCvU9kpGytJ5/NDPzafShVAbUtbpnk51CLIhyFc5ZWLP+FgWw
   fHropeO+nEq82WguwT7+erisjMTLb7eKSB5w4eT4JFhJGIj5Tr7NBN/Rb
   IGTCuU8gcNEDaD5qRv2vnaocYM8/2MB+oa9laPPb4Vx6QcFBx1iqu0DqK
   IoMyNV/f7yF86rjZXPmq7BQCJA2hj9bHvl9wIru5uqy2SPW4A+HGta3K6
   JxjPBNxDbiak0yMyVRzveZxKZtbNCpU8vH3IQz063QCbHstEYbHf/bnAl
   KxkKGOAXValB7mkYlLmc4gtY94Wpvhf+2DV8es85sedOjACn4oWgGjovn
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="320002951"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="320002951"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="557793751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcWc3JrjhN2hBV7FKdzrh4l1yVlX7EsS14qUCGG1QgD/hcxW187+FbCOKxtcmSqGuoAk2/dVJn0zFm3N3CCpOTdqihlodbHNsvsmHnvrgeg/Hg8YXPr7/Zc7Dt4xROMs8F/wUyPax5X6fy9j7OzK9+VbrOec/zCRhS8khnL3b8gSm9TyMzOlZ1275ShhCyjeRn0Jy3VpjlbGRdtZqjvdxl8VS8JDvBgIqUCwkk5FWXkvmZ3ZPx/eQ/WYRZjENIvO8brrGyp2EjL1F2U2Bb3IfDc51BzQ8RYsSFzB9xQ3SUrkIGix4MySeTcBmrvVtMu2sOvXg1x08URg6Ew1olmXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN7koKXZBXPWqPTLF/mnwgFdVLMxZ59WtsUHzv8TZV4=;
 b=UA1fWIUf5s2Krewk5WLlbsw4jprRNIOs3DbPTmWOyf3SzyuWjkKXcdzOCSjzztAd8YKk0asBfWIhMdK5nt/8uRt7iNu3LP8rXekRZQGmmSy/GWhGYmFcXw3yZNH1rodmcH7nJ4hqxxFZzddPRhaFJpR7VB9HUi1R4hv3wEuTzDxW0CSB9+WR2JZmsF/hZjzaaLABkcrCsHp5lkJc4A1RUEThldMzccHtooL5Cbzxg7r48+3KdjOT6VQkF1TCMcoeIW1+lpBedX7v7Z6pgTz1rhGkHDIZEhTz0xLtJhFSQ9TOc7ZUPi+KG+JB3FnYCcuyF1S1MrkTMRTn33tYV8nXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
CC: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Beulich,
 Jan" <JBeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Thread-Topic: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Thread-Index: AQHYNK72F/eE81SIoUqvccI09xMIhKy+fRzggABTaICABE+GoA==
Date: Thu, 17 Mar 2022 06:09:38 +0000
Message-ID: <BN9PR11MB527623CD66F0F606BD0CF5F98C129@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CABfawhmZLyZdSbK0sr4t_WoYx6uYOV2bH89bX4ET0kzeQiY0-A@mail.gmail.com>
In-Reply-To: <CABfawhmZLyZdSbK0sr4t_WoYx6uYOV2bH89bX4ET0kzeQiY0-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b1c8063-cb3c-446e-2205-08da07dcb7da
x-ms-traffictypediagnostic: DM6PR11MB3802:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB38025E79F4AFC24522DEB47F8C129@DM6PR11MB3802.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 14vqvZ8c/xc7nsa/Py6WlQavaarjoPrUnCY2bLwIp/Sx4/kBXwGPGG31KuIvR1U0cpqNtUKOm8b6xBk1t5VWlp3NlzgTsDLpCMN90WY5mfnFHo4p6c8C3+TdpOwoJ/oJvITeMuQ8AWXAm8EXvUxKJjjqjGw9AfsytwWf4RPMpgaqai4JOEo5bxTGYFQh4HYBIIXWERqgB79JETzSktIeSV+yEvYzCSSFLek9Nu1G97eTovZK2MNq4fkXtKHcp9KtG7I+jxRLOxv9vRPkEQ31RDzcn4TEQPenpmTNni3/63b52kENnOiXrIteufLYJqRPEZo47y1sAXEvYKrSVFTDxDD2LOtoIdVuNHdtz9oePc/tMzPvwcRe8+9UQ0RH9U2yBnF69OS707hkSHfGZyyzB17c1lHtbAHnh/QycHq3WwKywURfJ6j5kGSwrR8uGEtwpeFDUVznxTI5Ah/FmMXY8ur3iUxQ3802DZKf3Gmvrz4sBlEhyVi37ZpY+GIqpCYbzNlcqdhNxf8l6JwywKc9+Mi74uCUNeoD7i7EmWzIlFe3SPHC49lgcrlLBqq4T6/cCwEjNbym5p4jupplFgV4fZNlPWWtyFt25S38gASaS4zL9DvvN1xKZiS0O+cDZ7QsVO8RCQKZhN6nG0f/Q2iNjz8eo3bK8SucSDazwHtKUAwZ0GQN0lVA4xLU5CB4ubDDg7NWdXF5zFUDFm2NLEOpzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7696005)(6506007)(83380400001)(53546011)(33656002)(9686003)(52536014)(55016003)(5660300002)(2906002)(8936002)(122000001)(38100700002)(86362001)(76116006)(71200400001)(64756008)(66556008)(66476007)(66446008)(66946007)(38070700005)(508600001)(82960400001)(107886003)(4326008)(26005)(186003)(54906003)(316002)(6916009)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzVDOXdnLy8rSFUrTWsxd3RSd2VGemxtb0cxNnpxNnVPVGlCQ2dOMFQvdHJa?=
 =?utf-8?B?UE5YV1orNXd0OTROcitkVVFUeUlEM2FLMEhOaUlUcDNjRllHRkQ4akZXTEpV?=
 =?utf-8?B?VmcyaE9rQUJBdkZOWlRLNG43VEtqRGhrd29IMWN2M2Y1ZDNqd2Ficm5HRSs4?=
 =?utf-8?B?MHZWZjVxRGpLYzNUWDJ6engxMU1qU2lSVzNZOU4ycnE4b0EvVFlmam9mQmRW?=
 =?utf-8?B?UXFkWlJFbkdzTVl0ZDhTb2g4QXZLcEJ2VmV2c1JTbzlLQlA5THZmQURGajI5?=
 =?utf-8?B?aWxuQmNnc1VJSFArSWRLNjVTaU90WXByTzJKOEN5SkpSNmhYSm00bk1BYU9T?=
 =?utf-8?B?bHJMVjJmTzZNK3U0aUJYVDV3K0tBbDNQSGlQeHFFc0c4VGFpYWhrSjFmVTJP?=
 =?utf-8?B?RGtSVzltaWRHUlgxY0lERkZuZ1Q5b1pBeFJtNGcxdU9PLzd6d3NqNFBnWFhK?=
 =?utf-8?B?Nml2aE5hcWhrS2EzWFJwWW5Ta2g4TWZ0TXh2NXI5d1dEUWlTaTVtTnZhNytN?=
 =?utf-8?B?NWc2SXYvQnNUaTJpcTVkZVBuU2U5VGdObkxVUEc4NmZkazM1K2lhLzNsNFlQ?=
 =?utf-8?B?UkFtdlg3MGFDWXp2OWlKUkFTbG1oWVQxSEEzajhQMVUxKzZnVGxESUVLdWJ0?=
 =?utf-8?B?MEhyMnpneFBOTXpDOEdKSEdDMENSMWFoVFNBK3RwUzBPenVMTFhXLzRpTm40?=
 =?utf-8?B?aGZlTzRsNDJGVjlqOW1TdTJmMW1qbXQ0bVRKYzBEaXVsMURyTXphR0FVM28x?=
 =?utf-8?B?OXVnRWxZcnBwc3BPenpzRm5UYUZXblJoekVPRGpVaGw2Rm5NeXZRVFltYlda?=
 =?utf-8?B?NDRkcWpYSDR0RTBYdWp5RTBtUzlNZkg2am5lMHM4WWpqV3E0WDE2MDlYUkhv?=
 =?utf-8?B?VUJTajZpU29qNkRkWmVnVER2RG1DUnJKOGdWeGgrYUs1WkpkSTBINURtQnJl?=
 =?utf-8?B?azN4VVpPdkhaeHNFL0p2ZW5IRGRMN0REQXBqYThicmhZOCtaY1NGWEgzSkRF?=
 =?utf-8?B?TjFtWUQwS0lSd2xxQ1l6b0xTajFIdUFsTkFrYWpUMEt5cW16cFMzY0lkZFY3?=
 =?utf-8?B?MlRBYlVLZHZuZDdrSmJxMlZVSmFSMy8yY2xvRnVyZnNndkVXQWxQSnMxaDdx?=
 =?utf-8?B?YXQzMm9McUNEeHpUYWVNREVMbkxzUVlEb1pOSGduc04ydXRMMUxMOWxzVmhl?=
 =?utf-8?B?dEhlTW5DY0pEQUVRWFg3eDZHRWFndkU3OXNFS0tIR3NJTEViLy85L21WOG9j?=
 =?utf-8?B?MERQSEhyc3hKQWNDZTQzcWJKTWlpOW1mdi9QbnI5WUtVbFdOZFdsS2M1MDBn?=
 =?utf-8?B?ODREajd6NjZEcVdIaXFhRmJLMkZYT09hSnBrRFlDa0N1Um9PR3Z1U1dkNDR1?=
 =?utf-8?B?WUxINiswTmttTXBNZ2o2anpQdEUyVFY5S1JVTVpEMDFKUFB3ZTVHbVpoKzhR?=
 =?utf-8?B?cXRiK1A3MWhaZWI4Z09hcklLU3hRMnc2eVU2RmtCWE9vT0hSZlduMXdqMGxi?=
 =?utf-8?B?SzlPV2MyQk1hakFtWFd1aDBoVldHMzZaRWw4WnZtK2Y4b2IrcHVDVzV3QUh0?=
 =?utf-8?B?SWdKT3JUS2F0V050SDB2K052a1ExTk0rL09uekpDclpGa3hJL0FqN3I1VGZB?=
 =?utf-8?B?b0ljQVJyazlNbkxDQ2ZuV1VBK0psak1hdE9ZMmpSVy9JSGZWY3BhMUFBM1dl?=
 =?utf-8?B?ZUlVRkNFRjN1MnRrSUQraVhhV0xQcDdUd2RpeXR5L1pNRDd1dTVST2RNU3dp?=
 =?utf-8?B?MTUxaFRWcDBSR0lqMWFxZ3prN0hBOEhrd1BxOTNDN0hMYjlCVTJmWEVHV3hE?=
 =?utf-8?B?M0pNbTNNYXdoWkV2dVVWMERoQnFrcklDNGJsb1lVZ1dmWWxYUUhiVEczT0JN?=
 =?utf-8?B?b01XN3RLSnN2dkxkR0tyci9zUDd3L0Z5dGtFZ3VSRm5JNVVVaHN2eGV4Z2Fl?=
 =?utf-8?Q?Jh3HgsMY6oSlB0clxvWpQKU544tGKOC8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1c8063-cb3c-446e-2205-08da07dcb7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 06:09:38.3353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7sqLKTMbaH89b3fwgGbjrsHxRUCLgGD7fkJdqorrcZZB/YlMSyCiJI9jil2pzh76mhYaYBHSGSmOjYjs80pVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3802
X-OriginatorOrg: intel.com

PiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmsubGVuZ3llbEBnbWFpbC5jb20+DQo+IFNl
bnQ6IE1vbmRheSwgTWFyY2ggMTQsIDIwMjIgODoxNCBQTQ0KPiANCj4gT24gTW9uLCBNYXIgMTQs
IDIwMjIgYXQgMzoyMiBBTSBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4gPiBGcm9tOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5j
b20+DQo+ID4gPiBTZW50OiBGcmlkYXksIE1hcmNoIDExLCAyMDIyIDI6NDUgQU0NCj4gPiA+DQo+
ID4gPiBEdXJpbmcgVk0gZm9yayByZXNldHRpbmcgYSBmYWlsZWQgdm1lbnRyeSBoYXMgYmVlbiBv
YnNlcnZlZCB3aGVuIHRoZQ0KPiByZXNldA0KPiA+ID4gaXMgcGVyZm9ybWVkIGltbWVkaWF0ZWx5
IGFmdGVyIGEgU1RJIGluc3RydWN0aW9uIGV4ZWN1dGVkLiBUaGlzIGlzIGR1ZSB0bw0KPiA+ID4g
dGhlIGd1ZXN0IGludGVycnVwdGliaWxpdHkgc3RhdGUgaW4gdGhlIFZNQ1MgYmVpbmcgbW9kaWZp
ZWQgYnkgU1RJIGJ1dCB0aGUNCj4gPiA+IHN1YnNlcXVlbnQgcmVzZXQgcmVtb3ZlcyB0aGUgSUYg
Yml0IGZyb20gRkxBR1MsIGNhdXNpbmcgdGhlIGZhaWxlZA0KPiB2bWVudHJ5Lg0KPiA+DQo+ID4g
SSBkaWRuJ3QgZ2V0IHRoZSByYXRpb25hbGUgaGVyZS4gQmVmb3JlIHRoaXMgcGF0Y2ggdGhlIGlu
dGVycnVwdGliaWxpdHkgc3RhdGUgaXMNCj4gPiBub3Qgc2F2ZWQvcmVzdG9yZWQgdGh1cyBJIHN1
cHBvc2UgYWZ0ZXIgcmVzZXQgaXQgd2lsbCBiZSBjbGVhcmVkIHRodXMgYWxpZ25lZA0KPiA+IHdp
dGggUkZMQUdTLklGPTAuIENhbiB5b3UgZWxhYm9yYXRlIGEgYml0IGhvdyBleGFjdGx5IGFib3Zl
IHByb2JsZW0gaXMNCj4gPiBjYXVzZWQ/DQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBp
bnRlcnJ1cHRpYmlsaXR5IHN0YXRlIGlzIG5vdCBjbGVhcmVkIGFuZCB0aHVzDQo+IGlzbid0IGFs
aWduZWQgd2l0aCBSRkxBR1MuSUY9MCBhZnRlciBSRkxBR1MgaXMgcmVzZXQuIFRoZXkgZ28gb3V0
IG9mDQo+IHN5bmMgbGVhZGluZyB0byB0aGUgZmFpbGVkIHZtZW50cnkuIFRoZSBpbnRlcnJ1cHRp
YmlsaXR5IHN0YXRlIG5lZWRzDQo+IHRvIGJlIGluY2x1ZGVkIGluIHRoZSBodm0gaHcgY3B1IHN0
cnVjdCBmb3IgaXQgdG8gZ2V0IHJlLWFsaWduZWQNCj4gZHVyaW5nIHJlc2V0IHRvIGF2b2lkIHRo
ZSBmYWlsZWQgdm1lbnRyeS4NCg0KSSdtIHN0aWxsIGNvbmZ1c2VkIGhlcmUuIFRoZSBpbnRlcnJ1
cHRpYmlsaXR5IHN0YXRlIHNob3VsZCBoYXZlIGJpdCAwIGFzIDENCmFmdGVyIGEgU1RJIGluc3Ry
dWN0aW9uIGlzIGV4ZWN1dGVkIChSRkxBR1MuSUY9MSkuIFNhdmluZy9yZXN0b3JpbmcgaXQNCnN0
aWxsIGRvZXNuJ3QgbWF0Y2ggUkZMQUdTLklGPTAgYWZ0ZXIgdm0gZm9yayByZXNldC4gU28gSSBk
aWRuJ3QgdW5kZXJzdGFuZA0KaG93IHRoaXMgcGF0Y2ggYWN0dWFsbHkgZml4ZXMgdGhlIHByb2Js
ZW0uDQoNCkFsc28gaWYgdGhlcmUgaXMgYSByZWFsIHByb2JsZW0gc2hvdWxkbid0IHdlIGp1c3Qg
cmVzZXQgdGhlIGludGVycnVwdGJpbGl0eQ0Kc3RhdGUgdG8gbWF0Y2ggUkZMQUdTLklGPTA/DQoN
Cj4gDQo+ID4NCj4gPiA+DQo+ID4gPiBJbmNsdWRlIHRoZSBpbnRlcnJ1cHRpYmlsaXR5IHN0YXRl
IGluZm9ybWF0aW9uIGluIHRoZSBwdWJsaWMgaHZtX2h3X2NwdQ0KPiBzdHJ1Y3QNCj4gPiA+IHNv
IHRoYXQgdGhlIENQVSBjYW4gYmUgc2FmZWx5IHNhdmVkL3Jlc3RvcmVkLg0KPiA+ID4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+ICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAg
ICB8ICA5ICsrKysrLS0tLQ0KPiA+ID4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAg
ICAgICAgIHwgIDQgKysrKw0KPiA+ID4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vaHZt
LmggICAgIHwgMjYNCj4gPg0KPiA+IFdoeSBpcyB0aGlzIGNoYW5nZSBvbmx5IGFwcGxpZWQgdG8g
dm14IGluc3RlYWQgb2Ygc3ZtPw0KPiANCj4gVk0gZm9ya2luZyBpcyBpbXBsZW1lbnRlZCBvbmx5
IGZvciB2bXgsIHRodXMgdGhpcyBjaGFuZ2UgaXMgb25seQ0KPiByZWxldmFudCB3aGVyZSBhIFZN
IHdvdWxkIGJlIGltbWVkaWF0ZWx5IHJlc2V0IGFmdGVyIGEgU1RJDQoNCmJ1dCB0aGUgb3BzIGlz
IGdlbmVyaWMgYW5kIFNWTSBhbHJlYWR5IGhhcyB0aGUgcmVsYXRlZCBjYWxsYmFja3MuDQoNCj4g
aW5zdHJ1Y3Rpb24uIE5vcm1hbCBWTSBzYXZlL3Jlc3RvcmUvbWlncmF0aW9uIGRvZXNuJ3QgYXR0
ZW1wdCB0bw0KPiBjYXB0dXJlIGEgVk0gc3RhdGUgaW1tZWRpYXRlbHkgYWZ0ZXIgU1RJIHRodXMg
aXQncyBub3QgcmVsZXZhbnQgZm9yDQo+IFNWTS4NCj4gDQoNCkNhbiB5b3UgZWxhYm9yYXRlIHdo
eSBzYXZlL3Jlc3RvcmUvbWlncmF0aW9uIHdvbid0IGhhcHBlbg0KcmlnaHQgYWZ0ZXIgU1RJIHdo
aWxlIGl0IGRvZXMgZm9yIHZtIGZvcms/DQoNClRoYW5rcw0KS2V2aW4NCg==

