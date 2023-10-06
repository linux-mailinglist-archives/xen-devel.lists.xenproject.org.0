Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D77BB5A0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613526.954098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoiNW-0002Nj-8y; Fri, 06 Oct 2023 10:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613526.954098; Fri, 06 Oct 2023 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoiNW-0002L6-5F; Fri, 06 Oct 2023 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 613526;
 Fri, 06 Oct 2023 10:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoiNU-0001w2-Kw
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:48:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d899e4ac-6435-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 12:48:13 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 06:48:07 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7482.namprd03.prod.outlook.com (2603:10b6:610:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Fri, 6 Oct
 2023 10:48:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 10:48:01 +0000
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
X-Inumbo-ID: d899e4ac-6435-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696589293;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vT85gPsCHM/gsw+9SNg/qO2IhSQB+iqX2Kkfda4vY7w=;
  b=WUKpWGOqCHca7BuRNwRoKHbBS+aUEDJHAcGyyBGNhXen/6ZsYaZfyIME
   kY6nKbQ0Zxe+UlSGpHuB8r59XyuPtXGXG/4p7MfBjlF5oyQwiXhZnGdMo
   goVD+mco8vpEtolPzewkum/yhjFhkjFo7joKU/UBFiwo2IJ4jvDhG3FLD
   M=;
X-CSE-ConnectionGUID: OvIsF6HKRJq8SVND9Mxoig==
X-CSE-MsgGUID: a2EZkzs4TMGE6IcM8QGtJw==
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 127579183
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZBJvkK+9FugYJnbWrITQDrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mofWj3QOvqCZDfxKI8laoS3/R5VvMWGz9ZqHAM//C08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklp6
 90DBm4tTSqhnrKN/pSXG8x8gcUseZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUujtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwn6kCdtCT9VU8NZj2nChxX4IVCEzenblgPKc2neRR/BAf
 hl8Fi0G6PJaGFaQZtvgWxy1plaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLRxitqeED02U8Li8pCm3fyMSKAcqZyUJUA8E6NnLu5wog1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8aIv7YYWtsAHf9awZc9jfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DBwB3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:tJRfuajVKyx7khyX+aM2K/wvs3BQXgMji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJheo7690cW7IE8036QU3WBpB8bAYOC+ghrLEGgA1/qG/9SfIVybygcH79
 YGT0EWMrSZMbEdt7ed3ODSKbsdKbe8mpxBcY3lvg5QpHlRGtldB4wTMHfhLqX9LzM2f6bQrf
 Gnl7d6mwY=
X-Talos-CUID: 9a23:JIcotW9W/sthg5ts4sSVv2kKO9sLLF3+9lXJc3SGL0o4ba2SSFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A4sBqdA8c396cVTw/7wjz7L2Qf84yzpatGltRrbA?=
 =?us-ascii?q?plpelPgkgAhiBriviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="127579183"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvZb7BLOzbZNQXnNxbe+fKgoRt8pztyoF3smhtrFwgmagAMmTm4FliuaxNMJoarofqLne9nH39xrgmIssO0E46urXHosZvzIKwuNVgg+B6qjO7H032SlN4zfDvJJY6VS7AstAPCyDBO246hgED7pRnoX0/r76mOYy1FnrQva7W/WUOyaIDFn6GFtZYyDUKizYKys0Ig4cWP3tRJL+Y+njZLPb8s8gVOMra+m65k6Luhh8cQuVbLtc0CO7WiiDs76luwGPhBAsQx3g0SilxcaIIt2l6VSl5fRYrb0iHXoBb+OP+WtGqTSF2O4MUCOVWbyGD83/kHLOgIa09d7+vZiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKA/wEn/ogry3aoge0788jmxuEqv0FIPsFGfzdUssm8=;
 b=ltibYv+QQV6/5MSDkQ5DVyvclc0U7BejgSswL3NBGnl+phyDmCguVGcJ8cAL48OvRB80n8nuC8nHoP0WzbzW1K9c1FUqX7Om35RQ6uUwFnxun0R+PietoMxzB6Hn3uZdbA4TtyT6loXAbHf/QiRqbI0vSv0rRCK7s0g5ZgD2MEd45SHRjSJ+8bb/2kJtJfPvVqb8RQW19SQdrAdmn8GFXsgKr1cfwAZW+ifdLaU3R0/JBz0yfl4qFKvvDAY5rPh17ltFFvIxOk8KRhVrKLsJKAqjHWqih0KlLtWu+HHF/peP+M+qkWH3gv7Z3owiR12rASHeLuG7jRn/cCWIMdabJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKA/wEn/ogry3aoge0788jmxuEqv0FIPsFGfzdUssm8=;
 b=MkQW5gXIKEG5uBUPIYF3hpl2O4Sk5IxCXGlPq+bPbJ8JBO05FonCyaF58MebiKGJh0nvgitkuH9jIkbh7xxB3Q9hM/IyCw9ZGItUts2GubekXJWi7cxB0sZAEf/Uy9tsD5dQwTp5B8KRd8BfrGAHKbdIjAfdf1spjg/OmFGjMOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 12:47:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] domain: fix misaligned unmap address in
 unmap_guest_area()
Message-ID: <ZR_l2wuaySHYzW5V@MacBookPdeRoger>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-2-roger.pau@citrix.com>
 <3880a214-ece2-4654-a94e-04f2e1d02353@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3880a214-ece2-4654-a94e-04f2e1d02353@xen.org>
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a90601b-cbbb-4dc5-2006-08dbc659b604
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CCcqZAjB0e2ZKJAnh2rInDWUJw00AAeDbA4CoJqukRb3z7cjWYUBlKViDFKQFxdlaTaOEJtt6CYBk2rGgyPQdsmo0FstDD3GI/r/Ruea7YUk/nUC/tIxPuyPGwsv0l6AId3dYCXEaeRfY5OWNDIJreGV03ORb0xe70g5loPXiDH9DO+d76PHe3gbilp80n1Ko8K3BbEVgwNBxyTFD/qo6oC4sMyjoAAJ94Nx3TlxurCVlSh+kmjhc0ShS0a2tPYPPs11u0/uTtZAZzem4wFbgOHFlDrVmCeRBqxzrwKBtRcBAaPz7pz7JUGo7FRZ35HeWeE1eyVVKzM4tfg21jRFfe67t2FENVn43e++VYd41HlaBYZ75+VmllmfQpI2crfy3UZWwhTAMmUbpkzQTP4N/E4cJz1JDer5SM+uT2D6Ipjww3wmvZS2RFmdJyztxlNc/hLSBBCGFjEB+zlC+VXt9/hpHfrrz9ghY0eRhq18X6NDQ0q9DJwPyAE0NFf8TfRKA8WgmLDfEVFK60YfMi5QiytI/MW7rLs0npuwOM3Lm+jOMe1NNVaiQGQlzA+fP7Bs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(9686003)(66899024)(53546011)(26005)(38100700002)(85182001)(82960400001)(86362001)(5660300002)(4326008)(2906002)(83380400001)(6666004)(478600001)(6506007)(6486002)(6512007)(41300700001)(6916009)(8676002)(54906003)(316002)(33716001)(8936002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDU3MUFyYldER3ZsNkpCa1ZPVzFQS3BNZEd6MENVczhRb3R5YXUzamx0OGRR?=
 =?utf-8?B?a05mUlV4cU11YnQyYUltSXpwTkdaaFQwb3VYWmpobHVKU1lYZThzVkc1Yldn?=
 =?utf-8?B?U2hxTXYycnQ5M2UrMVoyRFlScE9hMHVsQi9OQ3pPRUdWcmo5MXhobGxOS0xh?=
 =?utf-8?B?MXRJeEtOYkdNWDRNUE1QY29BZnBQM1gzS2xqeTFoWUdGQWpwcWhMRFdmS3p6?=
 =?utf-8?B?VnFOM3haakhFNS9PSUpLaHhwdFNiMW0valBGMG94NmsrV2t6ZW45aGZORnhT?=
 =?utf-8?B?K2JYKzg0aHVXTEh0ejJpS3FOYlFJMG9oVDdaUzRFVTJUd0NLS3pZRWl0dkNY?=
 =?utf-8?B?bG43OEJJQnEyd3BoWkRBWGRXNGM3MEVvK1VMWjB5elhQQUprTlRuWUs0ZmQ2?=
 =?utf-8?B?ZElzaUw4NXZOVHhRUVA1REFVMCtRcTQvaUo0Z3F6UWREQ1FCM2dPODlFbHJL?=
 =?utf-8?B?SytJSGRLT2ZmT1BkQVBMUE5qeWNnd1JzOGtBeGhPaHM2YlpPOGpYSHdILzZu?=
 =?utf-8?B?NUMzdDVPSU4zRVNleG9YU2FJcC92MWdOa3hhWm9NWkcxc3NMRDVNWU9iSERy?=
 =?utf-8?B?OW00ZHRvQkRJQ3MzVmRsdTBDQWtsUUkwRzdJNW5sb25rQUltSFpoTnB1ZGU5?=
 =?utf-8?B?LytHV1VGaStINnVwY0EyM2t4RVF3Uk04eVh2V0R2c2dLSkJJb0duaUhST2Vu?=
 =?utf-8?B?QW9OZ0RUblBBMHdwQTFmbGdMWWNUVVpYdFNma29FbnlHN1BYQ21CcjJuemdX?=
 =?utf-8?B?OWtwV1R2OEFaNThudHA1eWRtN3lKczRkMERJOTM3cklhaE9MbURKUFVMcjYx?=
 =?utf-8?B?ZTlxZmZNd3FBbk9zbkhNRnlNZnBVODZIQnp0dVpyc3lLQWVQUkdLVWxUelFT?=
 =?utf-8?B?TzRPY1JRdU9BSDAyTlZHZG5TQkg2TDVIeElhbFFuY0pSSUd2cVZiMjJpR0VC?=
 =?utf-8?B?UkVQY0h1V2NBTXB0dG45eVpyb0hKTnRHUlFPOFBVRzN2YmhDY1AwMVA5RmFi?=
 =?utf-8?B?ay9BVy9YQ1gwL28ybGdOc21xMDZsVWRFVi9KaGR5Z09BMGhEd0VDbVhlNDlH?=
 =?utf-8?B?MnM4SUJoM3h3M250Z3VSWjIxRVhITWxtQUFUa1d1THhSZk4xbXJMLzhnU2g0?=
 =?utf-8?B?K1hFVWZacTBGV3ZBZm5LaXk4NlkzMy9LMXl0NnBCaXp4NFJFSmFVSG1DS1ZH?=
 =?utf-8?B?ZXZrR0VsMG5tU0xkSVpUTUVXc1RCeUd6MlJjWDdzWENnaTlWTzd4dCtwZ0FK?=
 =?utf-8?B?MVdNNGN5dnNhbUJHRzRhNDVFVUwzS2lkNml4aGFWR3lHeGplSXpBcjMvcjQ5?=
 =?utf-8?B?WlF3bk9TUmk2NkFkbE9lbmdyLzlFM20vVG5pODBOYys3THVvOFNINmhYUGhP?=
 =?utf-8?B?d2dQOTBDSm9QSFBoQ0s3ZGRRT3hKdGtmNkZDWXdERGFvbVhIM2pJQ214M2R6?=
 =?utf-8?B?RWNNZFRGZHpXRTJoUDV5M2VmRWlJdThFYTNtYjlXcUFaN0txQXlzK2JFVC84?=
 =?utf-8?B?NWlIWHJXTW9NTXZwRjMyWGRpcFlHWlpsYXRCUzBCNTdFZmFDd3hiWDJuQXpj?=
 =?utf-8?B?V1d1RlJlWEtGRytoTXB3NU1KNG1GL2RGTGhuQ0FUTEdsK3BEMHBTa3B4dXh4?=
 =?utf-8?B?em1WZzFJNkhZOFJ3UFpDeFN2VXVZdEM5TEkzaklQYTMrWktZbitsMWd4Sllv?=
 =?utf-8?B?RUFtemJwejFKTlpCNmxDOGcrQkUzYS9rYkhhbHlzTFhzbzcySGluZ3NIa0xa?=
 =?utf-8?B?Mm5qRjFic1pXbTJUTjRXSSs5dmlsc3hYYTVaK0duV3ZLdUdMc1ViRFNZZUl6?=
 =?utf-8?B?L1psdzNnSVovZ1pHdlRRUGVtRkVzNnV0Vm1tUG9KUGptTjJNNGhrUm9EUjlX?=
 =?utf-8?B?K0lvRjRzZlE0U1pweTJYQTlNSmZ4alVFNTlIN09XZkppMUxZVENGRGZ1Ny8y?=
 =?utf-8?B?S3F2YWdhUHB4OS9Ba1d3TGc1UC8rMTYxWFg1MmJKSG5wNGMxc3Q4enJLTkpj?=
 =?utf-8?B?MmVtTHFUdXlIVHpVK1JUbmJuWkRnYmY4dFhTRkloKzB4a1owc2d6d3I0TS9K?=
 =?utf-8?B?bDUvUlA0SlRrSGNSRmc2MzFqQlJRazZVcEkwcDh3OWJVUlZqVGZMck84MmFB?=
 =?utf-8?Q?xTV2n7APlesFWkfmWEO3BC4cV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EowndA6EdYCaxzs2zAgGswBExMFTgiWSuHiMpxp7PPkVOgCGADyuo3iuGVgU0Bx2lQ1/Vy/JdRiVFwe3G+uJOkiMQh/xI7Gjwt/bSTchxDmWCuZ+D/0rfd1YW1F92H8V44SlRVse8dmSGr5EID+0+n54oV0tWCvXs99ShHJurOLLUflLdpkahSbVMcPQSXOQ23oVs+0se0W68kaQeJbZJik7DwF8BTaJ1uoAOKgr4fbMie7utmu7iAiHzfJ5phjDQS9Dg18e7aaxf7IsodNQfprbCZhk9JuS4dqFWi7Pb4xgGygZoiw4YZWwAW3J1DIeJwIgxTUbDt7sQC5GGO8wF1ZrikkdM2fuwWSy4hkpkBidECCNMPT6/OkykgrOarK7gyyX83ZG+P9GPBk5EOr7xNU7FLC3QfA25+nE34phXX10l4tyb1i/qOBfTbCAdfm/rjhSxFp7Fz/f+srmbHSn4OjwgcUCPwgf5p0XiTQSobTU/4RcEVqY561cgkSN+YaDWddy289BseR1zb1Zh3k+ictbm6SD9PrxWf1uxy/CH6p7hwUPExXKBO/cNe1Vfdchrj1+q1sDXfQtXbZ5acryb94NMRX5xFY0PSlICn1XlrIDI9M4XsI68TNOkgtUzVMQITkQDX2+QydjP4XZ+awTyxbZWe61xMWrkEkM3MFAnFmqs9KIOtLTYfejwaZznqtOMNJpgjStAusSFENf4weD7esRUZqjWJJ4ZiTz8P6kWCQoDFDOahycsExxULMsH9CS89594kmFH+6ODRrPrk/XTxGRKIib9iulDGu5p5OolP2EWA/Kv7AJFt4WoC+OieIfJUFQjmnZzZIJv0Ps7DaF30EfqE2YH/gnhmv4MeOUKGHre0/3xC7bhltgwBUXm0Zu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a90601b-cbbb-4dc5-2006-08dbc659b604
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 10:48:01.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WgRr9eZllkj5dACq1zAnHy5SMUDb8IS/1rH/y0IDWhIJx0MSmoO/XhtEZ3o8fXe0UgLoXEdAWQe4u+kbkZZ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7482

On Fri, Oct 06, 2023 at 11:08:09AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 06/10/2023 10:13, Roger Pau Monne wrote:
> > unmap_domain_page_global() expects the provided address to be page aligned, or
> > else some of the called functions will trigger assertions, like
> > modify_xen_mappings() on x86 or destroy_xen_mappings() on Arm.
> > 
> > The following assert has been reported by osstest arm 32bit tests:
> > 
> > (XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
> > (XEN) ----[ Xen-4.18-rc  arm32  debug=y  Not tainted ]----
> > (XEN) CPU:    0
> > (XEN) PC:     00271a38 destroy_xen_mappings+0x50/0x5c
> > [...]
> > (XEN) Xen call trace:
> > (XEN)    [<00271a38>] destroy_xen_mappings+0x50/0x5c (PC)
> > (XEN)    [<00235aa8>] vunmap+0x30/0x1a0 (LR)
> > (XEN)    [<0026ad88>] unmap_domain_page_global+0x10/0x20
> > (XEN)    [<00208e38>] unmap_guest_area+0x90/0xec
> > (XEN)    [<00208f98>] domain_kill+0x104/0x180
> > (XEN)    [<00239e3c>] do_domctl+0x8ac/0x14fc
> > (XEN)    [<0027ae34>] do_trap_guest_sync+0x570/0x66c
> > (XEN)    [<002019f0>] arch/arm/arm32/entry.o#return_from_trap+0/0x4
> > 
> > Fixes: eadc288cbb0d ('domain: map/unmap GADDR based shared guest areas')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > unmap_domain_page_global() and vunmap() should likely have the same alignment
> > asserts, as not all paths lead to detecting the misalignment of the provided
> > linear address.  Will do a separate patch.
> 
> unmap_domain_page() seems to be able to deal with unaligned pointer. And
> supporting unaligned pointer in vunmap()/unmap_domain_page_global() would
> simplifyy call to those functions.
> 
> So I would consider to deal with the alignment rather than adding ASSERT()
> in the two functions. destroy_xen_mappings() and modify_xen_mappings()
> should stay as-is though.
> 
> Anyway, I don't think this is a 4.18 material.

Maybe, I don't really have a strong opinion.  It seems more sane to me
to expect a page aligned linear address if the function is unmapping a
page, leaves less room for misuse IMO.

> > ---
> >   xen/common/domain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index b8281d7cff9d..2dcc64e659cc 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
> >       if ( pg )
> >       {
> > -        unmap_domain_page_global(map);
> > +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
> 
> Looking at the code, I can't find where 'map' may have become unaligned. Do
> you have a pointer?

In map_guest_area(), there's:

if ( ~gaddr ) /* Map (i.e. not just unmap)? */
{
    [...]
    map = __map_domain_page_global(pg);
    if ( !map )
    {
        put_page_and_type(pg);
        return -ENOMEM;
    }
    map += PAGE_OFFSET(gaddr);
}

> Depending on the answer, the call in map_guest_area() may also need some
> adjustment.

Indeed, I've missed that one, let me spin v2.

Thanks, Roger.

