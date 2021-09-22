Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750924143A1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192238.342592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVx-0004fu-Dc; Wed, 22 Sep 2021 08:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192238.342592; Wed, 22 Sep 2021 08:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVx-0004cs-9E; Wed, 22 Sep 2021 08:22:01 +0000
Received: by outflank-mailman (input) for mailman id 192238;
 Wed, 22 Sep 2021 08:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxVv-0004ME-Tr
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:21:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65313bd1-3416-4a6e-8629-818319798ff4;
 Wed, 22 Sep 2021 08:21:53 +0000 (UTC)
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
X-Inumbo-ID: 65313bd1-3416-4a6e-8629-818319798ff4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298913;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=seIBbqCeK4oo8fY2b3scK6+3FGPIRwYLW3Z4LyHTtj4=;
  b=QrfqTIximE/RIglQYLhumdSR5lP1LJ+OiW2GGZxIeqVxOquymtV5LZzX
   2vofq3OUzmWfirRf/eEczsdq/cdbhOeTCVFNI9KpNoPcHaJ+1b1YDssta
   e7v8LQCkLGaKmOPJVlYEqlk8u4kQLyPwU0TZ1aA5070FuBKvkCYaJQvat
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bR8K0e9YEc+iFEspSZ1Tta/JqIvGPQAjMQi172goDltYNV1zO85CKckGdejIjigVVNfSvrInrs
 iMX/rapohJe7lAyGvYQ0Cpug+K0rdWZUv9o6n4RZ7o2AcAZbZLPgglDQuMRY9z+pKe6sg0NM4f
 xLE+BEyib29BugnCU6g46WutWQrod9L9lBMxpbW9iSEBXNKzGvio0+PX4IypGGr613SAFI/3E3
 kd6JK6LA7McDC7zlKwx2xNM2D8ps1W4ejumixwJopXfoe95leH1lcKOnl727wIKivnNFziTxyH
 2rNOVpmtZDsFa447xSbwCwS+
X-SBRS: 5.1
X-MesageID: 53713429
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FgLS0qhpfd7Yws9D3KnjeTlcX1618BcKZh0ujC45NGQN5FlHY01je
 htvWW+DbP2CZDH8cognOoux/UgA6pfVy9RrTgFo/io9Q3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1LsMOVYy5xBJfAic0xCBtBCGZxI7xZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t3Z8XRqqEN
 qL1bxI+NSqbPUcMIW5NI6sgmeOxqF/hcxpx/Qf9Sa0fvDGIkV0ZPKLWGNjaYNuRXu1Og12V4
 GnB+gzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasvAMYWtdWO/037keK0KW8yweGBEAUQzhZctskucQqAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1RYov6QqaBsWLh4edpAN2bV0LGs
 2YVhJ3LhAwRNq1hhBBhUc1UQurzvqbbbGWF6bJ8N8J+rGX2ohZPaagVuWsndRkzaq7obBe0O
 Be7hO9H2HNE0JJGh4dMaoStAowByaH6HLwJvdiFM4ITPvCdmOKBlRyChHJ8PUi2yyDAcollY
 P93lPpA6l5AUsxaIMKeHbt17FPS7nlWKZnvqXXH8vha+eDGOC79pUg53KumMblisfLsTPT92
 NdDLcqaoyhivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3QOyg/N+uwDcggxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxEBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:b3zhJ6zQitekjyh6jdPKKrPxyeskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8O3WBxB8bYYOCCggWVxe5ZnO3fKlHbak/DH41mpN
 hdmspFeaTN5DFB5K6QimnIcKdf/DDuytHVuQ609QYLcegFUdAE0+8vYTzrb3GeCTM2TqYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYpYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwDqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G3Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnp
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvs3+9KK1wXB4S1bpXU9
 WHVKrnlbRrmBKhHjzkV1BUsZ2Rti9ZJGbCfqAA0vblpAS+0koJi3fxaaQk7wU9HakGOul5Dt
 L/Q9BVfYF1P74rhJ1GdZQ8qLOMexTwqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53713429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pv7qv3PcoEO7ALpeRCQLQsCrbfndwXqaLmUr13iJncHUfGXDZ94skB4HbmDgCSNNs7Ya2LeCCK3TxOzeTc6iQAdGXDGoucDgkVLwlf1KoeOoJTrPmvy2ai16It+xYycGtPUOpTWqH1UsdHWaWMPZFvOAOZf5BigYGwT50hMXZ18qWklWSjhax8Yr7j5e/OvIVj4CnmyVU0phwV/d6fMGqvATqZLsf0VxsSwuGRbMoPqeBVK7S45zYRSYdT0ZskUgTGDav1qJOL8Pa7bY8dmr9y2evXOdbHjZKndCLdZXup7yWSTKkRW94r63qHP/8jCDZDV2XTpRIdNzem3Wy3sMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oiIt5T8yXl8QFjL3/Lj8D33A5BGL+AQDPrB2Sf4vjAM=;
 b=B6RQjBW8EzWBi71GSmsHhMQL45/yQWIxAxU/65A8CtEG+AplAa6t+DcJgvn4aEThkxu9EUYlyR2opO9s1/T/clgaC+Bpb6ks+V/sYiV995tzQIyF7IjrSnnMgn3HdpewRuU89u7cW0Mu1nGYnJneaUqSIuwxo5rAZEHj0oIEdP3WoqAHqdDMMsd1ePf9C85bDYacGsDSiaRIY3w65UuXbgVguV0kIYBrWI6Wqr9e5VX/NYKkCiijIC60y6lc8Bx3FMgtmc3r7Q6L05qWZGQOd/zRV53A0JYJ8m6T6nJeAcsM4NM6Yqfz/6BcPwHPaLcWh4Pv8FDQs44YPxa56jxTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiIt5T8yXl8QFjL3/Lj8D33A5BGL+AQDPrB2Sf4vjAM=;
 b=mAIMDMJyXRcNZl0L9u7nXMiPkCxLYSeTrCamDmHKxlztIFiMKL5Ic3DD3yB80K8A7ZwJS/43l9rhp5uUBp1SRo6miFD9CTcRchLD1mf1kZmdOg9mwT36tlcrEoo4hG1gkxsIIgZ2klUx4qUtk0Jk0aci+7Sj5yCUu2akngg1LIo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/6] gnttab: add per-domain controls
Date: Wed, 22 Sep 2021 10:21:17 +0200
Message-ID: <20210922082123.54374-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a11df1b-34ac-49ef-20ab-08d97da20266
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB40153A5DC75007CF1C5EB6538FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3sbx9ptMvJ51xMvcIB3C+1a4CQ3aDvwmFDj7vXUVotfldhRrr7eFVWJ+dIpHmqfxWoCHRfXzldCCMflRYcI8wk4q5r9qr//5T8VOIvqJtnzM89j8wlamhnE4WtFKrIztc/VgjJgxILibNWIK6LjgadtV6MT5qpsjtxk222xgOMRSOnPsgeXhE79bSmAlkc1PE2r4QdkTNhZC1H+uuTqPKCYlRh6mU+BQgIebPwLmwEWhnQmcqY0Vd5hlnLKMHIkcSeN9hDXky63Rhf6eupuiy5OH+F6Fajx0HwJtGmgEpbnkcallAd2gBsd45w8nGZJdcj/9g9dbkbxiXB+llEyQFup/jhf49/+hzigMtJJVAp36YXl5ugTu+Wpsh4yTjMn2aulUSzZF/cJe0C+pUiPhi7tHUP3DXLB5JevZdJ1HTPshOTduRqVSQoClpjOAp33b7nnlcZOkGRxkeZSt+QlQ9jOEbytQly03zKKss/bHzKRN4EQryvDicDAMKlAhxYATG1pYQp8h8ly+31CjfdJYqVKMHSeJ9agN9VC+wkSK5RmJmyKkFGW0OsomwfqetDh9rrraAmF3iz6yKsVVT6VvZGKsF67oTLKQU0fvoEfbXWjpqCJnJ4xWbaw6lquzCW9Nxzz5/VT9HTKpLlSvbCAUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndiSVBzaiszNHorbXdZdjJ1dlFNQWlFQ2tFcWVZMVFkMzA5RENZTmtoNmdH?=
 =?utf-8?B?ckdDWGFTUHRiSU40T21QcGJOdWFjTTJFajMrYUxPdWY2SVdJV1NMcTRQTWk3?=
 =?utf-8?B?K0hhQUhhSTE2bGUwaWEwSTJlRCs3OUVkTHpIUXNMZXRyT0lPOXdnNGFuTTNG?=
 =?utf-8?B?b1JycnppNDZFdDJ6WmxrVUkzRFYyb3ZUSXRQdm8wd2JDQ3VHRXVBbU5xQldZ?=
 =?utf-8?B?MWc4QkhuSFNyNWcwbW9vbE1mQWJ2NTBXUmdxRzZYbWw3cVplSzE3VHZLczl3?=
 =?utf-8?B?ZDdvSm9aanJ6L0tpdTh4L1I0aEpkbDFkbFhlcFh4b2tWaWc0bUNrR2VGN0Vl?=
 =?utf-8?B?WGZiaHZzV2hGenVjMzNxZVZDNngyM3dBcWNWckkzbVhJSlRWelpITVczWHJP?=
 =?utf-8?B?N0VHajk0RUNvVEtUd1IrdUhsUzBmZzFFbnJFSjZpYnZGR3Fic2JQbVBPbW90?=
 =?utf-8?B?SW4vTEFzWC94YnozK05KbTAvaXp5MS9USDVLRnZvcllOQzAvZnc0bi9IRTFY?=
 =?utf-8?B?WXBEVnh2UUxsaWVtWmJSRDM2RDRwTVpBUGV4RXVZYXdremhLTWxSWkdDNEM4?=
 =?utf-8?B?N0c1ZVcrT0cweUllbHU3TkszcjNKbzZDY1F5UTluZTZrNzhTQzRyTHF5RHh0?=
 =?utf-8?B?TUVaWUdwTmtmVGxxalFUemJSK0wrbFkyZXh3NEovLzd0ajRueFljRW1vb2dv?=
 =?utf-8?B?bEw0MkJMSlhDUGlDRCtwOXplZEdHc2JpZ2hOTDJSN2VQT3JrRW9xTWQ4OEtG?=
 =?utf-8?B?cm9QUGFkK05PRkhOME8xcHgyY2NaaDYxN3pTdnE0em5sM3Fqelg3dk0zY0Fj?=
 =?utf-8?B?L3JsVHFoa0EweEVJNGQrenM2VVN2NVY1Z2Yyc2R3RXV2T0RMMGVKMmk2OUJi?=
 =?utf-8?B?dUcydzB5dHlWWnlNYk9rS3o0VE5seW9IZXBJRWNPUTA3aHNRckZJSERRTWNB?=
 =?utf-8?B?R3p0MEEvc0dTWXd5Yi9iVzhHTW9ldEw0ODlMMUx3UlRaUVJCWVk0Yk1OczZM?=
 =?utf-8?B?bmxrNHlqcU8yRHZhUjg0MnJEZS8yZzJ0QklPcnpMZ1FQSXBvbERWUVFOZkYy?=
 =?utf-8?B?RG5XOTYxOTFWelMwRWxGakdOdTVzYVpPQXRSNGRWNnpHQmhsNUdCdnRlQXZj?=
 =?utf-8?B?VVdkVlFFM09uZXo2eFFucWM2eEtqMkc0SEprYUtRMzdnTmhpYml5N09TcXB2?=
 =?utf-8?B?d2lIYm52RjlCQ1RNdU5IRHhEN3NHeUI2VUNUb3M3QXBxeTBOUFVPWTZ4NUhh?=
 =?utf-8?B?YnhOVVdTSGxRMHNjTE5SRXlIRFlzbjZteVBrZE85SG0yOWNlRXFTR2FIdlNQ?=
 =?utf-8?B?L241eitVYXk5eWNoYXd1N2FvT2hpUmtNb3A5RVkvT0IrL3NxL3JjUVh5emNH?=
 =?utf-8?B?N3VWU240TjY5bUJYYVlzdHJ4alZYd25lNzRLM05HVmRLZzFEZHhmSjc5K0Fu?=
 =?utf-8?B?ckFPeUd1YlJXR0ljeStiOXBMQmlSZjBjYUQ3YllCMWp6UlFTMldTcVg4VHVE?=
 =?utf-8?B?THFPTjRIWlZBbkhEWmxYS0Q5d08wQ29Hd2xxN1h2ek9XalNTV1RXTWtRZmhp?=
 =?utf-8?B?bWhBK0VqMnI2L0F3NWxpaHZRaWhLeG45a01ncG0xaFRsWDNlOUdDZFNEbGpX?=
 =?utf-8?B?OTJocjdBcDk1dndONmhqN25MVDdOZ1ptM3FwODE3SGpEUVpaeGFDekxTRHhQ?=
 =?utf-8?B?QkhhRVhhblFLMWRzcTRSNE9hN1hFRnR0NUQyQ3BHeGNmRjVjU0ZUNUFSWkx2?=
 =?utf-8?Q?5os6t4zBVRhwLvT7kvKfgP5jlcuh+oCGKcxrPNG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11df1b-34ac-49ef-20ab-08d97da20266
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:21:42.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXyq6vAuvDDaZBaAHdaYMJ0baBn18tRzlZ/oHFQlboFp5gkql0z+xevY2AjNq9h2tPJjC3EI+zszgJx0Bb0aww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Hello,

First patch on the series is a trivial change to xenconsoled in order to
use xenforeignmemory stable library in order to map the shared console
ring instead of the unstable libxc interface. It's reviewed and ready to
go in.

Patches 2 and 3 allow setting the host wide command line `gnttab` option
on a per domain basis. That means selecting the max allowed grant table
version and whether transitive grants are allowed.

The last 3 patches attempt to implement support for creating guests
without a grant table. This requires some changes to xenstored in order
to partially support guests without a valid ring interface, as the lack
of grant table will prevent C xenstored from mapping the shared ring.
Note this is not an issue for Ocaml xenstored, as it still uses the
foreign memory interface to map the shared ring, and thus won't notice
the lack of grant table support on the domain.

Thanks, Roger.

Roger Pau Monne (6):
  tools/console: use xenforeigmemory to map console ring
  gnttab: allow setting max version per-domain
  gnttab: allow per-domain control over transitive grants
  tools/xenstored: use atexit to close interfaces
  tools/xenstored: partially handle domains without a shared ring
  gnttab: allow disabling grant table per-domain

 docs/man/xl.cfg.5.pod.in             |  12 +++
 docs/man/xl.conf.5.pod.in            |  14 +++
 tools/console/Makefile               |   4 +-
 tools/console/daemon/io.c            |  25 ++++--
 tools/helpers/init-xenstore-domain.c |   1 +
 tools/include/libxl.h                |  14 +++
 tools/libs/light/libxl_create.c      |   6 ++
 tools/libs/light/libxl_dm.c          |   2 +
 tools/libs/light/libxl_dom.c         |   2 +-
 tools/libs/light/libxl_types.idl     |   2 +
 tools/ocaml/libs/xc/xenctrl.ml       |   2 +
 tools/ocaml/libs/xc/xenctrl.mli      |   2 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  12 ++-
 tools/xenstore/xenstored_core.h      |   2 +-
 tools/xenstore/xenstored_domain.c    |  91 ++++++++++----------
 tools/xenstore/xenstored_minios.c    |   4 +-
 tools/xl/xl.c                        |  15 ++++
 tools/xl/xl.h                        |   2 +
 tools/xl/xl_parse.c                  |  13 +++
 xen/arch/arm/domain_build.c          |   4 +
 xen/arch/x86/setup.c                 |   2 +
 xen/common/domain.c                  |   3 +-
 xen/common/grant_table.c             | 122 ++++++++++++++++++++++++++-
 xen/include/public/domctl.h          |  15 +++-
 xen/include/xen/grant_table.h        |   5 +-
 25 files changed, 310 insertions(+), 66 deletions(-)

-- 
2.33.0


