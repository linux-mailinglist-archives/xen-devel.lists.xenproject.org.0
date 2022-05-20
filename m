Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C852ED5A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334188.558211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2sh-00016q-I9; Fri, 20 May 2022 13:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334188.558211; Fri, 20 May 2022 13:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2sh-000152-EZ; Fri, 20 May 2022 13:41:27 +0000
Received: by outflank-mailman (input) for mailman id 334188;
 Fri, 20 May 2022 13:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2sf-00014i-W8
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:41:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8151910c-d842-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 15:41:10 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:41:21 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BLAPR03MB5572.namprd03.prod.outlook.com (2603:10b6:208:292::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 13:41:20 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:41:20 +0000
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
X-Inumbo-ID: 8151910c-d842-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653054084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A14EhTHf/0LHaiW/FRqzDvNnjd2dGUC4n1zM7imSz2U=;
  b=V7kVjQw4NDHMKlQ+3722Aj3lhEcA5jGSR/7XEJo4bFQZ+eT6SyZUkGA8
   ONk9amv+O6bRY5cGd8J6E249+hTIhtEGfShh6dH4g7Z+s8A5bNc7fZJUe
   M6W9s1CFUeIMhc6ow3x3MmBneZ6cP1lvdZ8YyT1aKrEHxr0F7aRM+lMt4
   I=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 71788872
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/6uvoayUvsrbTiDuKEZ6t+cnxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 zAZWmqGOfeJMzOheIsnYIji/BhT7ZfdyoJkHAZuriAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY124DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplv42fSCIxJqzwnv07ejVeGgRxD6JEweqSSZS/mZT7I0zuVVLJmqwrJ2ZveIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHeOTuoEwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKmII+ALK/8Lb5UD/1g5q3ofxaeHJa9ikSNkShE2lj
 F7vqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydG6h1C/XZRDK
 kUS0isosaU2skesS7HVRxSlpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY/bDNqzq3YHERNTVbOnFCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:avSvs6jmi09on3hdLTpTKechsnBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71788872"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AePKWpQlJiee916ViM5cIDIv3bUV+ET2OFsXEvmdR56L7dUlM6nx+PCC4rPxei1u5/dXMMwNFLUVS8vLIPYW9WQ5dDiSKJIZj+BVUg4XT3njlWo4gAqkwN3esNbWtzMUJwZVrhpxoo9WsazG04XlDGRFj579R5C7gFfpGrYzVEvsOiEHT2WSE2wYay0CvLi3ZtD0mVeiyPj4rjCfRdfeb9lIBhf7d2irOlrLxmIwobZ27KDk++DnZGnPCKfrozMlmKWANGpPdAiuLMdDQzzfm3Yurpf/uULTDxQFe5xyZu3ykcpJLZOUxvr40EYFRLbwH0FcO5Dj0AtuUVnKrslAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofld6Ep71YeyYxHfidBH/b9x2bm3x7TqyRzarWNNHVI=;
 b=XCRcZgLVd8T1DF9/Q0QrZ5f0UT7Q6noG16xWw/PdIGHIDi6u1rQGnvXkL3l/v0vHx1nJi+Tc+8gBPxjsKxDRWfV4mCEUqflIGRSeAdIgGYd86V8O1WPEC4ln2/6zuzdePYcBsvZDxGTPe2qoNgkqAwRREaA7u3zdpp/XOGig3arZFB8qsBmHRt8BpLNgv2I2GCFjav6lF3rSuVPd0GxVtCYSCyT8nUEguIBG/0zNoSkOS17YutGyJXbiOkCVILeCOmeBKm5KmGxM+8LgLwQJuVdR1JVHoX1B+/PZAOE6TVj6PNDxIn5eX5jvAmiUI6nQjzSVWArR0DmoHQvwJY9WVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofld6Ep71YeyYxHfidBH/b9x2bm3x7TqyRzarWNNHVI=;
 b=MGm7m+HBC2uIDwIXiCGJfGqFAMazPtu5vox+wO+5X/mz3fUuOaA6/Gm62enGlwN2wfUhUCSspBdlKC7guCMMiUPdxCFD/CvpADipWuvyJt6mD4E+4j5ftPiFNuoGow0h95UmaE8dc5CZNp1+J4v2YplxM+0MePGu22o1leixjH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 15:41:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 0/6] x86/ioapic: fix edge triggered interrupt
 migration
Message-ID: <YoeaezDeUuiolUQD@Air-de-Roger>
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <YoeLOPgabooE7K+c@Air-de-Roger>
 <02c5d597-70ce-23a7-d48e-0e9d2abe72f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02c5d597-70ce-23a7-d48e-0e9d2abe72f1@suse.com>
X-ClientProxiedBy: LO2P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce8c5f1-e3b5-417e-9d27-08da3a666bf1
X-MS-TrafficTypeDiagnostic: BLAPR03MB5572:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BLAPR03MB55729EDA748E4191FEEF3A7D8FD39@BLAPR03MB5572.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wH0/sVeXb1Lp1tGA+yusO8nWbvy1zA/KrEjnQyHmsQOla3oU7R7pXgzUJmCvVBdylvfrjJ3Y+050y6gJlF+q8Kr6+PtqYqTe9wMD8V2zW/CG6jocYF2t+V4ilUNh2CyEeP0D+hMmwroU3CL3XH2mMfn+GelO8Oca9Q3c1OyYpVEhOyxjtcAnrHDme8BsDU4HWjMQQciD0jlx7Zk/N863dPj9kDsRwqguiNnR7qvR9Ii+4S7y4X8y+RiO4hmqSUOQGYaYnqKFhKmpESNbM6GcXzJR8sjFEVAazWpqcQ5kiTKq1a0uyw+2hK4XBnwv0+Hv09lTG26uoMVzCWCPUvnQB7NVVB4/pWDqsBEw0aRg3F83T0h5ivkoQe/7MJjcEOG0AyLkp78Zks9D/CejlUorW+BopLy1/ZcYfZ3dJhbEAYooT2G+uCCAxeBkO7sM/wcGlaAYapS6xfNUvPH2HxrIFq1LMS6VRmLJftclAoF55zvaaOfEcVow7YTauzLbdq6cO7roG8nfPQPlS3njeDSA0Z0OfVqHZUZcuEmqY+pUXRP3Ai39QqJQYGk1OrCf2Fu0t2G4iNZAlkz1rLrM+uSMAgAbjFF99Km/dMctFm+ZkWl8sof0jvp0ybZq1ZYS22qLVwo6j27GdFFA4jQJfn8SsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(38100700002)(82960400001)(83380400001)(86362001)(8936002)(5660300002)(508600001)(66946007)(8676002)(4326008)(66556008)(66476007)(33716001)(85182001)(2906002)(26005)(6486002)(53546011)(6666004)(6506007)(9686003)(6512007)(316002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0hrSU96L28rSHlBc0lxTDBMdGt6Mkt1V1lDenU1QXE0SS93WDB2U25YeG03?=
 =?utf-8?B?Unk2bjBjMC82Y2tnS2RVWGlLazNPNVVYRmN6SVp5bVE0bG9kMUtMK0ZCY1cy?=
 =?utf-8?B?cTR2RkNuQytDSlR1UEFNWGdMeWhKTURMSXQ0V1RMV0gvNHZlTDd1bEhTcS82?=
 =?utf-8?B?V3NWYVF1WmgzZ2grR2dVbVRFbHozYytlaDlSSTRYczRWYmF2NnRmN0FzaE41?=
 =?utf-8?B?SENHaHJOSThtUDZNWE1HNGZFUHQvVmRsRFhCSC9NYW1NYTRhNldpN2NtaFZE?=
 =?utf-8?B?ZmRpazFidXZVU093a1ladE1FWHoxdHR5UVFRWko3UmxEYVNqMytkUzNDSjI2?=
 =?utf-8?B?Y2diYTd1SGJJZENRaTJEWnZyam9qZ0o0aHczSWNRbG1BektNOWlFaFFCMnhw?=
 =?utf-8?B?Nit2dk81YXBSM2xvVlhLQjdoeW1LekpQV0g0TGtuZmZRdmovemJUcHd0RGtp?=
 =?utf-8?B?WCs5dXZiN1NuQU1qMkUvU0NjQ1lvUWdkZEJzTWpUcllDek5QcksxUTFkencr?=
 =?utf-8?B?cXAwZUc2TUE4aHA0SHlmUVdDYWZWSy9PTjNxZE9yb0ZobENzQktlWWcwalNQ?=
 =?utf-8?B?cDJ5UmczTkFqSmthWGlWZTdWOU9XWHdldzZMV05GK1VNem5CM3kxSEpnY0t0?=
 =?utf-8?B?dG5FR2lldEZhR0hPS1JWOVZ2c0lUVlFyaXZyVVFaSU9QRjdkUnUyOTlwY3dv?=
 =?utf-8?B?TnE2Nk9XWURDWU82bFFYUE5xL2VwUlB4MVNRZmFZVlJtMm45RkMrMmtsUDZ4?=
 =?utf-8?B?a29FWHNYVEIyL0VCaHE1MEJ6U3E0QlJlaTlRK2tzK2dHTFJRM08zL2VLWExq?=
 =?utf-8?B?SjBiR0tMQmp4bkhuRmV0V0dpb21qK0xnNVNqK0VSK2FTdVpvL0ZyQ01PM1Qy?=
 =?utf-8?B?eDZnRmR4ZmdkenVPKzJlckJPWmhRMVd2YndhWUcvYURXdlRjUHpjd2tDbEw5?=
 =?utf-8?B?QWNSYlBpM0hGR1p6UEZYVHBSNU5tZ29KTEJZSVI4cG1KdG5iRHBWUVBtdW5J?=
 =?utf-8?B?dXd0NkoydW5ETUVZa1lHa1NRMFZlNUdsdHkxMzlRNlF4TEFUVG5vS2tyL1Fn?=
 =?utf-8?B?VUt4ZkovS2s4L084TVZGQUVOdTY2MndSd1RvSWRMZGVBNTlLQXh0RWErSUlT?=
 =?utf-8?B?VThsTEx0VHR6bGlLSEQvUFJvTGdkYnYvbWtJaS96UmkramdBdWF4V25aYXNY?=
 =?utf-8?B?Z2NBSi9UWUdZaExEaG40R1Y5YkdITzVYVHNvRWlxOWl6TGhPZXdaZC9iTzNu?=
 =?utf-8?B?SFJvZmdrbEMxMUp5czdiTVhpV212NGtXVkZaVmcxTFFvUjhPeVg0cnhhaFlM?=
 =?utf-8?B?L0xSNW5uZDlIVkg2MWd5Szh1T2xsdHNiUTZJZkxSbUhITVFjMWxIMnBjRU4w?=
 =?utf-8?B?aDRkQ0pUVitONFVTd0ZYRnFLOFNhV2dSWnNldll0b1g4SlczMDdqbTIxMUgz?=
 =?utf-8?B?K1hRZVNmTEdJM29nYUxWbStJZmFCQ2cyYTdyUEpNaXpyMHkrcGxBRmxtVGEx?=
 =?utf-8?B?UTN1dkhUTFBRQm9WSW1nbkpDZ0YxNGRRckMxeUtRZjR5bzJ3dWczZnNNZ0tZ?=
 =?utf-8?B?dlBLQ1MxL1VqN2U0MjNsQ3N0c1VSUnhZWWg4c2gxYUhXSDRYMmJZSGpkd21W?=
 =?utf-8?B?UnpnZmZCenN1N1Q0MGpWMlFNUDM0VjY4T3MzeWZqenNxRFBCUlJ4dG9XTzFr?=
 =?utf-8?B?TXVDS1NTUE9zWHQ3WlVVd1NjL21BM0RIRUFmWU1tNlZ5VXc2ODVTWExCWFN5?=
 =?utf-8?B?VUxxWDMwYjcrWTdHaW93UG82RTd0RlZ1M1Y4bzk5Q2ZUUS9uRWh2d3lIWmFR?=
 =?utf-8?B?Y0dkYzhFNjdHVTJQTndjSmlwelNaRnhybVhKeFg5Nnl4YkdTL2NJa0YyRGpv?=
 =?utf-8?B?UUhSU3hYUGU5Z3NzTHA2OFU3QUMyZWplR0pyQ1U0UDgvbElDaUkyQ3UwWDF0?=
 =?utf-8?B?bitLNGNVeU1ieUhObjJFcmx6MUVHdW5xUElLWDZMZUQ1Tnh4a2pWSVc2NWJK?=
 =?utf-8?B?ZVIzSDhEMVQ5YkRJTEJNcnhHSXIraXR0eTFzN1M5eXFZaGJ2czB6SFJHNEFp?=
 =?utf-8?B?Y2Nid1J4UHh5ZitUbXBDZ2pONFUxVGhLbkEvcFd1SUloNTdmdUhsejJBNXA3?=
 =?utf-8?B?Q0NKa0VZbFNSL2lMRkN1ZW8yZE5yVTlrWklqeHVCMFNZM2VhQS9wZ3I2TFVK?=
 =?utf-8?B?dSttZ0VsaE9oNk4wUHBsQ3dKbm9jdTRqYzd5Nmw3WmNpUldZckJxeDlMajJm?=
 =?utf-8?B?aEZHS1Z3UnFtZXBFVm53c24rSHBONzVRWTJCYkVwNFg3NitFRW8yL1YxYVlv?=
 =?utf-8?B?Ni8wVnJsampkWVdUTWFSeml3elpjbEo3QS95Nk9iVFppeWZjVXlEYWFSVjdX?=
 =?utf-8?Q?LrPpkmbBg6dp9NK4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce8c5f1-e3b5-417e-9d27-08da3a666bf1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:41:20.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6oWF54u9t/NOOIuPlGucfOL5lF82VzvnljLBDARJ/sUlfPasedjH/Cy8jYhkKLobZldmjMYwQLal705aeJsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5572

On Fri, May 20, 2022 at 02:46:39PM +0200, Jan Beulich wrote:
> On 20.05.2022 14:36, Roger Pau Monné wrote:
> > On Thu, Apr 21, 2022 at 03:21:08PM +0200, Roger Pau Monne wrote:
> >> Hello,
> >>
> >> Following series attempts to solve the issue with IO-APIC edge triggered
> >> interrupts seeing an inconsistent RTE or IRTE when injected while being
> >> migrated.
> >>
> >> It's currently RFC because some patches have post commit message notes,
> >> and because I'm not sure if patch 1 is really needed.  I originally had
> >> the idea of suggesting to only backport patch 1 in order to fix the
> >> issue in older releases, while leaving the more complex (and thus
> >> error prone) IOMMU changes in unstable.  Note however that patch 1 is
> >> just a workaround to prevent interrupts seeing inconsistent entries
> >> while being updated, masking the entry just makes the warning go away,
> >> but the interrupt will be lost.
> > 
> > Ping?
> 
> Sorry, the usual thing with RFCs: They take lower priority than other
> work items. This series is certainly the first of the several pending
> RFC series which I mean to get to, but it's hard to predict when this
> would be.

No problem, I don't think it's a super urgent issue: we have always
handled interrupts this way and so far got no noticeable issues (apart
from the log messages reported on the console).

There's a non-trivial amount of IOMMU code changes, so maybe the IOMMU
maintainers could take a stab at those as a start?

Thanks, Roger.

