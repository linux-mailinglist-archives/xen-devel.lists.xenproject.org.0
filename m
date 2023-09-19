Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D242E7A689E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 18:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604936.942498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidJU-0004K6-07; Tue, 19 Sep 2023 16:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604936.942498; Tue, 19 Sep 2023 16:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidJT-0004Gp-Tc; Tue, 19 Sep 2023 16:10:59 +0000
Received: by outflank-mailman (input) for mailman id 604936;
 Tue, 19 Sep 2023 16:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qidJR-0004FO-Mk
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 16:10:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ab15c48-5707-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 18:10:54 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 12:10:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7036.namprd03.prod.outlook.com (2603:10b6:806:32d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 16:10:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 16:10:44 +0000
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
X-Inumbo-ID: 1ab15c48-5707-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695139854;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BClnk62efXhUX9q/EK0ASo3cPTglOlJAbi2useegzE4=;
  b=V8BCUvIqaRKidTnnJgUUKmzeLVNdRKnCWcTtOz7Jl1W586dVWYD/zz0H
   rb9tSwEiC7vj0B5ht+kxxddxHh3Epr8EHoJeDbWjeLYhinfMxCiwDYUzb
   RglLFMsFM6cO0ve3IcgmghTsQ8nfexkv2fVpyvemG7PkL9N+oMUoryiB/
   4=;
X-CSE-ConnectionGUID: BzNkNXrFTr6ZneI5QFn0Rw==
X-CSE-MsgGUID: Qegpk4p7Rom3qekOlnHP/Q==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 123533925
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0gkVUqK39ta6isPGFE+R6pQlxSXFcZb7ZxGr2PjKsXjdYENS1DcCy
 2IZX2+Caf6MZ2L8LY1zadyw8BlU7ZCHn98yHQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5dE0dN0
 8wCBgwXMCKFisPr+Zy9EtNz05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23bKUxnKhBer+EpWB+/FygwGLmVYUDUYPWFicpf+ZsgmHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAfN2QCeCQHXyMD7sX4q4grg1TJQ8oLLUKuptj8GDW1y
 TbaqiE73uwXlZRSifX9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcjlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:LDear61V/fRYaMGDs9j3dwqjBEIkLtp133Aq2lEZdPUMSL3lqy
 iv9M5rsCMc+wxhJ03I+OrwSpVoJEm3yXcb2/hoAV7PZniEhILsFvAe0WKA+UyUJ8SdzJ8n6U
 4IScEXY73N5BpB/LzHCWGDcurIq+P3lJxA8N2uqUuFOjsaDJ2IgT0JaDpz0XcbeOCFP/cE/V
 anifauzlGbCA0qhqXSPAh3YwGfnay7qHusW295O/du0nj/sdpg0tDHLyQ=
X-Talos-CUID: 9a23:akJE+G1WGXZ+prwmR1gthLxfMNIDcVvt1lnsORGKD2tIFYS7Tweq5/Yx
X-Talos-MUID: 9a23:OxEKzwtI628RqcIRq82nvTxtLMQ0+/uUD0VWiJgFnM2CFRQ3AmLI
X-IronPort-AV: E=Sophos;i="6.02,160,1688443200"; 
   d="scan'208";a="123533925"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyU2AqH9iv+/bS58sgy7/hfQGJK8dZmeZ3Pn8Y6gk6U20T9sYBzAwtITprrzXuJMd2D7yRW1Ty6Gdj2+0HLQSF6ld8eXFO9cqFmTio5X+dW6LFtB6TbvknThtZ61e6GMQID1YypV1LqzAneVCw1WHu6LqPJ7XrJ7o++Tv5vK8q7V4cGHATdzzVqgPo2zLVsMhQnKWBvcZQG1Oxm785bQZlUpxWD1Nq01AFdmlTkG7L35b0LI/hmnapc509XuhvY40QGneKDyzZtBtFGQipwfGbNkfOawW3ET38k88g1xOg90erEt63RYVxcySS5b+cb1zASZDt8Y0JN64D3X4YT+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzB52rPHSHlGYQSwoPjilvSJKKIzILBLeWefDBCTDgQ=;
 b=GvbMSMX9dSczPEWQdIWq9NNqUYqaxUgN/r7/wbi8XUPg0E+SgF2H8LfFNlvupmMkHcKu6too6wKeIb7JBX8E2y66zsAFB1SPe74BHxm/QMkPxOUvtHddxqndpZ8jxIwSvXWo8baLWintJQV4wEyBjjdYWVub50EtJK92ird9SwA3oQ4N9++7B92yphTtyToxF8eqAqXgGWQIp5Io93aeLEr+nECdgSsl6xp5BoMIoyW+SJW+yNSIHMctoU0u+l9TiUac3ja8bPjJHFAROW/+lDvsk9ed1lMBiLgGK7OvnipS2WWMp41MCgDuyu1i3vTAYvnLWFA5xH4LoKJ0s2y8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzB52rPHSHlGYQSwoPjilvSJKKIzILBLeWefDBCTDgQ=;
 b=irsXWkrL05EKrMkl09yaVb/TxaDMu1lRuYnqKtlITYETNRmWFAM2lgXZLOInsktoHSCSQTknSe25jw2R6Lsb6FP1eH+lWM8g2fKwG+x/BXDQ9QRd6EkCf9Vz5dZZ2lRwBzBf6fHDX0bJtTgYjNnrVI5TvCIkfNzCVXG28h4x7uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 18:10:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Chuck Zmudzinski <brchuckz@netscape.net>
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Message-ID: <ZQnH_mbXgiqLFX6T@MacBookPdeRoger>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
 <ZQlHj5rjMaYj8Z4e@MacBookPdeRoger>
 <41a2cdf9-8fd1-418d-abc9-1fe4f3fd8b5e@xen.org>
 <232644f5-b0ad-414f-a4b5-03724f5ac053@netscape.net>
 <f40ce805-b6b7-46c5-87b2-3fe8c331072d@xen.org>
 <62c98f14-1559-16c9-f070-e3e6112a6dd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62c98f14-1559-16c9-f070-e3e6112a6dd4@suse.com>
X-ClientProxiedBy: PR0P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 75acf3f4-3d86-4001-ca13-08dbb92af9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S+vJQgJ7/T99P0+9DYOp6y/K4YD76VsrSxsDMjrwr9DVLKRDA9wztjNikddMzrU03SRdRttN76j+ffFmAZ7XWPvCs56MRo4r5swcPkpR3MmLGtYBxqISbRikVlAUkNaLyalCc4niZ5QtHpWb0GncxhqVSL2lYgUez16fkpLMdwwgfl7NRwTTYNhT/8B8z2sEkjNGoTo/fpfh+GG26KVe9E6BjHca34pxWkP4hpHECsarvDUkIIg4Ypl8LubSTKpwvbUc+PQCYxQiGCFRExeqxGfV3WzDo0di/xAmqTWe3lF/W8l6pqCEYOJ54JyGSa27QBWPW9YXXd50m7BGA92EEwUTZqIu47DX+Vu/m4oP08P31q18C6M8+fZLfkLDpzPScDcsqvIEZ7hjniQw1Gr5ae8II8c0tT3XdTQg59C6rNFmeDaSKw9cSBvlyav22pCpeOdq++jDrK4nvUi7tXa2isdG6Kf5G3UPzT3xaJ71f5jgrSguF99QDgAVn/9HNIcyIxLU0lP+Kvqsry0Ot0uOf56f+GRl2t6aoxdMjitfrIZYkZ1J/5H2AU4zOEHJXa/18q3exLCgI5KwSkQR1TIBJyHMeA/qBeQG5iAvQ/4LmZyblz6SeUgY2kGReFmPnTKm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(54906003)(41300700001)(66476007)(66946007)(6916009)(316002)(8936002)(8676002)(478600001)(9686003)(6486002)(6506007)(6512007)(53546011)(6666004)(966005)(4326008)(83380400001)(26005)(33716001)(86362001)(38100700002)(82960400001)(2906002)(5660300002)(85182001)(66556008)(160913001)(15963001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBpQW95WWpra0JWT1JvRlpPajdYeFlwK1RrTHRBb3lRVDI3bW9YRFpYV1lu?=
 =?utf-8?B?S2NNV0ZpNWhDMFFZRTF0L214M0k3SDQ3QkowY3FFOFpCTjVjVk1icG1aQ0t6?=
 =?utf-8?B?ek1LMkgzZkhpZWprRDk0Uy8xeFFoczhXOEwzbUgwMENCUEhrWkRVMmMyOWZ5?=
 =?utf-8?B?MmFQd1paYVVqdGF2SWtkeEJOSUdOcXRRT3liclBoOUFRaUliZzkzY1JTK0wv?=
 =?utf-8?B?R29GNjE4UE1DbG9ITDBTQzdaQ0hxZjBaSXBoTkw4S2RWYjViMXNTODNMczIx?=
 =?utf-8?B?QzZvKzVBcXdEc281QXNTaEFpYzBScFNaYTdrU3kvbXk0clcreHc5RlNXMmto?=
 =?utf-8?B?TzRzM0dLWFpkOGplLytmeVJMZUtYWlFZckkvZDZUbkdXd1R6ck1reFdjL051?=
 =?utf-8?B?NDNXVVREaHpjQVFQK1lPcHIxNThrWFE0VlluWkRldWNVb1JGSHI5UExyMEdV?=
 =?utf-8?B?SGY5SXhFeWRFV2dIQWhSaU5sek9PRVRVdmRrRWFmRlRoRUFOZE5rRUNXWEJu?=
 =?utf-8?B?RjJkNXgrUDhabmltd1R0clc2N2ljTVBWcUE4cFhDcGtTK1FWVy9mek5LQ3du?=
 =?utf-8?B?cVBDcVg5UDFVbnF0ZEZiVWNnQS9oR3I5WnpWK3BsSHJ0MFUrUDUzREtGVEVC?=
 =?utf-8?B?dWhGaVpacXo0K0p1UXdrUFU4aktVMjJ3RUVFUkJwWGNHVVNJZnVLYmkzQW5O?=
 =?utf-8?B?QkovYU1heEdCdXdvNXRnYVBKK2FTNFBLSnlKVG9BcHNxV1VXR3BLTTdPdzJW?=
 =?utf-8?B?dC9GRzM5OStub2x2b2NUTGNGOWZIa1dGL3N2VThRZTBwL2JiRFE2UUJJQjY3?=
 =?utf-8?B?SnFCOFVITGZYU2VleVNSVHYzOW5kTnJycFd4NlhGTnAwa1hJUVlCTkU1L2pm?=
 =?utf-8?B?bkRKT0p1ZXpCSzU5Vk9BTFlORjAyU3lvT0N3aUp5WHl3ek0rOUQ5Q3RpREph?=
 =?utf-8?B?Sm9SbzFsRERreXF1T0ZVVUoxNG5Oc1NBZlpsSE1NbVNFT0RRREM4TitjSTNl?=
 =?utf-8?B?cEk3a1NwVGlwNEN5aDQyYy9Hc2F6cG0zSEN3TXg0YVRoNFpvRm0velV6VW5Y?=
 =?utf-8?B?c3Vyck1CUWdlS3NXU2lrdWhSays3MFBQTW1uQ0c0WEVTcHFVNmFXUXN4VnhH?=
 =?utf-8?B?NTIzZEhtMTNLVTFkWTNrVituR2tWZFpZQUtMSEFkMHRLQzNUR0haR3kvSS9R?=
 =?utf-8?B?Wmdqc2tscjBJR25URDhYOXJ3U1hUNGVUOTV0eUMxcG5XNklpYVJWWk0zeVJM?=
 =?utf-8?B?cUtJMnZkbFVTVndjQUY5am84VmdjSEowbXRnOHFzbDB2RG5EbXBEYlYvdlR0?=
 =?utf-8?B?WG1DU09QR0gzLzc2TG1sWTc5OER2d0lqTjdodzZZM3FwZ2UxaWp3WXl6NUZF?=
 =?utf-8?B?S2h4OWRpbWdSL016SEFZUWt2VkZkV2c0czh1eW1GK3ljYjBIeTltaW5yUWlV?=
 =?utf-8?B?Z0RyNXBhMGt4RVZEcEYzejNIbmZEZHpNUU9aQ092TWx2ajRhZFpoUGJ4R0JV?=
 =?utf-8?B?WjJUZjBXRXUvV1VhT1gvMmlDU2VsM1lUZDczOFNyZnBrNnJYaDNueWxVWjBt?=
 =?utf-8?B?OGk3ODBsQVdReHZSaTRwUGYvckVlS3NkNHhTTkdvUzl4WUlWK1pYb2NseVZF?=
 =?utf-8?B?U3doQ1NUdXRVcjUyczUxcUpWVFZtOElmYkYzVGlyWk51VVhaWFk1V21DNzJX?=
 =?utf-8?B?QmZlSzlHOHZUL0xrRU56OXNtRlVYdkpVSnNTbnRMSXZlZG53ZmZCTUIxUHQr?=
 =?utf-8?B?WGgvRUFYWCtIVW9tUWZ1UXZKQndnMXhUbk5qMU5IODE1NzlhdWNJMmlkcmM4?=
 =?utf-8?B?WHArTUtwMHNId2w4Tkdvdyt4bmlQeGlxdEhicDhDNlVQcGsrVWE0bUVET3ZI?=
 =?utf-8?B?K2U1Q01HMXRDM2JCcGRQSUhFR082OFJyUEp5T1A3T1lXcEhrWG0xWEpsQlNQ?=
 =?utf-8?B?RGJsanJ5eVRHMk1XVXIvbDgyT3NmeDd4T1gzN0xCSkJad0pMYkg1ZkZFb2Ra?=
 =?utf-8?B?YksxUzZvVDRTQTNnOXV3NTJ1QjlHbjYxeU1mOTFaT3FPNjFTQmgwend6SHEy?=
 =?utf-8?B?TUlmbEFUYUoxM2VMZlZxZUJ6ZFNsYnhZY3hxdlVORDhsZEk4Q1BvVm8xK3lG?=
 =?utf-8?B?amJaNEpwQ3ZaUTEvZmhnQ212UWE0aFRJVmtFdG9qcFRsV04vOERPbjFDUlFQ?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xkltK+Aa5LXAKtL0pBRw5ZwTs1x8cKzqOGg76WJi9XXrBS8SYOK4FdGTw0DydWUkcFODtapJ63uo4O8UKScjC+C9Rxdc4XsIf0Tgdbi7XEc+OgB+9FjI2B7dJi4FigBkph67kifBPPuuZ9EZg6U49Wzr+jSYO8ytp/mvNEK4uIV7oCDxXP5WPtuWQZelfK3jUhPYv4erLkaHyiuHLMBimWCYRfGWq/CJpEc1/VGq16dB3eeCE0KLNF0zig2pE91xzYcU7R/pLTWwlpK9cv5y/aaG6B8zvPYO1FixRX70Xq4JmHIbTn4oHkDuCwPqXkh7XY/PZVAYJ8i9+VgK3MCBCEEFgl5K7EVwyP/tjiY1vPZG+UMM1NWXvFdooos7SFcxbrTjIbSG8SmcE1NYJ8X6NgACjOlHc/Lin8Eio3sUKUxwsB8B72YqlUEGYfOAirmk5tp/PcezMlemvvd4H8GwsF14VmmSp1zciIsV7qkPU/gidbDzNdtqRvxrdYInu8YLd4fCZyEafXzSQxix891lKvCcR8iBbC4of5MS9SKsHI93kod32kTyMf2ozXTITriDBdkZzxc0UP6UIizfnG/+Z9A0L5GXYFmA4ACegKcQWBp/f2TI1dBjwe6tXVSPutRadKyDLZw1KByPk+4mLpfUQeID9QiNg6GK3S4OOvYnJOw+PJSfJLXBBrKp8asjBoPuPLdXF0lyhkhILmQ4jtPVD0YE9WDFmTHHtz7+P2018oLZ0C4FfcjTP+T5m0Z0FAp4F+WAlDRwnGfmX9xd91NuouLMIeHY8MEpambYKF7pl5lvOqYRfVGY3ppmJD/9dQj22GoyCdSq58ZbJD6R6rekbJMTE7Sgf4e13wtmEzLsPqI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75acf3f4-3d86-4001-ca13-08dbb92af9ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 16:10:43.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5g1gB+V7iqpUp5l8yDbT2AbBRw9GoDPFVNkhdUcNMCZ/bNWyhvBkErkiYQ0E5xZUHqAUzcViu3SiZ/pZiPOOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7036

On Tue, Sep 19, 2023 at 06:00:32PM +0200, Jan Beulich wrote:
> On 19.09.2023 17:56, Julien Grall wrote:
> > On 19/09/2023 16:09, Chuck Zmudzinski wrote:
> >> On 9/19/2023 8:10 AM, Julien Grall wrote:
> >>> On 19/09/2023 08:02, Roger Pau Monné wrote:
> >>>> On Mon, Sep 18, 2023 at 07:49:26PM +0100, Julien Grall wrote:
> >>>>> (+Roger and moving to xen-devel)
> >>>>> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
> >>>>>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
> >>>>>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
> >>>>>>>
> >>>>>>> [user@Malmalinux ~]$ sudo xl dmesg
> >>>>>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
> >>>>>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
> >>>>>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
> >>>>>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
> >>>>>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
> >>>>>>> ...
> >>>>>>>
> >>>>>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
> >>>>>>>
> >>>>>>> Can increasing the buffer fix this? How would one do that?
> >>>>>>>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>
> >>>>>> I see the setting is the command line option conring_size:
> >>>>>>
> >>>>>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
> >>>>>>
> >>>>>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
> >>>>>
> >>>>> Thanks for the report. This remind me the series [1] from Roger which tries
> >>>>> to increase the default size to 32K. @Roger, I am wondering if we should
> >>>>> revive it?
> >>>>
> >>>> I think the relevant patch (2/2) will still apply as-is, it's just a
> >>>> Kconfig one line change.  I'm however thinking it might be better to
> >>>> bump it even further, to 128K.  From a system point of view it's still
> >>>> a very small amount of memory.
> >>>
> >>> I don't have a strong opinion about 128K vs 32K.
> >>
> >> I am sure 32k will be big enough on my system, and based on Jan's comment
> >> about release builds being less verbose, the current default of 16k may
> >> still work on my system once the release is out. 
> > 
> > I think it is quite (actually more) important to capture all the logs 
> > even in non-release build. So it would makes sense to increase the 
> > buffer to 32KB.
> > 
> > An alternative option would be to have a different limit for debug and 
> > production build. Not sure what the others thinks.
> 
> I would certainly like a two-way default better than the uniform bumping
> to 128k.

It's not just the output from Xen that goes into such buffer, but also
the output from dom0.  Hence making the decision based on Xen release
vs debug builds doesn't seem reliable to me.

Again 128K is a trivial amount of memory on current systems, I'm quite
sure 32K is already not enough on some of the systems I test with, but
anyway.  Feel free to pick and adjust the patch to 32K if that's the
only option, in any case it's better than the current default of 16K.

Thanks, Roger.

