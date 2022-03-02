Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55784CA815
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282280.480958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyc-0001hi-AK; Wed, 02 Mar 2022 14:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282280.480958; Wed, 02 Mar 2022 14:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyc-0001eu-6q; Wed, 02 Mar 2022 14:29:14 +0000
Received: by outflank-mailman (input) for mailman id 282280;
 Wed, 02 Mar 2022 14:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPyZ-0000Xg-WC
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:29:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7b23bb-9a35-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 15:29:10 +0100 (CET)
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
X-Inumbo-ID: 1f7b23bb-9a35-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646231350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vvgWKbFjweSwkWyBIVjjASKWnZeI8HuMMPIGjeUSkdE=;
  b=TloQHp67806FwFFWCBveOXgvAJQR/hSBOOn7RLSGhCm9thEhPrSh+jnv
   S5UfWgOM2XaJX5eLFiN0h4M1O9XG5LqoZMN/PuA5plaEp7ivxvqXIKNQr
   w989gdAhHNuNE4auT4Jisg0Ah2rGqWdcD09ZkOwk9jXoS51drLuNXMzPL
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65219557
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VB5y/q0IUXyr+BAHrvbD5fhxkn2cJEfYwER7XKvMYLTBsI5bpzYCn
 2NNDWHUPfuNY2Hyfo1zYdzn80tVupTdzdQ3TQRppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw24Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1HhYCMTV52Apblu8UYEABdGCZ1YrFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25oXTKuDO
 KL1bxJMTjflehB/am4MEaIZrvbx2nDwdTZx/Qf9Sa0fvDGIkV0ZPKLWGNbSd9aHQe1cm0+Ko
 WSA82mRKhMHMN2SzxKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 08T/DAnoe4t9UioZt7nVha8rTiPuRt0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nMUGWQAuj
 wC1pPrKJDksqbieTnnC6rjB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hia22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxCtame0bblHRcRJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErPdvvU5x7k/GxT7wJs8w4iPIUOPCdkyfdoUlTibO4hTixwCDAb4llU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9QDBxU6KKmOh5E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:G/RbcaHb+j4qO0NcpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKhyXcV2/htAV7GZmfbUQSTXedfBOfZsl/d8mjFh5VgPM
 RbAtlD4b/LfCFHZK/BiWHSebZQo+VvsprY/9s2p00dMz2CAJsQiDuRZDzrd3GfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhNpGdZ88qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65219557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7Vr0xe4o12UfpVQba+JI38TboFa2i/hR+M8r2Gppz8QrUuvoEK69T+sFmrZHNjY9t2fxjtn9U9gTRHLmDyYzV3uVKxa322wPS5bBocIe+ZgNdkqxjrlU7vIYi3/bEVFiU/HkhvyLH6sZXcFoZ/P0OfN0mC+SZjhCej7bgcBt2+7s8gGJA4QOU4QfiiZm5gIh1rUez5iyESc+VFLKJkNRiI+Il4FJbgLwhkR6ew1LkuzdOdq03YW4NZTg16XSMcMLh6ZpYl/GBM+UgbInVtqLmm2RgL/5QemJxXIUK1eqp8tLRwZM9sBQCuglek2HmTolFXd7mCbfJA9Bk30qGVmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6+tPn3Vtw/33Pu7XLEt/wmcadDGaOE9Qo6ldxTFLMU=;
 b=KMH6IhoQv7iETFGZ50psbSW6ZOu16x2MgyazNFB53MxDszlSE6b8pVMxFsMrOCFvfkx8WKf8MrMJm0gjEu/cQ6PAB17kfglhYbqwiwUnWijsywbH5bsIWcr6ztXb6kjj+Wou2TqxFcAskUwf03l+4oW366TvtXvYX2H1CDaTPK1yJWz3YI5vP/wxQRhOkAp7m8+WeAW2oyuIskGgS2lRhsHg5nk4stajvB4jQlvKtiKuMhRu3Taa6gE5dAqdgBhEkxPWvR0xV2oW2/dg0CNF+cyCpG9OpNa6cJX1qf5hepH1xNo9OE4FDSv/x0o1Q0biFVoIRybtY5bru8RzBwYarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6+tPn3Vtw/33Pu7XLEt/wmcadDGaOE9Qo6ldxTFLMU=;
 b=gma+6fRBGnqAl0A/XmKPzaMFqm12DwqacJ7Yb+34C9t1mQ1Y2UBz5SEB9D82lvpU2FMYCZu6WF2c9lWCPWmkE0ovZ4IpMGK7wRqwpS1Z98dC190IxBKhaFMmF5VAKpbpdGE3ZhtsdXvBmv19SDJ5e+NqnajPfmCdFPgyl3dlYWc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <doebel@amazon.de>,
	<julien@xen.org>, <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 3/4] livepatch: do the initial build using CROSS_COMPILE
Date: Wed,  2 Mar 2022 15:27:10 +0100
Message-ID: <20220302142711.38953-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302142711.38953-1-roger.pau@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7747fad1-8cbd-4cb2-77f1-08d9fc58fe52
X-MS-TrafficTypeDiagnostic: BY5PR03MB5111:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB5111F8AD04FE717B26B423B28F039@BY5PR03MB5111.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJUI8FLpJ7Gm84ir5cFBTrE1DnyrV0pGnI6GjsoEs1J+p2/G/SECqQ6pzLfO1K76mFM1mJl3mFbu/GYgnvUNQXmN1j0F6stdGO6+2TZ/Z5SURvpIBYRA1w0JMrqjUMmange1nCajirTsKO41tQCOxg1OFrWwIRWpsee8kFo3T/VRBH48BPigETGz7x/o2wIauR7OUKaq3bsAa15a0EnUYpu/ZMt+fY5NdnkoJJSRvzA5K5kKGYbB5ahAPDT1G8uWVhAaZdFh2wHSLKIS74usKnLWcOH3pAYt38hgEJqdFpGRUMka6M+ZcARePEuzGTVMhZG+Zv6ag08Vol9IWDpMCAlT7hDH2Dzxv3M1jq6knD5typnL5E60TMPTA9AUCrSoYTen8E8gEGklP3yw9xazTMSu0AAn1Ak3OszKNYjYk8/9I+UT+lnxyQfZ1F6/Wxt5tQfuOQXuBcrqCssRpZjssrrHQI2eKOB/WkYXtnOs0ct9yI1f5AYJJC6830reSoOCFU6rbZ9AxKxgXVX3qwX/KuMTxz2Gr23cqTRJWhOPGCz1ho9bY21kmuARCPX1iZn3copaP7xy/iEVGWHFEf7utr8jVNPqBzLG929GDrTflJ/G4QbT2HTrua24lQXdwcpofJXJdUqS5D1wh+pyO1h+gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(6512007)(6506007)(82960400001)(83380400001)(186003)(2616005)(26005)(107886003)(6486002)(1076003)(36756003)(508600001)(4326008)(6916009)(316002)(86362001)(8936002)(8676002)(66476007)(66946007)(66556008)(6666004)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNFdUhBekRkeHlqeDFiTVcyNHBXaFdtOG1Ra1NrYndVclVtelF2eExLWEVQ?=
 =?utf-8?B?QXI2bXA1TC9PaUZzYUlhSGlwcndzalpRNUh2Qm9FdVBFZnhpeDd4aWRaMXhi?=
 =?utf-8?B?cFFISmpkM21DZW5tbWxUdlZDQ2VVQlN2SGg2YnNMek1TKzlvekVNOXJucitH?=
 =?utf-8?B?anNTMFlMME1zRGlDZ3NVMXdLSGZZVzI3ZjFLMmtuNVhoWkx5S2l1RjVaSnVx?=
 =?utf-8?B?RWczREZubXp3VUJyVlZqMk13MmdsRnJlZENqYU1oc0xUQ2haekE0MzZST1Rx?=
 =?utf-8?B?N3dSWkpSdFlXc2Z1THNpM0x4UXdRcU9FVkFQbTc5V3Y5RTllUmRIYXgvS3pv?=
 =?utf-8?B?cHV4YlkxOVVyemlXb3FnbVpxQkRpOHBLbWZ6MytXMkZKWG1NWUhONFJFREVC?=
 =?utf-8?B?c1JpV3FPMkpER2FiQVlMMGEvQ2h3c1MyVkt2Qi9YYkFiYTRxQ3hFQkliUVpJ?=
 =?utf-8?B?K1oySEhNc1M3S0ZOcDhJM3J3ZTVxam5ZOElib2pITVp2cy9LNzhjNUtETFNP?=
 =?utf-8?B?MkEzQlVKall2RUFTZjQ0NVdYalZkMDllTjg5dG10amxNOVNZc1pXTWQ2MGdo?=
 =?utf-8?B?R1UzQ24wMG4yVS9zcEsxOG9FTzFHdEszU3hWUTVpZnF3NlhkQ05kaGMzZ0Jn?=
 =?utf-8?B?QUdkTWFzUEhCRkJtVU9DYllNRTFPa0FuTUlUS0QrL0g5OFFLMlFFeUdodUtu?=
 =?utf-8?B?cGhUQmJuWmlWV0k0SWMwbHJkWmY2eVZLdXhZYkxUKzFrL0NMOHJ4dUNyem03?=
 =?utf-8?B?VVlEOHpwbkZ5UFRCRzJzSjgxYTBYcml4d3dxQ0YybEw3TldwbU5YZlNOcC8r?=
 =?utf-8?B?dnRnMUQrNzlVTkNEODA5K1VVQTFDUUpRQzBLMzdOL1RWcHhLQ3ZnYUpNUXl3?=
 =?utf-8?B?cGZodzdqVkVFbHc4bk02aFFUL1pEMHRocGJUVGVQWlpDMWN3YVhwOG1iYy9p?=
 =?utf-8?B?czVrb2toR2hheVpSY0VxajdVNFhZSENzMFZ0bTl5bEc1T1g0RytwdDRiVWRH?=
 =?utf-8?B?cEdEc1dFSlp3Q0VQNkZQMEhvandzUmExd0Njd1hXNmZqUkZkMkNyRHk5ZHZM?=
 =?utf-8?B?c01XRjEvRWpDbkY4TDVndkFGRjJyeXVwOUV2TVFGMm9ndVBDMmZiOUkyM2JJ?=
 =?utf-8?B?RWN0eTU1QnhhSE8rR2M5K1J5T0RiSVllUU0zY1Zaa250Z2gyU1hvYUN4aWRm?=
 =?utf-8?B?MVd0ZGU2UDhoSHNVZWNFMmJXdmEzbmpCU1N3UituTXRwOTVQYjJCaEg1Tjhy?=
 =?utf-8?B?WnN0OVdpbDIrMlFobFp5VSt1WGdydGVEN3BWYWNHMEFQVWRvN3l6SWxvMkl3?=
 =?utf-8?B?ODV5OFRJd0l1RVNGYk5TazdzY1I2UEZ0bk5ackF5Z2hmNk81RnJid1lVMTdu?=
 =?utf-8?B?cFluQU43bTNFT2g3VWtZSEhLMUduU3c1YnZGUzd4RVlaUWRUUk9vSkJSOURt?=
 =?utf-8?B?NHhtUk1BSlUzZ1BMRElNeXJOS25zbm0wZDZ0bXQxOUhIU000VGYrdTdQWU9i?=
 =?utf-8?B?ZzRlazVDdSt6UTlxZzcyVUFScWNUZ2pKRE9lOEc1Y0hvYWxzSFBuRUlMdytN?=
 =?utf-8?B?bVpHemRIaVdwUW03bXhIaFdSMTRBdnhMY0I4dSs2ZGVVbTJxYm1yL0pDSjBG?=
 =?utf-8?B?eEwvUzJRMFNiK1Vua0puQzJEWUwrV25SZDg3TWl1QjVSclc5b2JyUGhpZXFv?=
 =?utf-8?B?eXJyRkU4ZTFLSnphUDZQSmJjNEp6ZW5seTZZUWI1aklaSkptMDVSZVN3Mkd0?=
 =?utf-8?B?L2F5dlRUTGJzNk1YNkpEQ0xjV1VZTlM2YklZWSt3K3VBOWQzWWpUNUZzRkxE?=
 =?utf-8?B?V2lSazRsNzlCaXIyQm5SR0MwZDA5emFxMVpaK1NRRGtJTitTQUhBejdDeGpF?=
 =?utf-8?B?VEFrbnRYUDhROVEvdUdWSld0TkxLRGxnQTNlZTM1dDMzVHIrSks5c1gxQTFD?=
 =?utf-8?B?M0ZtME9zRWFmVVRlNzl4STRSS0w2ZWdMV2hhREhoZG9vemhVK2NQblZaRVlu?=
 =?utf-8?B?NURZRnZKV3VKaGtiWEZ0eVBGZVpCa1pubmVJdXJHTmxaM1VQY0ZkOEZSa1ZT?=
 =?utf-8?B?L05mNlduZkROMUhEb2F3MEtzM3JiMlVPNk95enNqODk3N0FRbSt5Z1lYbFE0?=
 =?utf-8?B?YVRVc0R2akhRUVFWMGIvMStlMUR0N2ZtVm9QdjloMllTbFlsRjNxc2hUalVz?=
 =?utf-8?Q?H9WpTxDGgaY1GJ4uvxQ4Rhw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7747fad1-8cbd-4cb2-77f1-08d9fc58fe52
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:29:00.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ziIp2zxFGKWMBLwuSvzJ42amWF8rK6Osd/fcZFTBC/CmPg2CpAFubxWdzm6cDRg9vq9nRkY6zF3jSYH5NGuArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-OriginatorOrg: citrix.com

Setting it afterwards for further builds will cause the build logic to
detect a change and thus force a rebuild of all sources.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/livepatch-build b/livepatch-build
index e1715ea..38a92be 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -92,7 +92,6 @@ function build_special()
     cd "${SRCDIR}" || die
 
     # Capture .o files from the patched build
-    export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
     export LIVEPATCH_BUILD_DIR="$(pwd)/"
     export LIVEPATCH_CAPTURE_DIR="$OUTPUT/${name}"
     mkdir -p "$LIVEPATCH_CAPTURE_DIR"
@@ -408,6 +407,8 @@ if [ "${SKIP}" != "build" ]; then
         XEN_DEBUG="debug=$XEN_DEBUG"
     fi
 
+    export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
+
     echo "Perform full initial build with ${CPUS} CPU(s)..."
     build_full
 
-- 
2.34.1


