Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70769D5C3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 22:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498383.769232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUDdy-0007OA-Of; Mon, 20 Feb 2023 21:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498383.769232; Mon, 20 Feb 2023 21:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUDdy-0007Li-L5; Mon, 20 Feb 2023 21:24:18 +0000
Received: by outflank-mailman (input) for mailman id 498383;
 Mon, 20 Feb 2023 21:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0se=6Q=intel.com=rick.p.edgecombe@srs-se1.protection.inumbo.net>)
 id 1pUDdw-0007Lb-TP
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 21:24:17 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb375947-b164-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 22:24:13 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 13:24:10 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2023 13:24:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 13:24:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 20 Feb 2023 13:24:10 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 20 Feb 2023 13:24:10 -0800
Received: from MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 21:24:07 +0000
Received: from MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536]) by MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536%3]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 21:24:07 +0000
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
X-Inumbo-ID: eb375947-b164-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676928253; x=1708464253;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=K3K05a6gyOL/k11aIXAtq7ahCnYzje8Vl9Dl05sRF1o=;
  b=nehWu/RDGEn/woXyaPOWrz1x9yNCsnIABhGugbUYHAbKR+OoSAMc6Ur7
   MlKBydjHsw0Z89UQH0SFf1Ckd05PPFThUtPBrLe6d/u4xTijjog8kbIC4
   SgcoAm589ctTLQllDK9YAiQpThP20V2HqY7DjB0BRtaG7IDzdwhRh4/yr
   LQIAOgrl4/KuSem35Ptfo/0GqhhiuxvoBDJRXRJubAQX4RlGahUyYuoJ4
   zSw56IlHyFUt+TcfZ/dsgkjYauLt7krk24RmiAMrRvBUgCV/wWiaSg2Ym
   o4S47ab1XBGLvZiSwLUXH74DaOW5nKCsnx/vXEFCPWQ8fTNh2tNwiumbM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="331156677"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="331156677"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673467678"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="673467678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMuCjnReb2Y5U/d+g/8eTSKgvWQN9xcTOOrRs7UooaLxld4LeVb5jJYpl8mO+G3gytZJnbM/tvmEACq/jUHrQ/KLaaE0sZ4TX81nbkQ1u+dxUXYs+58FOqj4IdpEXr8AczJtTpe7rDL2XydYOJGqb6uegfWvABW56eiNvA5QFH+wFus539dbJf+ivYoDXnJLukmPvlrgFcmztAfmUG4LrQiZ3B+H/v3R6/acEOhzx47ljXSYFaGXap/O1KSKpDcYU6pHrHL16crg3jWwSCDXJXRhbaeiCLTJtQbiJrXPP1vjXaGPYQsbT9My8y7LZB0M2MLFOHAYDI0SbZIQ6q7dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3K05a6gyOL/k11aIXAtq7ahCnYzje8Vl9Dl05sRF1o=;
 b=GY9AhDOX0hkGGsxQjdr75+kG2IU88QqvFtz5iWuXVinm7ot/rm+AK6cIgtoNXFXnidbn9sJeTl8nFi2FeYrFffu0qf81ehEFMgX+nF6h9Hz1V6wmjL4wUVYzGre1iUKZnwfaRBb3JGoNqZQmEcVaOq8qNc8ZBJBphQD1/V260LN6qQMJFIbf2vBi7+kCeTo42Gcs6tLNvH6nQFxe7feUoITV2xlP07JviNjuDJ+xiVKxG2Um+dnf44H8d+7EbZlsnzm/pj9NM6uZ8YcLK7L+2+d8I4n5VxBxubFpd2rJxuiEzkAazknRWNNLH1l3D7aZ/mAQ66ZZg4q04o+ZVJ0ghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "david@redhat.com" <david@redhat.com>, "bsingharora@gmail.com"
	<bsingharora@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "Syromiatnikov,
 Eugene" <esyr@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>, "keescook@chromium.org"
	<keescook@chromium.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "fweimer@redhat.com"
	<fweimer@redhat.com>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"jannh@google.com" <jannh@google.com>, "dethoma@microsoft.com"
	<dethoma@microsoft.com>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "kcc@google.com" <kcc@google.com>,
	"bp@alien8.de" <bp@alien8.de>, "oleg@redhat.com" <oleg@redhat.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"Lutomirski, Andy" <luto@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
	"x86@kernel.org" <x86@kernel.org>, "Yang, Weijiang"
	<weijiang.yang@intel.com>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
	"john.allen@amd.com" <john.allen@amd.com>, "rppt@kernel.org"
	<rppt@kernel.org>, "Schimpe, Christina" <christina.schimpe@intel.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "gorcunov@gmail.com"
	<gorcunov@gmail.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "monstr@monstr.eu"
	<monstr@monstr.eu>, "openrisc@lists.librecores.org"
	<openrisc@lists.librecores.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Thread-Topic: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Thread-Index: AQHZQ94+cYJhrZsBjUaVUuq1nj/bS67XBcoAgAFVzAA=
Date: Mon, 20 Feb 2023 21:24:07 +0000
Message-ID: <d46aa53a3e7265facaaa3533b75ccd8d903cd32a.camel@intel.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
	 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
	 <875ybxywu9.fsf@mpe.ellerman.id.au>
In-Reply-To: <875ybxywu9.fsf@mpe.ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1392:EE_|CH0PR11MB5218:EE_
x-ms-office365-filtering-correlation-id: c9f5ead7-6de7-41a3-3638-08db1388ccbf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DUGxK4Preadv531pNjY5q3a2Jx+lCLmtVLQqroIQuyio6uCLucPpy1aolAsVnI9u6j07OJV6SYoQa0y4YrHBvaeoI6D7jemPvbIPwZ04plbHunbh1vxvi2rmi32u/c7bUXL4OhMlPIUjlloF33do4CV29bheBeBLhqccRT+CVnw1i5jGKxeDsoMnRdsLXOizMZ7zvuFO5J6zld6dv52HqqiZr4EoXB7EUTuNkI2mTDmxWggTzcNZz0j6rtJdrcmoBvjtj1xKzB3wY9fKolVz1FEk3VdUFC9lQED2Mvuq27QCbuLuCJJpISnJjnQGcPrJvGXkgAuMGtwx3H1kX8aI/6HlT/EJGTL9t2ZFbpTazvSWRtQDSKNWXA+0wpZOf3HBZs+5YKSZ3Dq5gfl4uES5lXe1KCIWhONPw0NY22IfryBgW17clWea3B3Ks+FKwW81/bLfcuYsLSur8uPiyzl4rM+ZPNrWF3Rc3p8mioIW7vfxrQXMa53wQ9JvkIncfhUMMJLP8vOClnFtfMT82VoV62ZWuEjLCJmRsppbq93hV+rfRAuKWXLYwnwiimpNz9WzPhjEc+qGsdq4p6tDGWWUCxMMBApZJR5UpuABztLWbP67ZsV+bHJ05fiUrB0i0UcIhjB73F+ExJbdAnYgGDycnlsJBQDq97cGW2lLLmlQD5LHBCD9KfghGfkD+0QWqOi3x0RCoadK7Qhgasj4xp46u/jsJfCezB2uRGyf5E/ylkoX4EYmEJt6y070SYv9uOQz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199018)(5660300002)(8936002)(36756003)(921005)(86362001)(38070700005)(66946007)(122000001)(558084003)(82960400001)(38100700002)(316002)(54906003)(478600001)(110136005)(41300700001)(64756008)(4326008)(66476007)(66556008)(8676002)(66446008)(76116006)(71200400001)(6512007)(2616005)(6506007)(26005)(186003)(6486002)(2906002)(7406005)(7416002)(7366002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmZxaktsT3RsWVhjcXdWMExHYTNldDl2MXNFN1llcjF6T3BMQ2dZcnJvSFRP?=
 =?utf-8?B?NjV2eW1ZMk91alZINXdFRVphcW9IbWhlMnFJblU5MzVJbHVmRnBhQXNnOTJQ?=
 =?utf-8?B?TmkxWGNnZlB6WkJtMlRqTU12WEkzVE5vU09lajRseVZEM1g2UDIyTnUxUW8v?=
 =?utf-8?B?N2NvZkdSWEpkU2lUS0dLaEdqa3JyTHNGWHJQMzUvRjN1dmpzUmJpclBQRGl2?=
 =?utf-8?B?Yjc1c05HZm1mR1loT1o2d0F4bE9HWFJUV2NWVnVoWitnMjBuU2pJRWJ6U0Rz?=
 =?utf-8?B?SkRmenNoOHVqeWs4SEFsbjhKUkI1dEZRdXNuWWg1N0JTZEI2K00zcStJNFUy?=
 =?utf-8?B?UENrRzhad2lQbEMzNWhZN055L2FJNEIvQ0hZRGZla0RkaDlhVzROTXpWM1kw?=
 =?utf-8?B?ZDhFcXVLb1haTDl4ZXdaRGN5TGVpdEFGdC80UFcwSXhsYTZTdnczV3pyYXNW?=
 =?utf-8?B?Y2toVG11b0s1R2VJZFNVaHg5emZnQ3JxOElSclpFc3R5UzZ6SzYrc0NHcE5Q?=
 =?utf-8?B?c3N6eHlXOUo2ZU5keStIMjVIUE9Ld1YreW5Rdm0rRHdiMzVxUFpvSzFUSEp2?=
 =?utf-8?B?aEhZc2RqcDROVGVraklYaDNGcGUvTlJicXpFR09IYXZQamtUMnZSV1VCK1k2?=
 =?utf-8?B?V0VOc2UxWWQ0L1JYQ1JpRlcvZkJGRkttMFlTVkpiVnpSbnBlUXhFNUhsZ2My?=
 =?utf-8?B?Q0p0YlVBMmxFU1phQVJ5V2dKekVrK2pOclRIMmRTVDNDVWYyUHU2SnBzckwr?=
 =?utf-8?B?SzNZUTVQZUpaUFpvV2Y4YVZsYlpWQlhaSDNqZTlWd1pwcDI1dTZ6RHFiV0p5?=
 =?utf-8?B?Qm5aMktlbWh2UDhPTUJHbmh0R3QyT2R4dU9aazN0QlhsVWZHZFdvV1EyUmJ5?=
 =?utf-8?B?ZDZuTHk2aU5nWlNUMEE4Vkhkd1dnWkhJSHRPQnc1UGs3MzBZZk9MbjZwU2s2?=
 =?utf-8?B?V3pnU2dYcTRwUmpvQ2NOekNBNDJaQmc1QjByREpRQTJJaHNaTGlYWXlnNGlI?=
 =?utf-8?B?TWROSERDTTdiVjl3OCtuWDhMYjlxQ0xldVlGODV1TlBVa3cvV1JNbGs4VUZG?=
 =?utf-8?B?WE1WYUs3V2kyRG10SEVmUkc0Ni9WVHZXb1hLTlJ3NVRaeWpuV3BIQXRFNkRo?=
 =?utf-8?B?cG1VY2IwMjlwclAySldiQ24wTEdudVFmdmQxbGVCUWhTYjhnSjQ2WDFSZkIv?=
 =?utf-8?B?dHNuQktXY0hGWUJ3eEx3K1ErcHpLOFVlWWxMRDBjYURWRCtodi9PTi8rUERu?=
 =?utf-8?B?clJlbFBiajNlWFNWdUZTTVFnS1VTYkxJcFVxZHJBVExXeEpWamNJMTdXVDNF?=
 =?utf-8?B?SzJqbkY3K0cyaVZ1WW9wWC9hRUpWV1Iyb2Vwb1FUNUxGQW44MVRlUnpZb2N2?=
 =?utf-8?B?UHVEQkM5NlBJOUVScXBNbkgvOFVNQXhwaHhUdWF4aHJteU43Y0FaeWgzek1I?=
 =?utf-8?B?MGNlQmIvcURDaisrT3BHR0VJYWlZT3ljTC9kTzNNUDdBVWJObmhpYS9NelRO?=
 =?utf-8?B?ZTdtTWFab3B3MnpwSmpnQy9oQlNVb0pqU0NKSVlFNnRSNHZaSFUrTHM4RWxQ?=
 =?utf-8?B?QTBPK3hCZEVTVTVtK0VZZTVhQ2pHbWRMS0NFc1E2Ny85SmZFZEZRQXlLZ0p5?=
 =?utf-8?B?TEp3ZkxXS1p6aDJ0KzFtMC83WlBEOXhqRWVPN0dqY3NUOUJLZ3Zkb1NkUTBa?=
 =?utf-8?B?Ti9ndVRNeHlXT2xKdlpOaFVjK1VCd2dxdXRyaUFqVC81UmdOQlg2WW1vQjJy?=
 =?utf-8?B?ekVTd3lpcWc5eERmbXh1UnhHa3hBNkQ2OU8rbDJnZTNPRUhnczhjbHdYVDRN?=
 =?utf-8?B?M1hta042MUprZUhBczJLQzZpQmYvcFpjTVcwOGJRWWpQSStiR0Z5YjNUeElV?=
 =?utf-8?B?SStaSVdSWlpuc0FSc0FIeHFpbmpIUStXWm5ORTQvMDh2eHVuMldNYXMxZk5a?=
 =?utf-8?B?ZW9ST2NZRjJseFh1eXh1WnNsazlMd3M5b095K2I1c1ppZm03MU5nT1FXOXZO?=
 =?utf-8?B?OWk4aHM1UncxbXNYeWI3NEVLVXJFMkwzYy9vTjBMcjVSbjdpalJSNlBHZm0r?=
 =?utf-8?B?RndUL1RIY3BpNHBsNlg2QjlTVW51aDEzZnFrbElwbW9Gek1rR2hOb0JZUFlZ?=
 =?utf-8?B?d0s2K0RDaHNFN2ZidG9wZ1pyTkhsaGMvVTl1OW9wWmpEK284SnZya1dQOHl1?=
 =?utf-8?Q?ux/kqtH8JCpsKqOd/3TJYSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C87D725E738A25438365E1A8F10AD517@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f5ead7-6de7-41a3-3638-08db1388ccbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 21:24:07.4464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54cgsuD1w09YcUpGG/uBlI9HwRVjLnV1XDNNgqKe59Hbm8nRBRGvj7DJWaxFIjNzEWIKUODZx5HIp4xBO/lyXB3V5avrmJ9sPAXOPDGPHzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDIzLTAyLTIwIGF0IDEyOjAwICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiBBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiAocG93
ZXJwYykNCg0KVGhhbmtzIQ0K

