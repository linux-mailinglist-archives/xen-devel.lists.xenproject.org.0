Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4296C6D56
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513960.795765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNjY-00041y-Q8; Thu, 23 Mar 2023 16:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513960.795765; Thu, 23 Mar 2023 16:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNjY-0003zd-NG; Thu, 23 Mar 2023 16:24:12 +0000
Received: by outflank-mailman (input) for mailman id 513960;
 Thu, 23 Mar 2023 16:24:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfNjX-0003zX-04
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:24:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 214cef6f-c997-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 17:24:08 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 12:23:49 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5774.namprd03.prod.outlook.com (2603:10b6:a03:2da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 16:23:46 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 16:23:46 +0000
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
X-Inumbo-ID: 214cef6f-c997-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679588648;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T8lDDoo+AjnAsz6oX76Wj14C0jXif3H0zZp2xTXzQRg=;
  b=cfN3USBY7PBBYYWXp7rEfyPWELr+aAkYmxpJSRnFCD/bfdu0eRpw4HJq
   bS4HBsnlWN7PgUBtxKDFpEqVwi9+tPN5Zb1DF4ljuKjoMvZq4iLiRkEG4
   9xisAe4YIr7E448PJhFcmIdVPInNmD9Vt6D4qctNaJhn2qC1u08IMvlpJ
   8=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 104472994
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ivcDX6/w6Y2MuaKmqHyHDrUD6X6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GMfW2uGafrcMzT8f9FyYI3l90lTscOBmIdgTVBppS88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklJr
 MQ2MHMpVimfxPCnwbCERqpHtuIaeZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwX+kAtNDSNVU8NZVkmWhgVERASQzRGbhraelqnaUB/1Af
 hl8Fi0G6PJaGFaQZsP0Tlu4vXeCsTYVXtYWGOo/gCmPwKfJ5weSBkAfUyVMLtchsacebDgnx
 laPk97zQxBirbaVRGi1/7KY6zi1PEA9Bm8YZDQYTAIDpfrkrYcygTrGS9olG6mw5vXOBTzvy
 iqW6gg/g7keh9QC0amT9FXLxTmro/DhRBMv9AzTWW6i8QpRa4usZoju4l/ehd5gK4CWSlSA5
 T4khsGY48gHCJ3LnyuIKM0vAbWo7rC3MDTajnZmGpVn/DOok1aBfJlR6Tc4D0dkNO4NfDOva
 0jW0StK/4NaNnauaa5xYqqyBt4swKymEs7qPtjEY9wLbpVveQuv+CB1eVXWz23riFIrk6w0J
 dGca8nEMJoBIaFuzT7zS+JD17Yun3k63TmKG8C9yAm7272DYnLTUa0CLFaFcuE+6uWDvRnR9
 NFcccCNzn2zTdHDX8UeyqZLRXhiEJTxLcyeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:vziC4aO6F35/vcBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="104472994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwG/PT5AXkb8vWcOVa0l+IJaBxMJE4nGs7Xo44AIRSmLQrUltmOJMwsUTe82nvPyqCpDzNtba28aUTj9l2wQweRWHIp+3o5WuDTmeMXYOhyIEuEkAUPbhjFilLhspVcEqVvGn4sqYse6ug7vsvkqSjI+5xlV6yZ2UU7nKSU8Xn4KyB4xtslNA/2p6r5yuhr+OjNoeda01ttVz/WVQo6wRCSyWKMqlqRrL1wG5aVVxkSVw8TJrn6LngxtQ1R+Ql987brCuAJqSNNNxzIbD/KIRWNXGCz16X8VhKu7+ifv1gXPyG1o8eNW2uvdLtISq2Gfo3rZX6IyBLs9pbed8ErpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCHwupboOH9N1m5o0ohbhUSnk3qxbfrCdnvZ5qLCsno=;
 b=R+PVG9jZFsXYRGcFZuFo8yJmbrYE8vT1l9Jwk+n5JmLuCqStNB7M6yMKxlIqqI3VihWYgbUe7dlCtYpEPao6MDF80AW6X2fwEzkFoxqxnxIK4nnIq1yagsZULpWsmpg/jVH63ZQR+1bTaJMkU+2e4W975haSzemRo2YTWg0xsm32bsQ3YvFChGAvEaIETXSXNIn7k3NPiE7gUNID5uhaU72Tb2DtpudOALYgEHuJp0NipBo4+iDY/9Ppq14sIoEneNLfoEBpNU+X39Chqbkq/o5jbgtq5WJmIlyST65AUdAJoS7t21FzN1BCpFArb6/DihL5U9rpPhFtDfD5TgHJRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCHwupboOH9N1m5o0ohbhUSnk3qxbfrCdnvZ5qLCsno=;
 b=uZk0nWxmFkO7PMryJlrnJDZ/eYaTubVE9dCDlo+iDbjySRj4GLpPyafEdChPPnkwOdKkO6uo0fAiZCyhoXx8wgvOCsujk0pqrYWUuXuhCjfowvyNEZlyA69rpkGXUDaw4G3TrUNRmiYX9eVA4j2BROtudyn7x2FGks6fLjGiSbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 17:23:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBx9C5BJD1jSiHPS@Air-de-Roger>
References: <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
 <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
 <ZBwtaceTNvCYksmR@Air-de-Roger>
 <ZBxVcBG5yD74Pa3a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBxVcBG5yD74Pa3a@amd.com>
X-ClientProxiedBy: LO2P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a5cb97-6514-4af4-6d06-08db2bbaf9d7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34A4PuCnVlCemoxmfK0JwnVADxNtEq058+rmzL60LZdVkaClnyrowius5S5CI4JZ4/O89wYUUNWh6px9fRGGZdx1dBS8e1HGJ8TLVilpMhrrhdZYP0NLDqaB/GCgNPeanDXSIC48d+YJgQ7BImz6auFr9Fx2MutRTu+QBaKo3JB3lBoHG9LmY6Sz803h9y0j1KApjp10AgZ+T8rkTMge615W2WxcVY/RlGgf+qZS/X5IC0XPh6RYD/Ehr+YkuA4bfmaj3Ct81gjeLN2ITxHJO4pR1awF5I87AaEYfqgSha4FJVknGwcmKwxauFpvgsrnDtBwWjnZsAoK4moS8c9sv5DqaWDrfEdoQPG5rhuwEKB4CgxZr608eib5ZRcK+bgpN/O/97OvK7HnW5eXMU3wNx223+vMFtklvL2AL7JpmMlJnmWxOoekw4YDOEN/R12z4k5JFtj6RUW20d1WPd3hnk31+/YJp5cN12JtFr9DnsiJOzmYlr146fbSIRPe2ffoXo4g573Xf7pGv2lux+hQf2hsISd4vet1ta3KtUnV7upFK8bHWLVxKIHnrNNIAO6xu3BOVTYeGhn5nI0zeiu9JZu2MITNGcAmtPHWE16EGJYXOeo2UsFLZyE1ZS7PHnbMPOBqSF1vU1XaxP+76vM6aA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(33716001)(6486002)(86362001)(26005)(6666004)(6512007)(6506007)(53546011)(83380400001)(9686003)(82960400001)(66899018)(478600001)(41300700001)(54906003)(316002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(186003)(7416002)(2906002)(8936002)(5660300002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RiOVpYenhFZDlSSmtPUDE4M0F1eE1vSkxoclpXUlVCajBjbnNaRHFyUVVQ?=
 =?utf-8?B?TzNlKzhlL3RWSFJZWVZXNWFVN1IzeTNCMDBHRkNBdG1tcWNzYkRHRFlzeTND?=
 =?utf-8?B?RlM3WWtOTEk0cEdjcDJ1VjgwU2FKWDQvUk5OQ2F3cW5hTmdMNGFpeFpsaGhi?=
 =?utf-8?B?bnBrOCthSVU4TlNEcWhHbG5telhJaUFOR253dmRZUkQyYlR2WTZoeGNZeDFL?=
 =?utf-8?B?MTBSeGgxUVBuYTNlNmNUazBIKzRXTXBMSWtSY0Rub2lseDVHQWw3c21rbHIx?=
 =?utf-8?B?c2VSUzVnSUNUbW0ydGNwRWs4eHZzdWhTSnpLencxaVAxZ3lnZFg3MVJkTHgz?=
 =?utf-8?B?NSt0bmU3alQwd0RuWm9jN1lxcmhlbGUwM0d3Q1ZXdTl6Ry9vTmtHcHF0bThh?=
 =?utf-8?B?TWxCR2phR3JwZkxIY2Njbmc0UGN4czNaOWU2YzIxSHZEMEUzc3lucVhBc05v?=
 =?utf-8?B?RGdXai9BYkRVTnY0R2l0ZTdZb3hjMzRnN0h4MFZXSWFzUjgzMHE4ZlRMb3FR?=
 =?utf-8?B?RHN1QjdTWVQ2Z2E2UVhYWnZxaHdzc2x0dGQyNXVpVjFPWFBXRzJ3Y2ZjbHRa?=
 =?utf-8?B?TXZBRExmbU83a2RSRWNSdVk1ejRtUnRRMTBKSmMxMGFIWUtSNzhUS243REhw?=
 =?utf-8?B?WTc4Mzd5NHY3K2dyWU5RQ2paOWI4WGlNOU1QTUd5WmFtZWNQT2p2MTZ4VGk2?=
 =?utf-8?B?cEJVSWwrVCthUkd5djlyU1N5YXR0ZlJVaE14UGFubGFxY2dGS2FYQ052MlN4?=
 =?utf-8?B?R1ZsTnMrV3gwSXQ5TzhzK2U2SXVjWWRMdTVCamZrMkVZd2xzaWJvWDZVSWlv?=
 =?utf-8?B?VXIwRXQyelM1U1ZaRTNQeHM2bnVTbTUwNEdwaG40WlNxSU8rNGIyQ0Zaa1Vx?=
 =?utf-8?B?bDNGWXdNS1pzdHd6aXZTNS9aMUt3V1d4Q29sK0hQL1dSQjhnait0RUdkNDd1?=
 =?utf-8?B?MzhDeTJDQjI4aFVBMmtzYnVYNDFFTmNwcUVabC9zWEdEaVFEUEZXT1g2aENh?=
 =?utf-8?B?WGorOFJISkZoY2kraUF0RjF6V2Q5WnpEZ2tia0dSUU1wUUFrNlo1MHhWS3BF?=
 =?utf-8?B?TjdxMkRnVWg3aU0rdUVlcThHLzI0cFp0b2RrUGhaRnB2NUNXWHJQV0g2WFFr?=
 =?utf-8?B?ZEtndHV2azBMVnUvaUNUY0hJbUZjbXlNSzBXV3ErY3NtYmlWOGVwSnkyMS93?=
 =?utf-8?B?VzhHb1oveEhlSnExTjFqR3ZjbHAzcURZRzMvSk5QNkJHOGoxTS9xcVRnbDZH?=
 =?utf-8?B?YjdRam9aMUZ3c21JMHVrdnJkYVVPR3JURWtGMHgwdXlqemhTWnFSZ25iM0dh?=
 =?utf-8?B?OUozNG1nSnRTcGpUYmtnSVBqdjdrMXpLaExyVmFoSFBsOThPSmFac1kvYWpT?=
 =?utf-8?B?Y09TMVZJdnlXTFFTelM2STdZZGlOSURKMXVVRndMNzNNSUNxR1ZZeDMrR1Fm?=
 =?utf-8?B?M2pGOFR2amJIeXBKYnRrWEVEcVJGK2JVcEV3SVcrSWJ3Q2FtNEovZDh5RE5p?=
 =?utf-8?B?cjEyd1NOZ2NuWlNJeWsvTzcxSmdWTGQ3YlZEYmdwQlJ1bkF1YzJOc1U3OWpZ?=
 =?utf-8?B?Tzk0Yy9CL2crODk2ZHVqMU1vUFdRanRqWE1ETlh1a1Ava3k4TFhSbi9scjdZ?=
 =?utf-8?B?OWs3U1FUeWhRcTNyV3NXRUc5dEk3aTk5bnk4VFlnd3JESzVMb1g4WnovL1Ft?=
 =?utf-8?B?Rk5jMDRUS2xsQktJWHdHTVZCSSt4d3ZwekYxaEJFcktLTVJMNWVla21WZFBB?=
 =?utf-8?B?RHYyaFJwV1VOSkozRVVTU2ZmUk1Qc2t0SHFrK2FtN1JCZXFhVmxxZ0tDOUNZ?=
 =?utf-8?B?M0IrdWFKNGo3d3Y2UEZVN29sMmpESFIzaFNWS0N4aWNHVHoza3J1aEczbXNO?=
 =?utf-8?B?Rk5XY0hRRTF6clN6Vm9xemcrVCtic2tTNEVDNkRuWGxabXVGbVlZbS9ueWxQ?=
 =?utf-8?B?aGt1SmtVeFZJZlRSSkMrY0pEZEdGNFRteklBalEzVGxaVFE1dXpSTXZwSmJP?=
 =?utf-8?B?SmMvVW0wMTY4eU5ZVDVzRCtia3V5N245V0JkMUtma0dvdjVIQkxUNFVtWWpH?=
 =?utf-8?B?aERGYVpxVWNkT05KWS9XalRkTTJSL2Y1c3hqRzJEUm1YMVpaeHF4Mk95S2VR?=
 =?utf-8?B?dzJvYkRUd01VM0ZNNmpGMlJkUDYrTngzbHZJYS9hekRFZ3lOR2pqdFowRGxH?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EgbpVIHUGeAAV2bTLOCmBqZ2nbCt5+FjON2O57BnM/ZE9ly047hl4SRspd5/RHW4GtJ5HReKLMUQCNX16fuj+s4AJgImE6PtlahToNetKXaxuLpDMtkHd/RV092uANIzhkqciB/EKk1qZVC9mAhmfSVJge1xdlEP8VI6xr2WPecsQ2ku5wOp/IW60/k/OWC5bcpaVhZM27i9Lx28y6Lup2VLPGN4aC1hZINT7rN2GkU7PkW5A5HPI9mh8qC0Z+PJYmDnJ4jTlgMcrNci1HMev6TebeNjUREIN2St+5TvJpaEcQO4zm3OnmDsHtsOl9AtuGxi+NPDm9Eiffbljd/DRPdhNCywHttZ0pwrsCaycI8lRi7SZHpNd4wgMqIlefzEjFg7jDouIvSR2r0L1dtgL7/Wv6SZQZ7Er2oSetDYroP9wvpufXxsSuDS0Jqryg5PXTYqZc0ANOlNhWZkr13vslNi56E7rWQwZXg7x+SwdheNqQNgjheFBB0EWGNMUAmJmEKJoqitDELNm3EPw73dUDVSS+AqSG/Znq6+IoyxMnKqO2kvvnOKPC9M8Tr/eugoNdm9N6T9/Llau87lsaVmREQ8tAgRtxqMYqr8v2lChQzlH8juh5hcFU74DYUNzxi2wmFjIQod4Ki4EHwgYEuZ0MQLbD326iVrvGIl1FeT5GNHaTGhhTQB2i/ZZ5PV7i/R0RoKWvnSkAjLGYxFSihkWOIorH9+1Frs9TxQlx8c9w8avAWUSpxFaKcH03Yiao3Wyt+So43AvG4XMpk4KYNWbUghO4h99CXoo7VD17yRjsDSLBDzJFDNg/jyXHISSJpBe8jjF8cdrIGemQFiT5yFqTp+xs3Q0ESxRs4pSknNTMLbokP0E9QdryNvtbPUSz0d
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a5cb97-6514-4af4-6d06-08db2bbaf9d7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:23:46.2050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hs4dOGSZdgRgGXrVCRK6rsS9ItgSBch2B8NS9aaXYbV2ezoo/Rsl3IRuiuYG9jP7DEZf9HrUsv/XuNQQ7VmdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774

On Thu, Mar 23, 2023 at 09:34:40PM +0800, Huang Rui wrote:
> On Thu, Mar 23, 2023 at 06:43:53PM +0800, Roger Pau Monné wrote:
> > On Wed, Mar 22, 2023 at 01:48:30PM +0100, Jan Beulich wrote:
> > > On 22.03.2023 13:33, Huang Rui wrote:
> > > > I traced that while we do pci-assignable-add, we will follow below trace to
> > > > bind the passthrough device.
> > > > 
> > > > pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> > > > 
> > > > Then kernel xen-pciback driver want to add virtual configuration spaces. In
> > > > this phase, the bar_write() in xen hypervisor will be called. I still need
> > > > a bit more time to figure the exact reason. May I know where the
> > > > xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
> > > 
> > > Any config space access would. And I might guess ...
> > > 
> > > > [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> > > > [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> > > > [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> > > > [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> > > > [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> > > > [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> > > > [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> > > > [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> > > > [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> > > > [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> > > > [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> > > > [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> > > > [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> > > > [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> > > > [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> > > > [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> > > > [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> > > > [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> > > > [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> > > > [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> > > > [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> > > > [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> > > > [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> > > > [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> > > > [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> > > > [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> > > > [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> > > > [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> > > > [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> > > > [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> > > > [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> > > > [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> > > > [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> > > > [  462.911658] Already setup the GSI :28
> > > > [  462.911668] Already map the GSI :28 and IRQ: 115
> > > > [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> > > > [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> > > > [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
> > > 
> > > ... it is actually the reset here, saving and then restoring config space.
> > > If e.g. that restore was done "blindly" (i.e. simply writing fields low to
> > > high), then memory decode would be re-enabled before the BARs are written.
> > 
> > The problem is also that we don't tell vPCI that the device has been
> > reset, so the current cached state in pdev->vpci is all out of date
> > with the real device state.
> > 
> > I didn't hit this on my test because the device I was using had no
> > reset support.
> > 
> > I don't think it's feasible for Xen to detect all the possible reset
> > methods dom0 might use, as some of those are device specific for
> > example.
> 
> OK.
> 
> > 
> > We would have to introduce a new hypercall that clears all vPCI device
> > state, PHYSDEVOP_pci_device_reset for example.  This will involve
> > adding proper cleanup functions, as the current code in
> > vpci_remove_device() only deals with allocated memory (because so far
> > devices where not deassigned) but we now also need to make sure
> > MSI(-X) interrupts are torn down and freed, and will also require
> > removing any mappings of BARs into the dom0 physmap.
> > 
> 
> Thanks for the suggestion. Let me make the new PHYSDEVOP_pci_device_reset
> in the next version instead of current workaround.
> 
> The MSI(-X) interrupts doesn't work in our platform, I don't figure the
> root cause yet.

Do MSI-X interrupts work when the device is in use by dom0 (both Pv
and PVH)?

> Could you please elaborate where we should require removing
> any mappings of BARs into the dom0 physmap here?

I think you can just use `modify_bars(pdev, 0, 0)`, as that will
effectively remove any BARs from the memory map.  That should also
take care of preemption, so you should be good to go.

Regards, Roger.

