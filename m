Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051583986DB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 12:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135944.252300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOP8-0007xq-Ju; Wed, 02 Jun 2021 10:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135944.252300; Wed, 02 Jun 2021 10:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOP8-0007vX-GE; Wed, 02 Jun 2021 10:47:18 +0000
Received: by outflank-mailman (input) for mailman id 135944;
 Wed, 02 Jun 2021 10:47:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNrp=K4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1loOP6-0007vR-L6
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 10:47:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0eaa2fa-ae48-4cf8-bcb7-e511378e2057;
 Wed, 02 Jun 2021 10:47:15 +0000 (UTC)
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
X-Inumbo-ID: c0eaa2fa-ae48-4cf8-bcb7-e511378e2057
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622630835;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=cobCU152ENXwKaRO4mvTns1IADdxV/Nmx5grEVZNQzo=;
  b=FDhgLsprJJCtRL2Pd4KrrMcy8ACEBJrrUa3qkmxeXMj12LxJmq0b19UK
   red/cKsA1Rt+Mba+2kg92HIkUPjHbrS9qP9Nz+wM8/kSULlA1MGGrNOcd
   UgIy90B09sYw7x3zC+R54gWA4ierONP2tbXZ3KfBahVoGUnN4OgjVXN15
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pbVPiNFu6oGUuTXmt683ycVyo4Y6zbD4W+NcG+ugA2lkC+/VdK88ClE+jFkrssJVMHwpcCDmfZ
 PXHmoHt+CGIREXBO7NLLHXlvvB4LJYCVXGpSiaxF90drCwjU9KXGweGvKm49vsmWQG02NecIvq
 cjS+z7KH2R+yUralqyqQTH+HSKZqfKQhQuxUEjTvSLm2tKEfYepXh1g9yUZgR+lLFUB92mfKfs
 M+UGpYnw9X6svo48fT9HIAm+lSTIkMbHSCZbAxisLTGrL4IbnH+dK/iaVIy8Of6CurQYhZzPWd
 mRA=
X-SBRS: 5.1
X-MesageID: 46688963
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PawqB6B370ZoNoPlHeh/sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UwssHFJo6HlBEEZKUmsu6KdkrNhQItKOzOW+VdATbsSorcKpgeAJ8SQzJ8k6U
 4NSdkdNDSSNyk7sS+Z2njCLz9I+rDum8rE5Za8854Ed3AxV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3LsjmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlul9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4oow3TX+0OVjbZaKvq/VQMO0aeSAZER4Y
 DxSiIbToBOArXqDzmISFXWqlLdOX0VmgPfIBej8ATeSIrCNW8H4oN69PNkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5weJSNUZ4JouZ+w2a/phVFZ9l/1VwKpuKuZLIMs60vFQLA
 BkNrCR2B+XSyLTU5n9hBgZ/DWBZAVAIv62eDlKhiXO6UkkoJlQ9Tps+CUwpAZxyK4A
X-IronPort-AV: E=Sophos;i="5.83,242,1616472000"; 
   d="scan'208";a="46688963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8iQRV81/aTTyFZeoNv0AhiQqWAJtkbP+TXTVxQHrXb/xok92SOvI1auEnkqjp28VhYxtOUrX4T/bRjCSRjdvpovynh5y3Nn8TaCck4KalaS2r5iuEDwDCtn+Iusif1gy/q9UdFFSeOSXK731gba1rFoA0cbSFLwdhPal/wWCfZFNAOBTCEHqOdZOsAiQBr7RTb2ltBvNhYNHFJigbIA6IEveE/YzMZWsTVUuzbwlFLZBsLKghTRQs/ylNMUxAjaSFIJHQ3cAcJbixViQwJoa/Ua4AN+QvxcKkVMiGOs4RiL9e+pjFxE1GKnaBOKHA2gFiPh6hTPDMxGtyPYzbHfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cobCU152ENXwKaRO4mvTns1IADdxV/Nmx5grEVZNQzo=;
 b=V1Eua3sc4wwuGAuDHhm4neyJlwezGOJhnbQ2poJzh+PAdq8Gi9Q+70f2CZMEsa5ATEDd9ylafr+hXxV8XGLY9983eemFbIEDpjNV44w66M1Y3bz9fK8u1Y/3Zb35pR9Ec9zhLNQLuuNXRPV+RjHKXv+Sd/O6CY1UJpJrb9nIBllR8/oKNHZOMQmo2h9N10fHANuNXXM76UWRa1EWHSLrTdg5ZQiHtgKEeXYg/DWiYvqem0YmYAyzPe+kTilg5DZttcBh69EdxveyytsBpSBH7bXzxp/cAFBcgJ0pxtGvX1Psi2ubWIJHSfCtcgra5Y9ip0kuv2eJBvEtU2pfimDoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cobCU152ENXwKaRO4mvTns1IADdxV/Nmx5grEVZNQzo=;
 b=ZBGa440S2BCXjmeB5Npm6waJT0pLEMRTAQ6SJ2F6QwSvRna+SuniSMCxIg8Ryi3gRgtZNgDb4b8keUH7Su2JLZht5AHD580p00pyB8Os71GPKZaKRecfyS1GA5GdxLrYr3Gkv4s3AIHYrpLB0rOnP6hLsxfIBo5OWXVNdaLdytM=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ash Wilding
	<ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>, Brendan Kerrigan
	<brendank310@gmail.com>, "Thierry Laurion (Insurgo)" <insurgo@riseup.net>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>,
	Scott Davis <scottwd@gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 3 June Community Call @ 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 3 June Community Call @
 1500 UTC
Thread-Index: AQHXV5yhXZmHrohNzUKCYOYcvw+h8g==
Date: Wed, 2 Jun 2021 10:47:07 +0000
Message-ID: <A78C6A90-7F44-4968-8F0E-E044B0F80C1C@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4a5ba7-f659-4d9e-c943-08d925b3c472
x-ms-traffictypediagnostic: PH0PR03MB5734:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5734F2B8E89E1823F231045F993D9@PH0PR03MB5734.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1i01cG4xNkcEttkHzKCyup07XouCs5M/wEFihROyZOAXYbpzBFe+P/vP6Iq5iQKgH4CAHI9fWRMYMKLMp2XtAfe6rTaAc32ExjT+Jg5czip8hDBq52OmllDIcqSMF994DRCeLpfj1O8tnhHERXCr9iSeCTRSs24fMgnAC6AjPMFvZ7NnKUwPsa5dKlF8zTQlkw3lJHomdaXqJuumlal3MgFXi/oyhIzjWqfYMiF+ZtPKuAImb4nljntNliC4+klaYMr01dUQKHHPJXAtNtt6n3csdyAp3P8tbcdTvBQOFylpPpooiM42rCat/QxdU0HVkgNdlJGrm2LtqgSJIWhYKq4XWotbdmLJZsJ/geyu4/0QZTYneuptvRx9jcYqmuTLs+9G0bpimbjeuCu950t2NqMRy/7XZQ9OkSVoNP5bweg0CEviOfif/xAqsVmJ+bWoMIk6569wnnP1ZGuOj+Xaz1FvQwIkSQxwNJkZwqLCERARbmz/kfGggziOclgq2U+d50LK9zZnYMBhNdyj9hekKUQs3TfAn4MNgv3M/nIXKecOZz/i8PRf2ruAkZ0lQjFSb5Mhlw+AV0t9V3Dh1MfQDYj8J4SnrTxuNv9ZplmO2ODwI0bDfbpq7V4I1Z1B9GtHc0CKLpSSe7AOysFlk5wC65Ww64MluqIRpoQNkMgToZvcUQqEmSWl0zKcBrMdAq2mMR3VASvje8klxbPTjX+QuIEU+bGMv2ztNye5LXgWUNd7lbByyhKj9lV91uorO0TUc3RS5F45wZ/Q/d8SxxX1o19k7NmQBSZcem1kIe5tqWxEkr8BHrg058srT4sWV+J8Px2/QILlLeb4v+IPu2ckFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(122000001)(66476007)(2906002)(54906003)(6486002)(5660300002)(8936002)(2616005)(478600001)(7406005)(7416002)(38100700002)(316002)(6506007)(71200400001)(8676002)(26005)(86362001)(36756003)(83380400001)(186003)(4326008)(66946007)(76116006)(966005)(66446008)(66556008)(64756008)(6916009)(6512007)(33656002)(91956017)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VS84V1YvU3laUnRzZHliZlU0UEZ1NSs5TjNHdEZETmY4RWZMOUhRS0J6bkgz?=
 =?utf-8?B?ek5Yb3NYVU5odWxEZHBJcjVwanRXRmRjUmdEc081NDY2emg3QWFsY2w5VUNh?=
 =?utf-8?B?VU9EWmFBVDhrN1J1cnNlRDRId0thVDh3NlJLZXNicDY3Q2JMR2JIUFdTQ3lt?=
 =?utf-8?B?WGFJMzZOc0J2dlo5YnFlZ2pwTUZKTjVtRTU1SDFkdkdjK1F2L3ZiQ3ZCMkNI?=
 =?utf-8?B?VEVUbjZLUmNPVHR4bFlQZkJMbUZ1UTF3YXFnWjQvWnZrVUNGUE8wdEErS3g1?=
 =?utf-8?B?RStsTVJveittcWo4MkhscGNmR2RDNmdwMnliYzhEeTZ6NVFwQkQ0OHhqQUsw?=
 =?utf-8?B?bHY3ZnRENVZCQ0pMWTk0dFh1NG9rcmlSVGlTZjl3TzAya2ZzUlREK2NnUFc5?=
 =?utf-8?B?RUY4RmtjYVlRVjRCWGczakhQbzBIMndGaU9YWXVaWU9DMmdld09DYzl2c2tT?=
 =?utf-8?B?RkROcDFEdFpycFNlWWFYK3EvZ0FsOU0rN2YyaFFqRWx0WGNDZkg3MndBUnhW?=
 =?utf-8?B?U2N2dWdxWGUzVlFCMzBnQ1ZnUWxEY0FxYVVMU2NDay9ab1V3NzNJVHJ0RTdO?=
 =?utf-8?B?bG9IUFdPSDJ5UThuQm1qMEx3bDBTak5wM2I4MTdLUmFRTVA3N2F0UThralMx?=
 =?utf-8?B?dGZFUlJRc2tHOEZRTDg0QWUrTk1TVjZZWUVuWFFqOGY2M2lOZ2xncDJsZmpX?=
 =?utf-8?B?TzJ5YVFOclRnSk04WEdncWZta3lsbDdhTWJ6TDdDUE11dkN0NzRoUytER2xO?=
 =?utf-8?B?c0lHbnFFSlNISHpIaTQySG5rMmxjMjJ6VklQN2w3MGdmOUUrK2drRUVhN3FL?=
 =?utf-8?B?bkJMaXpqWFFMVXVBM1ZZMGpnNXI0OHJRZTVSVlUxRkhsZStmcUdUOTZmMGd2?=
 =?utf-8?B?a0k2OGJHVzlEb1FDakZqajNocDZib2F6ZktFa2VwVXBsNU5FUExObk9JRHNY?=
 =?utf-8?B?ellXeWZ5eXQvU0UzbEZ3ZVNkREs3ZWdVamdiR2EyNEdPb09MOWNnZFVWeHpR?=
 =?utf-8?B?bnRHRlRHcFhkN29weWx0MlBaeEJ2Yzgrc24zMjBrV0RoaW9sdHB1QnBmNGRZ?=
 =?utf-8?B?NHFWV1U4ZEF1aW15U0FLNHFlZVVLMDZQa01RalU5SVJlMXloK0wrYmlHVUlC?=
 =?utf-8?B?dE5qWDl4dlpHTzNlcHRmK3I5MkpLZnM0Y0VTTnI1Qk9MWi8vS2ZCdW1qd1NI?=
 =?utf-8?B?T1dkTG9MaG80SDVOUG5UWVlPeDVQWDhjL1RDTHZ2endNUzdZZ0QzWDhwVzBX?=
 =?utf-8?B?Mm9GVTc4bWVYYnZzOHpVZG5UYTJuLzc5VzBrWk1BSGxvZkIvOGc2bGx2am1U?=
 =?utf-8?B?WkpNWUVoL0FVVGF3UjRIVWJLbkJ3MTFhckVXNjVwd29BcVg0enVrSDZndGhC?=
 =?utf-8?B?dnpCc0FDczE0YlNuY1hPQ1VaQ1d0UVUxODBXRzFYVW43azMxNGJsRDhZWFBh?=
 =?utf-8?B?emRud09kdnhpaFR6YXFoVk1VQTI4b0JxWDRJaEtUN05DSmtDdlltTXp3cmhX?=
 =?utf-8?B?KzRJTW5xWmhXR3hLTC8yTk9RRmJ2SGRrMVBhcG1HUXpJUjJ6b1IvaVVhTHBP?=
 =?utf-8?B?dnZzUzNQdUMyNXdWYkl4UFZkNmxCZzRmbFRUZXN1Z3A3RklxM0xOQVc1WDAr?=
 =?utf-8?B?NDlLN0tkOHhyUVlUSFJlUXczS2ZsVVRXQVRWUVMybWF4NEZZSlpOdm9iR0tN?=
 =?utf-8?B?RU1Ma2x0cjJsTDE4azM3cXpON3VhcldQY1pHcGMrMnFLLzVCUzdyUERQS2NE?=
 =?utf-8?B?NXViWkk5cUNabUNqWTFEV3BwVHdQbEE3emdUckhoSWlnVHFWTEhCYWt4TFlE?=
 =?utf-8?B?MDhwMUpHNFl3SUlickRqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D86D25B801A8042BD23AA38C8D24525@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4a5ba7-f659-4d9e-c943-08d925b3c472
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 10:47:07.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+SxYwQrPNu1ZXLBa0+e7ar7EQjGoclVQ3osgEEtacr72e2bZo5OpCw8lnPW0QfeLni0x8dUGIsFJhMSd+gGl4VCIKsBuGr0oq9SEYLOpr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpJIGtub3cgd2UganVzdCBoYWQgdGhlIFhlblN1bW1pdCBsYXN0IHdlZWssIGJ1
dCBpdCB3YXMgc3VnZ2VzdGVkIHRoZXJlIHRoYXQgdGhlIHByaW1hcnkgYWdlbmRhIGl0ZW0gYmUg
bWFraW5nIHN1cmUgdGhhdCBhbGwgb2YgdGhlIHJlc3BvbnNpYmlsaXRpZXMgZm9yIG15IGN1cnJl
bnQgcm9sZSBoYXZlIGJlZW4gZGVsZWdhdGVkIGFwcHJvcHJpYXRlbHksIGluIHByZXBhcmF0aW9u
IGZvciBteSB1cGNvbWluZyBwYXJlbnRhbCBsZWF2ZSAod2hpY2ggd2lsbCBzdGFydCAyNiBKdWx5
IGFuZCBnbyB0aHJvdWdoIHRoZSBlbmQgb2YgdGhlIHllYXIpLiAgSeKAmWxsIHB1dCBzb21lIG9m
IHRoZSB0aGluZ3Mgb24gdGhlIGFnZW5kYSwgYW5kIHdlIGNhbiBicmFpbnN0b3JtIG90aGVyIHRo
aW5ncyBJIG1heSBoYXZlIG1pc3NlZC4gIEZlZWwgZnJlZSB0byBhZGQgb3RoZXIgdGhpbmdzIHRv
IHRoZSBhZ2VuZGEgaWYgbmVlZGVkIGFzIHdlbGwuDQoNClRoZSBwcm9wb3NlZCBhZ2VuZGEgaXMg
aW4gaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0LzNaaCtVb3JELTZ2VXJ3aGpo
UlZZeUhlOC8gYW5kIHlvdSBjYW4gZWRpdCB0byBhZGQgaXRlbXMuICBBbHRlcm5hdGl2ZWx5LCB5
b3UgY2FuIHJlcGx5IHRvIHRoaXMgbWFpbCBkaXJlY3RseS4NCg0KQWdlbmRhIGl0ZW1zIGFwcHJl
Y2lhdGVkIGEgZmV3IGRheXMgYmVmb3JlIHRoZSBjYWxsOiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBi
ZXNpZGVzIGl0ZW1zIGlmIHlvdSBlZGl0IHRoZSBkb2N1bWVudC4NCg0KTm90ZSB0aGUgZm9sbG93
aW5nIGFkbWluaXN0cmF0aXZlIGNvbnZlbnRpb25zIGZvciB0aGUgY2FsbDoNCiogVW5sZXNzLCBh
Z3JlZWQgaW4gdGhlIHBlcnZpb3VzIG1lZXRpbmcgb3RoZXJ3aXNlLCB0aGUgY2FsbCBpcyBvbiB0
aGUgMXN0IFRodXJzZGF5IG9mIGVhY2ggbW9udGggYXQgMTYwMCBCcml0aXNoIFRpbWUgKGVpdGhl
ciBHTVQgb3IgQlNUKQ0KKiBJIHVzdWFsbHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEg
ZmV3IGRheXMgYmVmb3JlIHdpdGggYSBwcm92aXNpb25hbCBhZ2VuZGENCg0KKiBUbyBhbGxvdyB0
aW1lIHRvIHN3aXRjaCBiZXR3ZWVuIG1lZXRpbmdzLCB3ZSdsbCBwbGFuIG9uIHN0YXJ0aW5nIHRo
ZSBhZ2VuZGEgYXQgMTY6MDUgc2hhcnAuICBBaW0gdG8gam9pbiBieSAxNjowMyBpZiBwb3NzaWJs
ZSB0byBhbGxvY2F0ZSB0aW1lIHRvIHNvcnQgb3V0IHRlY2huaWNhbCBkaWZmaWN1bHRpZXMgJmMN
Cg0KKiBJZiB5b3Ugd2FudCB0byBiZSBDQydlZCBwbGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2Vs
ZiBmcm9tIHRoZSBzaWduLXVwLXNoZWV0IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9w
YWQvZWRpdC9EOXZHemloUHh4QU9lNlJGUHowc1JDZisvDQoNCkJlc3QgUmVnYXJkcw0KR2Vvcmdl
DQoNCg0KDQo9PSBEaWFsLWluIEluZm9ybWF0aW9uID09DQojIyBNZWV0aW5nIHRpbWUNCjE1OjAw
IC0gMTY6MDAgVVRDDQpGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6
Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFy
PTIwMjEmbW9udGg9MDYmZGF5PTMmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0xMjM0JnAyPTM3JnAz
PTIyNCZwND0xNzkNCg0KDQojIyBEaWFsIGluIGRldGFpbHMNCldlYjogaHR0cHM6Ly9tZWV0Lmpp
dC5zaS9YZW5Qcm9qZWN0Q29tbXVuaXR5Q2FsbA0KDQpEaWFsLWluIGluZm8gYW5kIHBpbiBjYW4g
YmUgZm91bmQgaGVyZToNCg0KaHR0cHM6Ly9tZWV0LmppdC5zaS9zdGF0aWMvZGlhbEluSW5mby5o
dG1sP3Jvb209WGVuUHJvamVjdENvbW11bml0eUNhbGw=

