Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48C75F8B2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568982.889255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvq4-0004fm-03; Mon, 24 Jul 2023 13:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568982.889255; Mon, 24 Jul 2023 13:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvq3-0004dw-TZ; Mon, 24 Jul 2023 13:43:03 +0000
Received: by outflank-mailman (input) for mailman id 568982;
 Mon, 24 Jul 2023 13:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klik=DK=citrix.com=prvs=5629c81f5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qNvq2-0004dq-TW
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:43:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0082b906-2a28-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 15:43:00 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jul 2023 09:42:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5292.namprd03.prod.outlook.com (2603:10b6:5:240::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:42:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:42:44 +0000
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
X-Inumbo-ID: 0082b906-2a28-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690206180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/siqa6srSvXni8+QBEj0B1D7S4UCTuYjftKXCBYYNDY=;
  b=E19IzdC2X6ZKhPViTySbt60DePrwYcYQkSUymKDtJ5D1hHojlLD9Idqd
   JPopPaWCzave+Au8pk3xpElf85NjpNcYv2CDEyRG9wnfJoMqiQp0FBlEY
   PsGkELmz644kaUPeWddlsYVrooAPvsQmrabbeUaSgQHFUe/bvS12BC+wa
   w=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 116523100
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8gy7x6JqLY/E24C4FE+RAZQlxSXFcZb7ZxGr2PjKsXjdYENShWdRy
 DEfXTuDPa2Oazb2f4x0O9i2/BxTsZeDndMyQVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZlPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5bPSYT+
 fhbCQo8VT+vmsWbypOCd8Rz05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12LKVxnqjAOr+EpWd6qBIjFezmlU/L0YKBGqEn9a/i0exDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8UE7wWKxrvR8hyuLGEORT5ca/QrrMYzAzct0
 zehuNfkBidmtrGPflub+q2JtjO5OSUTLmgqaDcNSE0O5NyLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2GEUvvhjutot3DSF4z7wCOBGa9tFomP8iiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:izt7gqzfKFFReWl48bSaKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: =?us-ascii?q?9a23=3AXNClx2g8yqgUkoM1oBiYR/kHtzJuXkGakXvUYG6?=
 =?us-ascii?q?COF1GZKCyZFWxwZ5JjJ87?=
X-Talos-MUID: 9a23:ATFrgAh4B2OsKxU9kZvowsMpEds2waikKBw0vbJdp5i1ChJfPTaUg2Hi
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="116523100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLVerEAlObNAR8L0MQAYu+CV2cBrLUz6jF3Tno3dq1CfqxQQp5jdsptSAc90lLkzB6p7wP0RSM4EHD8RmGfADni/iCuq1259xguD5WfDtCMDnZ4Gb+8/tGA/Tts1BziFsWzXt8QzvlxjRNHqr+HfI/3oQYGwCBY6FpUckRWdJq93OEXZaZo1hLjzOST7kf7UrLc+Redq/igVBaae3cRQ7L57sYCcHcuUkBofBMa5tPen8kjbtvyiRXuN1yKwdFuPRxC/kHKBjOFgPVhzWPjC0EXp+C1cnijIjocmeEFPMshPV9yaHyuSOxPkK7Z/ecieBDMB5RFhFOoXcsrOKI0yGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt0PHpuTnjqwbpU3YSkhKGRJ00J7NkyVGF+Cp4quThs=;
 b=iGic8dmBb+FiHnsS3RPRczoFftxToJdKL/gilBCwyitWDhCAL/md8fMzYlS0Itv48bh6n+zEyS73V1AWZg+bZxetPeZFDpsaUEr+HJ15NmMAMZzSzvfuPDvkV1nmaEICTC1LvtNVDSfow+tfROPuF1fcOdjKB2q2cS1JBa+vuxlUc6+V7u8eKsCSVREASWqKuZ38PRsnLqSuvzDXZPaXcFgUNPcbhLVuy+w4M+hCdbwLD28fYQmlCSq3ng3gkRKIFwJG55OVQYJqR4aXtTQ8660x3KN8KgEUJjsJn+JjUjbHpXjl5nqdDkWlt27CB2hKw8b9mjfFucn3DMPn+kJIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt0PHpuTnjqwbpU3YSkhKGRJ00J7NkyVGF+Cp4quThs=;
 b=bB2W37xrLRVnsA21R+kp2i7fk3tzJDzdza3CS3lDZmkGqUxroNfAKGtP/af51QcgpRRLt/pzBEnYY78MYLJ8B6YRFfqFry+Unu2ct+jx4i+uJftMOdPQN7WmLdfUscjcNyXq8BVJ5yXnCKoM/+Ap9wh9s9KCe09YMyq6pMCojyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Jul 2023 15:42:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Message-ID: <ZL5_zxmcINjPSfIK@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
 <f2b8945e-cedf-3b38-042c-7b1288cfcde7@suse.com>
 <ZL55nfjyL-WpIWyt@MacBook-Air-de-Roger.local>
 <a7821ebf-674a-87ce-7d26-d87ae4c9d040@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7821ebf-674a-87ce-7d26-d87ae4c9d040@suse.com>
X-ClientProxiedBy: LO4P123CA0467.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c09a11-de9f-4769-1939-08db8c4bdbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LehecBcEJ203E3zgmzgkrjzgXYzfBMMuyADVXoE+XyVGZLOzQd2pf1pxUcGRhJBPPh+PE5+jsPmoIz+LECKuGu7p258QEMveS2WnC5zWzbyxxTWuXMqFBefWrn3BV7a3D9fKlV1BMkf9l1fXpTSpS+G4WUytSAQeP3aEgbqn/DcXycH/we1tRxnTX/Hz9++dMsDSpnm0BbErgnCRCIWgsKRkqwzP+QlYlc5U8O+kS7SJLvi34ywgbcwghVYKvAmIUYq3QZPmk9a8pqFwX6wEA1dIB60t2CUQ9bCnLok/MVGmSAToTAcSg0dO4OeG+1NB5ICA2i/ExB1JjpbGISb/kpS6qOer41KDePqethFeZsskpFb3+eaDHasGe/31uChWMK1Z/hdzldZ4TCjJl7j2zCdwKYcOPQ4p4PqLzUjUKYObGEpgd3a+LuaVmdbsDFhpkkl4IJVLYyEqp/b3ZeN9k+xmDpyngV2NJkp8hsi7olHgdMBmquMyYBIxUaIdOujYfOIVCzqs2WfdjYwMUmkJhFj5nvenafqXyzpg9N5AGaPzyxn7UvsVogHo3LCCq7ez
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(6512007)(82960400001)(38100700002)(83380400001)(6506007)(53546011)(186003)(26005)(5660300002)(8676002)(8936002)(2906002)(41300700001)(85182001)(66556008)(6486002)(6666004)(66476007)(66946007)(6916009)(4326008)(478600001)(54906003)(316002)(86362001)(9686003)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXlkdlg2UjgvMVlJLzhZU2RFSytBRGRnK2tJQlFkcm5BOU1HdzJxUy9ZeE9N?=
 =?utf-8?B?Vm9jdnNUN0dmSmZxOUlOdEJ3WkM3MWhJUVQ4RnJtNUVDbzFSVm00SWhuYyto?=
 =?utf-8?B?c3J6UnlVNEYvc1ZxQTJGalp2cTd4Ky9tZUhoYmF6MGc2TGJPbm4wVU1qdzNX?=
 =?utf-8?B?WTNOSk9LU2xEMlBlWFo0UWJFVk9sWFROVHZMYTNYWFNKQVB4Nk9OUlRRRzRD?=
 =?utf-8?B?Sm1zUXNXeXNqV1pUQ3hSNlo5bFBZVDBpMFYwQ3c2YkZ4eFhVUkVZRm5JOVpp?=
 =?utf-8?B?OWcwUEJVdXE0U2IyRFBBYjdUWVZkYU9VSmdSN0JqTjNDSHhLQkdhQ0ZQOVZF?=
 =?utf-8?B?cWsvZ2QyNjZFN3RBaXp6ZnRGTkt1cFB1OVR4aG9FT1YzUUlPZDQ2Q0NsYS91?=
 =?utf-8?B?THZPQzcybG93SzhrY29OZEw2TUJMQzNsOTkxNjBFbm5hUFRzTWQwY2RPbmlV?=
 =?utf-8?B?L3dsVlF3OVdhYUoxQlRQMzlDZWE5aVBLYVJrVzRjdmNRaDlxSkkrRjJnWVc2?=
 =?utf-8?B?Y01lQUIreVRYRXl0ZzVwNUpWYmxmUGJZdUJ4MU5sYkxvYlVIZERKNFYxR1Yr?=
 =?utf-8?B?ZDBENXNRUUJhb1lGU0MyVWxac2dMbUN1ZE8rSERVR2xTQTZNOGc0VDNNbktT?=
 =?utf-8?B?Myt5SVVTaVdPd2h6bkRQeGJJazZhbkp6L3QzdHNDTzBybElNL1NPRFBXZXlV?=
 =?utf-8?B?OVI0Q3MvT3ZRTkR2dGtjUy83eC9vb3dQd3lFMC9UWjJ2SDY5bEpsaUtWOTJa?=
 =?utf-8?B?enQvMDVTaG9JckliQUcvUHFOYkgxUVRyUHdOaUNLRVV4bi84V0ZqS0RLV0tF?=
 =?utf-8?B?SlpERFBhUzQwdWYwdys2NVU1L1JwQXpVdlNrczk3djJ3SWxMRUFiVld2R24x?=
 =?utf-8?B?M20xY3JydUJ1MDl1bzNXMWE3d21hd3M1T0M1Z0hhMUFjQ3RiT3JOWDBmazU2?=
 =?utf-8?B?UndBT2ppNkZpdDdiUnJQVVRDWjRoK29wM0J0MDhaQ0JWa2trYjQ1Uk11REtH?=
 =?utf-8?B?cENxNXordzF1VlF6dk5rU3hKT1E5VnpRL2E1TmFRbWRQWENTSlhSbzUvYXoy?=
 =?utf-8?B?OFV5NmlEUGM3U2VSZ2tyNlBySHdVaWFTY3EzdDVGZ3RSWWd5ajlEdEJOcGsz?=
 =?utf-8?B?VVRDWUY5Z3lMQWhTTzVPQmVPMzJ1ckNkTC9STDhCTERIbUpBc1hlL2taZGMv?=
 =?utf-8?B?d0FKSWNrZHVKMUFjSFpybDlzUDRuaDJwVVc0QmI5T00xOHhkYk5ZaXo2b0Y1?=
 =?utf-8?B?K0VFZG9jYVVZV3h1NVUySUJBRWM3WXNjVC82RFRDWUUrL0w0QXRjbG1NZDZ6?=
 =?utf-8?B?Tk5HMklaM2N2aWcwcm13dkxLSS90Q0JhWTVITjVBOHk0ak9KN2ZmR3F6UGgv?=
 =?utf-8?B?dEhXSlMvTjdObExEQzE4Q2c4UytPRkF3ejMxS1pwZ0psZFFyN3VJdGlKella?=
 =?utf-8?B?RENYQzNqK3JqV1BrcE9VclFWeUo4MDRvSExEY0Y0MTI2cTU4bXk1b2RCdFEw?=
 =?utf-8?B?RDk5V2RmYllmbGlaU2dSNGFYTE04cG4wbE52NmFnL2xrakkvQzBkSllZanly?=
 =?utf-8?B?dGtSdFZEUWdmcUxiT3BIY0srUEpJTUV2THZIRFZCTnUwZ2k3Y2s5cTFramtH?=
 =?utf-8?B?dlduU253SGFQb0pOK2N1OU9lZmlYbGRXVGJXSElUZ3duYyszblhncHhOcTNQ?=
 =?utf-8?B?MCtDdXNqNHJMUkcwRXhvejhscWFZTjVoWFptOTcvcWZrcUdXY1VLbmVOaytV?=
 =?utf-8?B?a25jYXE0MW8yTjB0VkttZURxRHJyVnM0UDE5WUpOSGxKZnY1Z29FQURXUHBR?=
 =?utf-8?B?clphanhLL2lhNWNZMDBUTmQ1QUdLdlMvM1NsRG4xYWh6dFU5L1V3TG5iV1BQ?=
 =?utf-8?B?M2UwbnlJb0hXV1RpSk9yTzlxSDl3M2g2b3dDWklQbHo4eTgwS21oRStQTFIr?=
 =?utf-8?B?T3orQU5IaG1IaTgrNjRFOTc2RVpiUlZ4QkhOMlIvUFM2YzBHU1hUejRPNTg3?=
 =?utf-8?B?ZlhUVnM2L1pMc1Y4RmY5bWczTndQM1BidHBKV0NRc0szbG5TU084eExYdEsw?=
 =?utf-8?B?bEVSSHk2eFNJQ1gwUjU4RWhmRFZvYngrT2t1Wm5HTnFLRE9wRk4xOXRCNmVi?=
 =?utf-8?B?aERqQUlOU2o5N3B3cVc2TEhKRS9mZy9NTnpkRUprSVVPMzJVQklDQis5ODRl?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	06RxqAgo6cazp8b6kZJK8dLuZnCNkKalTtgbcV0odFLxSIoIoj9m2XzMH5AHM7eT8ADN6EMq/SpU5ZF2XNNrsxvJqabFAstYA7TGIpyZwEfRp3No9fWwibQw27sXg8fChf5RvuzhVgxJsXukgApIG5q89Z4fDdKatFu8oPbMevwjR+yERT/3PstnhuMp6T5g13pUC4wyP8X6fY/z5xNo17A8KaGd1qlsC3S7Uo9cwV8rQ85sBxGM4r471gmpDUYPoGs4srLHpmE71knOzbHE0O74XXMsdJ5+osorI9/oQC1Qf/F5V5I8hz7RmhMZNojHZ+APyXJXXKuwQpO7pwCUry6UmMYknZhYJq3pJniucYT7etHnnylTQrO/ar9iqrtoC9gMR0LCY8VQjq8xitXzc+pAh87RIjJ4F3S8nHelmVS65WJo4w4YYR/W5gwZtpUETwG39jiF53mldoiWNtF5sK44/kbIqZZRx0CMsi+r6jzxbpqEx/H3PIIhY6/z8tltiUWvtKFQZ4kxMIH4X8wTABSklwYJ6rN3tOF0sfpFIoULyZX95l2T/JQgVpCNQ+jcU6KRs2CxHCyuitStkutMHXxE9Sb2z4kfWDWfGdu7HD8CHeJLp+qKgxgpyeHdeqSqUwuHfHyv5tzbmZXQbnR6nEhB4tYyFVnaPfnKoMhBLSDiXFYiAl6ySc7QSTym9AqhFmt1gloE4ZkE91by1gtJdGp2DZSWd5rzLHp6QPO5Vb2kThseN0AkPb8Vp0LldPcXusxzPWgz+TFbqem81JRYmpNhdNg5kMQW15Fq1vLAAe2nQFkq2n5NA2Ltvqv36NLIsx4RTefOjWdloLEMsbz+Ag==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c09a11-de9f-4769-1939-08db8c4bdbc9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:42:44.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdt5mxTufHbUY+v0bwW1K0fCbN7wGCMaGQtPnSTgJU9mvdah4wo/vwAqazruFc6ERw3YvlESzZ0sVf0JnK/mUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5292

On Mon, Jul 24, 2023 at 03:31:56PM +0200, Jan Beulich wrote:
> On 24.07.2023 15:16, Roger Pau Monné wrote:
> > On Mon, Jul 24, 2023 at 12:43:26PM +0200, Jan Beulich wrote:
> >> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> >>> @@ -52,8 +66,8 @@ static int cf_check map_range(
> >>>           * - {un}map_mmio_regions doesn't support preemption.
> >>>           */
> >>>  
> >>> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> >>> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> >>> +        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
> >>> +                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
> >>
> >> Aiui this is the first direct exposure of these functions to DomU-s;
> > 
> > I guess it depends on how direct you consider exposure from
> > XEN_DOMCTL_memory_mapping hypercall, as that's what gets called by
> > QEMU also in order to set up BAR mappings.
> 
> Fair point - it is one of the few domctls not covered by XSA-77.
> 
> >> so far all calls were Xen-internal or from a domctl. There are a
> >> couple of Arm TODOs listed in the comment ahead, but I'm not sure
> >> that's all what is lacking here, and it's unclear whether this can
> >> sensibly be left as a follow-on activity (at the very least known
> >> open issues need mentioning as TODOs).
> >>
> >> For example the x86 function truncates an unsigned long local
> >> variable to (signed) int in its main return statement. This may for
> >> the moment still be only a theoretical issue, but will need dealing
> >> with sooner or later, I think.
> > 
> > One bit that we need to add is the iomem_access_permitted() plus the
> > xsm_iomem_mapping() checks to map_range().
> 
> The former would just be reassurance, wouldn't it? Assigning a PCI
> device surely implies granting access to all its BARs (minus the
> MSI-X page(s), if any).

Indeed.  But for consistency we need to match the same checks that are
done in XEN_DOMCTL_memory_mapping.

> The latter would of course be more
> "interesting", as XSM could in principle interject.

Yes, we need both.  In fact I'm just writing a patch to add them
straight away.

Thanks, Roger.

