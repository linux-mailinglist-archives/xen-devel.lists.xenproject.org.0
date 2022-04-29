Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDC514B91
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317359.536649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkR3n-0000nd-Ct; Fri, 29 Apr 2022 13:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317359.536649; Fri, 29 Apr 2022 13:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkR3n-0000lA-8D; Fri, 29 Apr 2022 13:53:27 +0000
Received: by outflank-mailman (input) for mailman id 317359;
 Fri, 29 Apr 2022 13:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5vS=VH=citrix.com=prvs=111d7c57d=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1nkR3l-0000l4-75
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:53:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbb8ffd8-c7c3-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 15:53:23 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 09:53:20 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by MN2PR03MB4880.namprd03.prod.outlook.com (2603:10b6:208:107::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 13:53:18 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::d49d:81a4:d819:f0b7]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::d49d:81a4:d819:f0b7%7]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 13:53:18 +0000
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
X-Inumbo-ID: bbb8ffd8-c7c3-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651240403;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=PPiJeAhnisUHiKxeeNNo+S5piX9KinYgaxBep2dSmZA=;
  b=THC2VMDRxQoot0ATGe9LTvOtbDKOEBt9D3I2docK3YpIr0LYGTKXRt/S
   zEDQrSE2cTvILLAiR1LfRlK5HukRa52na/6jvl/ldG1kwZerZyILUJUAy
   qdsYrz06BweQhROovv3JV8njZDcxt/xtq04ed9oTwk8L9aWG7l7ptumvE
   Q=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 70256599
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W2IkB6yhmtB/D6fyRmd6t+fsxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 GIaCj2EM/iOa2v0edAiaITjoRkAu8XXnIRjHVA/riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY024nhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllpbodCIMee73hstEcF4JFxFmNvx/weqSSZS/mZT7I0zuVVLJmqwrJ2ZveIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHeOTuoIwMDQY36iiGd7VZ
 9AYciZuZRKGZxxJNlYYIJk/gP2plj/0dDgwRFe9+vJtvjaOnV0ZPL7FCcLFPcaKdcNuvmGhp
 zLp32XBOBMVK4nKodaC2jf27gPVpgvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 1MQ0jojq+417kPDZtvyRRqju1afowURHdFXFoUS6guA167V6AaxHXUfQ3hKb9lOnM0rQT0n0
 HeZktWvAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/HvqZ8+pgjCRdFiFOiylNKdMQ/3x
 zeGvS0vnYI5hMQA17i41V3fijfqrZ/MJjPZ/S3SV2Ohqwh+PYisYtXx7UCBtKkdaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhkkTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:Fk2l9KsYtoMUfNmXhQfRdwEt7skC9YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H5BEGBKUm9yXcH2/hrAV7CZnishILGFvAH0WKP+VPd8mjFh5dgPM
 RbAuJD4b/LfD9HZK/BiWHVfOrIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcWeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlIawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbonttrcZrau5V+7f63+4gowwbX+0WVjbFaKvy/VX4O0aOSAR0R4a
 PxSl8bTrlOAjXqDyyISFLWqnbd+Sdr4GTlzV+FhT/mu8L4SVsBerZ8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJmdXf2eP0A4feNQo/gtiuEolGcxshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1+7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyXwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W1bLqZjx9BR6vDM7z+4HQQyGGyfIyUZ0Wc9v1j
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208,217";a="70256599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUFt//iQEM9mi66Zhx55a8ppvUqGz2wnuRQruz1W6SDsYNVx5RIP+2/t+ZqlVkFP3WJ9vGTxUvFcKnFu/FMZ+OnegySDgVlsrGb778NHBcQTtIlseyMhjFxlYBSLu+JssJlcY94fvKsQMM/lVDicoXLUqP0zDAxftbxT7nhH28RwH49ot18GcqfVP1AH4ASxQR/dnKFuQ8buw/Bpm6yvXPch4W0CyB23891VoMAVL9ds+xYo+M2nDq/07sIYmH0Xey2UY5yPbhbTCvAqjsgSWFwANXTY3qgIY9EtNoLXQ263HY5agdAnueE1I2dMyll3aPOKj+gSWcJlRYk9UEPRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPiJeAhnisUHiKxeeNNo+S5piX9KinYgaxBep2dSmZA=;
 b=mfeja/x/RGdUi1Q0eGLXAI8dMMs0MYJR+y8cWmbJppu3iCm15kZAG+/VU8X+j6Xt5T19QgB6Pa7uuzp8DgQdDfmkvx9cVoEyfelVrhsuQHGpU27qYwU8ccqC5j2hL9y8H2PvOlZJdYBqhbMFHuWK3/6QKsKiaAx1a3YUuGSk5gQ1rjOzRP+rkTNgQ80BnJWtup4ZHzVqYDGU4pu/z5ryPFhrhL+mhmAuA9FjlnfZEKiWF4oU/fSRZkG1In9RTLnSYlS/Mh/E4/LOCjjJ0YeH+upeiR9EnEyrQcd76qJLOI1PS72dmRa7+FImxVee1YmPkPdTDA93uoB8v4zO7AXiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPiJeAhnisUHiKxeeNNo+S5piX9KinYgaxBep2dSmZA=;
 b=glzf7FXzpHVV97nvDeLOcej9/sJJpD9n5ReklxjjJxAcgtpMb1kd+9APzfie2SOpd9RHFyfE/TY0QHhkgeJI1mLoAzTPavEiwYoIhQ7bvdwuY+NXDytMb2Fu2ck/Osb984PNMFhpnq7+cuRAhIqcz1TTQm0g6ztvnRze2u5NrH8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v10 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v10 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYTyjL38kQmqRZL0SL+QslP1pV6q0HAqQA
Date: Fri, 29 Apr 2022 13:53:18 +0000
Message-ID: <9C41A8D5-FE5F-4713-86F4-780EE20F9103@citrix.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <20220413112111.30675-3-jane.malalane@citrix.com>
In-Reply-To: <20220413112111.30675-3-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cc7c2f3-2784-4ef3-669e-08da29e79d92
x-ms-traffictypediagnostic: MN2PR03MB4880:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <MN2PR03MB488023516C74E6943DD4B3A8F6FC9@MN2PR03MB4880.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YI8DSINnUlerPYjF1yaZ8dvPNZs/m0lOv5G0EczMQ1myNiy62tkiBmfz+0uoAeMDgD60tts0Ok0WBTLZttUBbfxZ0tHqer6u/yDpGtS2X9cuxDTapnh0IEGHeQ8CGowkDdYcgYzGD0b4Ylo2EENylRXDhCsxudgY40orO3FqTZBhNHi0pjUQiC5yyxWwNgl0ZKN9gDU4wEZmLHEDGGLXidG46uZSVVvRYhM8YXn1Hz9jsaTADawY0G0xveU39LPy88CzL08Vx19rhXRJkjqbOu//Vwaf84DJjBY6UGoTdwXTX+sS8aC5MzH6MoDz7qHmXOajWU0Ou8/MO5/3/RwKHv/TJPokrRZd/nDoy1qb95SxQNmeKZ5RfQEBpBskZuKbVxrHXZ/FiEvBNE4azLRciDJTgJ9LZIjHXInvDn5b8NLu9eLrlHm5qa4NOLK6hjoWxKAXYs02ZT7zJSyvmAvfi5JqlT2M0sK7pHY0ExEgGBJ+vRDb+OgrkLlT6E/3VjZjx9aJdvzKnGwZVTDVrL+Yia65tIi67KtG9CriAARNMsAxnNLT9w4WDz0FqL2eunZg2LEvNHc40J2m7ipeYl5dsvJUL4Hyw2iBJ94kdpBmwTH12NO1kkHkkcI7LKKPEJl7Hu9uaBhN9V2K61m0H265g4DwrN3VkYLEoC80YgUHF9792JQASF9gSaiKkR+cLanz6GHvnErMZ29teg9dGQumHQeXKh3m9V/iq1IJSsazHII=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(107886003)(38070700005)(38100700002)(186003)(82960400001)(6512007)(122000001)(86362001)(6862004)(66446008)(64756008)(76116006)(316002)(8936002)(8676002)(66476007)(66946007)(66556008)(4326008)(91956017)(4744005)(44832011)(5660300002)(2906002)(36756003)(508600001)(6506007)(6636002)(53546011)(37006003)(33656002)(6486002)(54906003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3JONFZtd1JvcFVlNXZ4cTZmeERJWEVSOVdCckpBb1NHdkI0RDZrb0dvK1F2?=
 =?utf-8?B?R0pnYWw0TWREMWR6d1VLQm55SFpuWWhDbkN3a2Z3NmRqRUJsN1Z5aytObHpU?=
 =?utf-8?B?K0tQeWxjV09nSXpjTGtNM2hLeGFUeE1sbWZ0TnpQM2hBWSs0K3NhYUhVUTlj?=
 =?utf-8?B?dlp2RWtvSmFHbUJ6S3ZvNkZDMkU5UDlFeXkzdTdvSUpkR1IxNUVZTjVPSzl2?=
 =?utf-8?B?NlRTRmpVNnBidHhLLzNhb3JpL1BXSWVuRnFTL0IvZW90dkRiejE3T1BCb2NX?=
 =?utf-8?B?VGFVUGJSU1cxWkVnU3dnTFlBbmtxRXNmdEI4S2djaWgrRkdTb3RyaHV1THhG?=
 =?utf-8?B?dmhxTThpeG1ZWnVkajJYcC9kTHpIR0Vmbm5XU2hkMUp4QUVWdnJldFZod3RI?=
 =?utf-8?B?a0ExQlVyL3JQZHZ0cU05QjBDWjhYU0V2QVJCVzExVmZsVTAydHBYYktodkNq?=
 =?utf-8?B?MC90RzBDRDllbWhEU1Q3UkdFNnN4K1BHUkRsZlBPNWJ0UzR0REJwLzQyL0pP?=
 =?utf-8?B?LytBRlVhQ3RPV1l2Y0JTaGo3RCtmZDVlQTFrZzVpV2tKejNTKzgyR0ZXUnBm?=
 =?utf-8?B?WGFqeFZlT2NpN2xtRzAzdDNlZjFKYW9jU2lrUG9EVUFWakhEY2JVcnNzeUpN?=
 =?utf-8?B?RnJkcWZQMzRNSHJpZHhvUFI4dGJJUnN0SVZzblU0NWx5KzNzSE5LNHZ3M0Ni?=
 =?utf-8?B?dzNKRkdPUkRkODNlb3gzZ2U0MG11TllzdnIyL2lRR2VwM0FEZDNJMHRBMUZ1?=
 =?utf-8?B?eGJ5SWZhaWV2YTB1N0dkc2szYWZiSEJER1ByTXdGTEF1L0ZUTTQ3djlLRlh4?=
 =?utf-8?B?NGhtWUZUUDhqVVNFZHlNK2psaENDNkhGd0d1dWcyc2h4WEdIVDhHbEYvOEpH?=
 =?utf-8?B?UVVPck9RZWE5SlJ3TDlPVzJ1cmlWa3F5ZWJ3VTQ2MU93dzJCMWZCdWdmQzQr?=
 =?utf-8?B?UVdLcnQzWEl5R2xFdzNaYzlBQXNLdHNBMkJxODVPUlRQckJLeHlnTTdicjdn?=
 =?utf-8?B?WFpVWlYwZVRnRmk4MUw4TXVNNXhsT21SWkQ1RFJqR1dvUUt6VXM4SUlMeHI4?=
 =?utf-8?B?WHZuaTR3TFZtY0ZMSUk5ZytzQUFheDkvMEN5QWQwb3JPaHEzZVY5RjJYQ0wr?=
 =?utf-8?B?clZleW5BZ0FFV3JqUno0V0k0UDZXMEhSdzVSdDFEcW9YQk84QXBtZUFsc1lV?=
 =?utf-8?B?UDExb0F4QUNQODNtQUtpZnFhVmxXU1c2ZVVRT3Fad2VETm1DZG1zeVVzNkkz?=
 =?utf-8?B?dEJUTkhCMko3SUFjNEZkelFBb3Z2UXNydG9HQmlBUGpSYTRFQXNDTVpscG4r?=
 =?utf-8?B?dFhFUHRqZ1NSQ0o1akFIS3h5L3hHOXZ4K0JCVzZ6MmJWQVZ6ZnZZMldlUUIy?=
 =?utf-8?B?VTE1SEc3NkJnZFFhTXJBYUpWZnNTYkcxTFdSUVRXcXQ3QXNzeWxOSDJ6UXhv?=
 =?utf-8?B?Tm1UYUI4djBLMmp6bWN5b25lT255T04rWFowemc5K1dlVHAyMk9laEtBR0lx?=
 =?utf-8?B?Q2szcVYyV3cxOUZuMzNVQXVVWURLUjkwcUM4V1hRYjk5WHZZZHExSmJVSEhi?=
 =?utf-8?B?UFM5NDdBVTE0VWEvaW5aRHRrbXovVFhHYlFiemJKa2ROTk50ZnRGWHovN0Z0?=
 =?utf-8?B?THhta0N0SHJlbXY2OGVQMHZld1ZheUp6UUI3TzJ0UE03SVNDalV3cUc1UUN1?=
 =?utf-8?B?N1lGQ212bjFxVFVvbnhXNENwMjRFL2grT3F0c2huSUwySjAyVEJQemtzc2FS?=
 =?utf-8?B?WWZxUklQZWpZazV5T2ZFQk56SHNHLzFFUDVuTVM3ajdkNWJ0bUI2RTgvM1RP?=
 =?utf-8?B?TzdINndxMElwMUowenNWUXZwM3hHV1VzaDFhYldGV3RrbFF0SWIzZ0dzVWRO?=
 =?utf-8?B?K3Z5b211V0lJc0oxM2FxaFVFdHdrYUlqRE96eituck94aVMzOC81SW16U29l?=
 =?utf-8?B?M3YxOFZ5SXc4NGZ6NjBIaUEyTmRwelpDZXhDN1BwMWQ0NTN3V09CYVB0TmJJ?=
 =?utf-8?B?UldLTUZRWUdCbm9HZ1gvSnhBZDNzalRaWVVrd3labDJWdWtDdmZ0aUpzSkds?=
 =?utf-8?B?OEoyaCtlS3g3OEtCaWNML1dHbGdnVWxMbE5xak9LMlNBd3luVWRka0FCbVlL?=
 =?utf-8?B?Sk1FQUFaWm5FZWhva1NOTlJ3Ymh3OFpkVm11ejFrN0tkOEpFazhQN2ZIMUpr?=
 =?utf-8?B?MkVtRjQvbVpKZ3M2SXp2VG0veGhpQ0FOSSs4cWQvYXRpVkQvV0dxS2Rsbmpk?=
 =?utf-8?B?eERHYVhKaTgxRkhqYUEyZldKRGxzUHVQSVBDdjRUZ1BwNjZ5Y2RtRVBGczRD?=
 =?utf-8?B?YldFZERwUWt0ajB1bitFQUhrdlJDaUQreUl4YjZ6ZWUzeUJKUWtFTzV5SVNi?=
 =?utf-8?Q?71+V4WLj7Mm+U3wtbOxyYD3NPVHkEJEuBZJoe?=
Content-Type: multipart/alternative;
	boundary="_000_9C41A8D5FE5F471386F4780EE20F9103citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc7c2f3-2784-4ef3-669e-08da29e79d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 13:53:18.3991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yAhTpSduP102N84dKCR+Agl9FhuonoQafLscKGVT6C/50vEvpS+FwISrLp1i5a8MCfbKPn05IZCskNmXCkzPo4T+qW2cmrthAtqw40POW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4880

--_000_9C41A8D5FE5F471386F4780EE20F9103citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDEzIEFwciAyMDIyLCBhdCAxMjoyMSwgSmFuZSBNYWxhbGFuZSA8SmFuZS5NYWxhbGFu
ZUBjaXRyaXguY29tPG1haWx0bzpKYW5lLk1hbGFsYW5lQGNpdHJpeC5jb20+PiB3cm90ZToNCg0K
SW50cm9kdWNlIGEgbmV3IHBlci1kb21haW4gY3JlYXRpb24geDg2IHNwZWNpZmljIGZsYWcgdG8N
CnNlbGVjdCB3aGV0aGVyIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uIHNob3VsZCBi
ZSB1c2VkIGZvcg0KeHsyfUFQSUMuDQoNCnRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAg
ICAgICAgfCAgMiArKw0KdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSAgICAgICB8ICAy
ICsrDQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgIHwgIDIgKy0NCg0KQWNr
ZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbTxtYWls
dG86Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPj4NCg0KVGhlIGNoYW5nZXMgaGVyZSBhcmUg
bWluaW1hbCAtIEkgaGFkIGFja+KAmWVkIGFuIGVhcmxpZXIgaXRlcmF0aW9uLg0KDQrigJQgQ2hy
aXN0aWFuDQoNCg0KDQoNCg==

--_000_9C41A8D5FE5F471386F4780EE20F9103citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CB33BEFF607D2B488E18EF9FAE36BBA7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDEzIEFwciAyMDIyLCBhdCAxMjoyMSwgSmFuZSBNYWxhbGFuZSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OkphbmUuTWFsYWxhbmVAY2l0cml4LmNvbSIgY2xhc3M9IiI+SmFuZS5NYWxhbGFuZUBjaXRyaXgu
Y29tPC9hPiZndDsgd3JvdGU6PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5l
d2xpbmUiPg0KPGRpdiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+SW50cm9kdWNlIGEgbmV3IHBl
ci1kb21haW4gY3JlYXRpb24geDg2IHNwZWNpZmljIGZsYWcgdG88YnIgY2xhc3M9IiI+DQpzZWxl
Y3Qgd2hldGhlciBoYXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbiBzaG91bGQgYmUgdXNl
ZCBmb3I8YnIgY2xhc3M9IiI+DQp4ezJ9QVBJQy48YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+
DQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7fCAmbmJzcDsyICsrPGJyIGNsYXNzPSIiPg0KdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1saSAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt8
ICZuYnNwOzIgKys8YnIgY2xhc3M9IiI+DQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYyAmbmJzcDsmbmJzcDt8ICZuYnNwOzIgKy08YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ibG9ja3F1b3RlPg0KPGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2PkFja2VkLWJ5OiBD
aHJpc3RpYW4gTGluZGlnICZsdDs8YSBocmVmPSJtYWlsdG86Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tIiBjbGFzcz0iIj5jaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208L2E+Jmd0OzwvZGl2
Pg0KPGRpdj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXY+VGhlIGNoYW5nZXMgaGVyZSBhcmUg
bWluaW1hbCAtIEkgaGFkIGFja+KAmWVkIGFuIGVhcmxpZXIgaXRlcmF0aW9uLjwvZGl2Pg0KPGRp
dj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXY+4oCUIENocmlzdGlhbjwvZGl2Pg0KPGRpdj48
YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXY+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2Pjxi
ciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGJyIGNsYXNzPSIiPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_9C41A8D5FE5F471386F4780EE20F9103citrixcom_--

