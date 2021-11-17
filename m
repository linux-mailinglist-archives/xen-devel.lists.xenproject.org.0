Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC01454445
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226658.391733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdv-0000PN-KQ; Wed, 17 Nov 2021 09:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226658.391733; Wed, 17 Nov 2021 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdv-0000Mz-HB; Wed, 17 Nov 2021 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 226658;
 Wed, 17 Nov 2021 09:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnHdt-0000MY-4d
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 09:54:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f4c7989-478c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 10:54:11 +0100 (CET)
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
X-Inumbo-ID: 4f4c7989-478c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637142851;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=E8qfDMyH2LHw6JSVkZwHv1VbwFYbZKc+yP/NqhA6Cw0=;
  b=Z3cLFsZtm/DwfLNM6MDg317XCtG1KKyrpOJ+t/uTZ00ei9Ge7QWgkLLq
   zad7dhj69AAq8uVJucJUWR14CKSWh4kpW1n89/mIqTBQIRFi6D7YggcsA
   oi0zRS5KltxIdCSOTkVKfiBWRzxOyjiQ0hV8sjm5JNPB3+yLf60RemXDR
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jtvs3r0oVzDWQtxAuCV4xB3FETqFH6ke9R2u/fflWUK64WQhsjAGcv5i/JcNP1RnYQWCDCp2/Q
 3Rtao5F8D5zdyZ5QeVwr/xHmStHhHW2WZPn/0KSadUV6PyFwlr4t2cP5ZiOBXK0oK/+B6P8jJh
 5HVkYYPcpICZp9yI3uGw91XphJat1nY1I2dNlSIJQ62oQZePaTQ21axUoHHvjX8ybs9I37nqVm
 fdMTNMc1byfI/mtF+ILcHC+sIngT8Gj62w/5dvya+1P50u8ERL8D0Nma2k2IehQWAFa+f3Uf+M
 HjGHgn0M2ZefrZS30McXzqbu
X-SBRS: 5.1
X-MesageID: 59994919
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:0MuxB6vWEYNyQXj6kMWqhLhD7skCkYMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/htAV7CZnidhILMFuBfBOTZskTd8kHFh4tgPM
 RbAtZD4b/LfCBHZK/BiWHSebtQo6jkgdGVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vX2iIBzADQDEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuBalqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw3RjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXt
 WGNPusp8q+TGnqLUww5gJUsZmRtzUIb1i7q3E5y4yoO2M8pgE886MarPZv6EvouqhNDKWs3N
 60QZiAoos+OfP+XZgNdNvpfvHHeFAlOSi8S156AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="59994919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kr0xNzLWXFPzhyviXSPjH6rb+LYk5n0tV1LAZ88jc4bnWSi/Y7yISC/YypKH6RouSdCJPqPd3uKYmC+z+7Mo8WaIqBeiCwDOo3w4KyoxHcTiYH3QuB5JFWib5lONxHeEZdkY+RSuvQ0vNwZpxVtGUALPg9mScNaKJv+Zg/4DUQQWAl1JLjflPdpnodRQKgmM3sGZdObvPGgpl+YSfoje1g+xmolAHYHcJ/aV8OqJxwc3I/Av5ZmpKs3Ot4n7KGCyvtE7f0T5ny2qTKK0BF3N6f9Z3Q5OyRV2Nt8WypkpXuiNyvFTc8iObU8SVcHtO07uzpfDjK+xUABrLFAyFSWRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/sPWHWRjMxcHzCGPowon7I8361W6VEG40c0XkVvB3U=;
 b=RTs48lG3BweLr02fvvL5J3kKEHLB9xUJZDxi8M+k3IBj/hBvx9t7iSHSoJnEMCF31gk8js/Be/enI3XvwSsHAstk6M52GUBg7mJM0865HMxMhWQGf/4Bhud58yVk6FlAd0ILkUuZ0LJiLqopPEMSRQC3evINrxjk3MtK+ItiobrVNDiJH5YJF3LOyeZd9aV8zdGLmyAIwUI03FhbXlGiEfxnKkHPTxZGiJaFtp7hTRCcJXhQLo9S4wO2LYMLga+BOTNsUFVwiaAkfYCbTLY5ypDTLwB+EtwfspZCptQr5kHJMPWHSIn+z0Vj/h82hQWgvlH0A0Z12tuKmzqpXQhNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/sPWHWRjMxcHzCGPowon7I8361W6VEG40c0XkVvB3U=;
 b=gxc724qNk5acRJq4mHHQQXYKzahQxA3gQlbPDAM6HKW0OJDxBMwx47eEq4hpn07D6NeP/PJR8L2TyBwKOJbIII8D1fq6RjVlGrx/DtBetVutjl1wlAOXg9g8JG+g0hljEAPUfYPdEOjjB3pyHs2PmoUHIB4vWaMw1AQute6q4Bg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	"Christian Lindig" <christian.lindig@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, "Doug
 Goldstein" <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, "Julien
 Grall" <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	"Wei Liu" <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.16 0/2] CHANGELOG: start to populate entries for 4.16
Date: Wed, 17 Nov 2021 10:53:36 +0100
Message-ID: <20211117095338.14947-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fd::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73229111-e790-4833-53d4-08d9a9b02cea
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB35776F3C9862DB4E87ABA30F8F9A9@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvOK3iMZ8GT8LjheB81gjEV3OLwQ0HKaeL9FlinmaTLalgeJtsUDfezIT8zX9Hm3qxMyYXd9JsG+ZdA4fg5dx1RXE6xptN5L3qkHi767LhjSykdQlk0h9kfWro65fFBuHyA8kv6qXzvzQmiKW8lF3rLvsmwmC/Ko37FCEACkH++Qo6cbDCqMA6P5KmXRx02viC1N4U9cNvRxeIlVX6bdDCj8sXANX0jzj7EPg1kVLrDculy+vaaQ9mnbCijBc76Y8FMjSmEG08gKqMmHiuMMD3aRJruVGL+x/R3r/K0bzlnfRAOWi5X533hNy9/7H7NmHptIG5naEVyrzkdWS107hPZIUKcXVS1szmukQRsZ5KfjDyjrHQKdipwM4o4+DjuJoVD1tykVwAJP0aUk8q2Gqd2Pxlteli8tfkOtqAE8Teim9fhkmkKS+PN0yMCqFLSury0f9EYKmhOWaVBvQmc344FOW+eCLcljVAVeDhf5Z1/shHhCTXLXLaqqUGFndY311UTM7BRhmYZ8qJY7R0I2qNsW/s5NveK5/jN9fBvkoSpuigddRDXyFFbb/5HVRydDSv3g7bMLTfg0u7tpzIGVVpkIUVVVOe6fQLD9Tm/SSI9KLdbPWwhC+7qBVBNA5hZy6XrHFPga068ClOJcm31gEm2h3qP6OxD2Ty5bY7HIOOqJ6zRBrCw9G2n7eaVreJJewGf1cXH1bi1EhOUMCNb9C2aEg/CBhAxYc2QvPyNPPDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(66556008)(38100700002)(316002)(6916009)(186003)(86362001)(82960400001)(8676002)(4326008)(5660300002)(4744005)(54906003)(2906002)(26005)(6666004)(7406005)(83380400001)(7416002)(2616005)(508600001)(6486002)(36756003)(66946007)(6496006)(956004)(66476007)(8936002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZBWlY1QllnUDVKWkxHOGI1YnV6djJoN0hpNDhsSUhtT3lydDZ1eEdieml5?=
 =?utf-8?B?YzcrcE50S3UzMnloRzYydDFrMmtzZ09DbW5lV3RKbVg5c0RhNC9XeEFCNjR4?=
 =?utf-8?B?aDBEMnJtT1doVTcwTmlWNEw2L1NWejk2VHltNHNOYzRPcDdndlp6VTdQWmVw?=
 =?utf-8?B?a3ArRDhFRCtJcmFFbXFZNExrdHR3Y0VHMTF4Qnk4VnNhRVBXaWlvVjNKVFdq?=
 =?utf-8?B?M0kzeHdITjNReG9NbGNFVnczd1hhaEhxZ0NkY2hONnlodUVvZ2lOUFBOeWFO?=
 =?utf-8?B?Sjh5bUU5TmlGSy9Dck80SXBzQzhyNURvclNnOUtldmJkMWw5Qng3bHFzQnNY?=
 =?utf-8?B?d1dJYUh5WHNROTJkVlM4WkphNTBUMFo2QzJvdWpvYzEwdFY1T0Z6Znp0Tm9x?=
 =?utf-8?B?cjd0TlpTOEtmWDhXZkEydmd5ZlRiRXdRSi9OQ2czMUhWNWUvMlNuK1lBRVlR?=
 =?utf-8?B?bCtzNFJxNlZxeFZBZGZPTHV1RlNuWFE2RVdQdVJLdzV2NlFIK3ZDZ3lSUTha?=
 =?utf-8?B?dEhVdkprUEx4VEhzcFRHOTZGVlN0QSt4ZHYvNFJYZTJVdGRYREVnay9UaVVl?=
 =?utf-8?B?eDByYVRUUHFFVi9QZDdDeXNKUUszMnU1OFJ5NXRhRjdIYzEzbmtUZGlGVlhn?=
 =?utf-8?B?d29SODZQNDZ5c2QxUEZRSlhmRVVTbzNuRW9DY0ZFVzJ6cWlSbndpeVdGdk8z?=
 =?utf-8?B?b0pCY0l2dDhETjhOUFJiVmFoSTVuWUZJY1BzWU1lMHRHeFRTQ2VYMG5ncHdO?=
 =?utf-8?B?d2FLYWozRDhYNnFMQWw0MWRiUXVkNjFmMm0xTnB0cW85cXdHT3I4cWVaYjdH?=
 =?utf-8?B?OFZicW94K2hvcUZFWWF0djhtV2h4djI5djVpdjNsMUZ0OVVGSXN1aWRnOGdy?=
 =?utf-8?B?ZS95ZHJQNVgvWDYzSFIzUVRhOGRlU2src1c1VUlKK0laRmQzakFrYURvMjNB?=
 =?utf-8?B?YkFZNjVOMTVJZW5ES0NiY28xOTh5eHdrQno3QU4vTlkyTzc1ODhDSVNIZVlx?=
 =?utf-8?B?ZVpFMDl2eUh0bTdUSFZPbmpRSUU2NUc1UjdPZlNaRHBmNnh2NlRYejB6MWxs?=
 =?utf-8?B?OGRLNjJOVm9Bd3RTbUZ6dVJjSS9SRThneHY2MTgwSWNSNkh0MXlQbDRDV1FS?=
 =?utf-8?B?RjhGeXFmZXlWbTF6VXg0aU5wemtSaTJwOXBkd09pcmFxVXUzMDRrOHZ6cmpN?=
 =?utf-8?B?WGJIMXVobTVwYmRtR2U1SFJad3pBNVlEMUR3cGFGeW1Qb0U2SUw4S1FPa2pZ?=
 =?utf-8?B?VmV3U2UwcU1zV3MvY21lUUxSalRtZGJKaDUrd2Ribys3SVBDdDhnVVJha3A1?=
 =?utf-8?B?NHQ4OFZWbzRzZ2RVclplbnM5R3pUd3IyTGpoUjJ1Z0NUUzlwQWV1ZHAyaU8w?=
 =?utf-8?B?WnRTNmpHaWUyRXR0djlYdDBwRGQ5UWxiUUFoWUZKL2NnTGdSTk9aRXpDNzR6?=
 =?utf-8?B?alRPWE85dGsrVkZSOC9ET0FMSEo1VHE2UmVUUlZGV0hIZm9zeWl4c09zWmNw?=
 =?utf-8?B?RVpJV08xajgxM2NTS25QSldFMkVicjRWN2tlTVBuSWVFNGNrYlFuMXdHZ1h4?=
 =?utf-8?B?RTIvQUtQTDNDR1JJc3hpVTdvMllMR0crM2hMUXJFdnY0cUI3YVlsYW1jUEJl?=
 =?utf-8?B?bjRvMmFtM2Ezd0JrYWNjTkVHODl6WFk1UXFXaHhiL3FXcGFkY2NRL3V5RE5I?=
 =?utf-8?B?RGJEdFllclRwaUtsMHdqSG5xdjRKbHFDbEdHS2MxaVZoeS9LY2tWdWVjYkVF?=
 =?utf-8?B?QnFxbzB6VGJvM0JiTi9adzJCem1oK3p1WWlqa1lJZEdUYWx6d1k1V2dOdWpy?=
 =?utf-8?B?OUxQUmpvckVram9UdDJRQ0k2UWJPbTV0VDlzVktxdEF6dkljdUdvaVI3NmtW?=
 =?utf-8?B?UUZrUHFIWDgzakVGeHI3TUVjMFNPMzdaOUxSUWExMFFFeFF4bzNCMmJYeHFG?=
 =?utf-8?B?cUtFQXlTMC9kK0lPTUlwc2RjbWtFMVZQWHVMS0lUTGFtdjlNUlpXeVJyUUsz?=
 =?utf-8?B?aHZSSU95enpLNTRrR1ZSUWlyaGdEb3ZlaUZ2Mk1qS3J2b0lZb1VRTmZmdnFN?=
 =?utf-8?B?a1FvMmcwRk4wV0wyb1hWZXNhQ2ZncnJzTXBYdlhPKzZ2THl1Tmo1cjlwMmZt?=
 =?utf-8?B?T1JpSzZiUEx6Y2N5Smd5TWFTbzh1blRsUXdESEEyWGhKTnljRG9GcGpQWTdE?=
 =?utf-8?Q?xjUpXXdDF7bxwYUDx0z6Np0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73229111-e790-4833-53d4-08d9a9b02cea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:53:58.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0jfpuzMnF9S7blvvFlO23PVlpH468gKw55twVCHLRcwrXueX4L/rEz8fEafbMKXIgkAE/6VAuTcGq9FowLnUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

Hello,

The following changes are preparation work for the 4.16 release. This
is my first pass at the log for the release, it's likely missing more
entries.

I'm Ccing all maintainers in this cover letter and also in patch #2 for
further feedback on missing items.

Thanks, Roger.

Roger Pau Monne (2):
  CHANGELOG: set Xen 4.15 release date
  CHANGELOG: add missing entries for work during the 4.16 release cycle

 CHANGELOG.md | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.33.0


