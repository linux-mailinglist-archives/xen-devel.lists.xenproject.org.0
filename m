Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC64E6650
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294454.500717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPkT-0001ok-JC; Thu, 24 Mar 2022 15:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294454.500717; Thu, 24 Mar 2022 15:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPkT-0001ml-FX; Thu, 24 Mar 2022 15:51:41 +0000
Received: by outflank-mailman (input) for mailman id 294454;
 Thu, 24 Mar 2022 15:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXPkS-0001mb-1e
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:51:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48d2740a-ab8a-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 16:51:37 +0100 (CET)
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
X-Inumbo-ID: 48d2740a-ab8a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648137097;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pi21aJRAb7wxZanzayYUu0HIVJppafDLjG6x+vxK/mo=;
  b=PW4E9RHTEMe39bCZZ0bE6kTXlSgal6TWkFSiL6fGsgURIXriHapZY2u2
   y7bZfwpxA6J8q/RXHiUdk02yrRFIbGYltd0V2j3UZ9b1cr7YUNvWi2crR
   CXznTSfP82cK+wCHuEc28gI4SQN+5MO78RoIA+3m/1yvcflaqjpgyfuqp
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66993656
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OA0Al61JLJ8kFDfzpvbD5TFxkn2cJEfYwER7XKvMYLTBsI5bpzwDm
 zEYCDyPOqmIZ2rxL49wao238BsFvJ+GzNMxSwo9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1kh56hcAMVMpbQkd42QTgBLyogMIBvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2JEfRqiDO
 aL1bxJBYS6bP0xmMW4tUsIRweT4rSGnWjRX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDb+2X0BDkKOdrZziCKmlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDU0f1ampfiyimalRslSb
 UcT/0IGsaE3/VeDUtr5Uhu3sXOA+BUbXrJ4D+Q/4RrLzqfS7BeUAkAFSCJMbJots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Y6
 gKIvRE6u7kokccx/LeapGzM3T+Bj82cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6zdWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfIvC25SI55zpUQFKTgDfqqLBjapSsItHDJrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75Dje9zmHhunj2LGMCTI/GbPVy2Pi79pVAtagbmUwzExPnc/FW9H
 yh3aaNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrXrH+aSI0l4U6W56ep4I+RNxv0J/s+Vr
 iDVchIJkzLX2CyYQThmn1g+MdsDq74k9illVcHtVH71s0UejXGHsPhOLcdmLON7nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSTkjM4VmMDLBUzMxc=
IronPort-HdrOrdr: A9a23:dOI65KgFU2ZxC4hA+jbtPV0jqnBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="66993656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBELQIayx50GolIqjR6tfSmvk5qLSvMZrvvceRirIEVb4GBtErPss0FXVAwHgXBOtQ3uJVHfNqT+Lzz1d4NgCI+YpnhSlK0MpvcLVqz3qdMNjQb+Zb4zru1T4wz82gCwuwdG16iqBqWcYIMrxOE9kHh7L/VD/3mB/JF+DBJb/bKH9ulRWagOk+RM3b8uHLH/TG7+exAGiF1BCOo0jWx7mgzVra4Z/KPvMzmt+rRDKh4TSj/am/VFzJIToy3Ix4KNAS2Iq3cBCIIAHgIm+3rQTkqB6T8Qf/S5SM55CF77AOcgSpxQE/dbTSQ9bQR60rbbYtMLvafKCpg0IU3YxIJbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3QB8PzOaTZX7b59ejLSk8DxnSxfLPNG/Ot33D3x6uE=;
 b=Kve7tZNj22aIC8B/Sn5sAn1o+y/YLvTpS/LSaOYkhb8T65VZ1JwPd6JAq2wpnoEe1vltZsIUpXSEKS89Icqut8LnGquqwybb9EDejEUBkwrSZWJGst8kqttYT4o4qqHLnT/Q6oG3RY3CfZU3YaaBouSfcxx0YLwb5BQwIRM+ZBUQ6R3Vwv8kmwgGJj296ZFk5RXwmje7noFHXcRAMEY7kuf1+y/0qfUx+cPG/h1PeutDZ1oDBHBLGvFFmINwKVdcIpEauUQDA5PUMbeTfR3k1D+UKtwpn/6JAzqSXGCahtK28MxYLS2dCZIA11NPLZAey7WTTu3UvUGTyWqG/XgVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3QB8PzOaTZX7b59ejLSk8DxnSxfLPNG/Ot33D3x6uE=;
 b=EDz5E4b4YgP2WnsE7euH6kpxxZOJV24l0eRClg5sSMz2WT1fGPrdciZZnOD0T7vwVdu/voJCEbtnJIUX63q8YAAmiMIzR77tW2vHrmb4Y9+BTQNY6V2oBp8NtzigR/hVCJatlTD/x6V2M3ByLmgwf8Rdytb0/EaT382inKGHgqY=
Date: Thu, 24 Mar 2022 16:51:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
Message-ID: <YjyTf4INCjKWD09n@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <YjyFODl7VFJLaj0c@Air-de-Roger>
 <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
X-ClientProxiedBy: LO2P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb80b4e5-edba-4217-4415-08da0dae2ab3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5775:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5775BC94B462F76A00E7BA7B8F199@SJ0PR03MB5775.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lNRfRWVeBvswXYP0WvKQEnQsXQMJB1cfkP43Jjkx2DkPFP5Ft4rW2cCOgXmdX331AAY1Cg/bkApy13+AaRJdOwE3/XtG6A0mbvMmNVWMlT1/vtG8oWo1u4mAgsC3dSOfBWmSGIwMyfVrlW/eHznkQKcvBzlOVqVEMddXV6STWEnDQLzFuDoVQ/hFym3vYJoKC64eGL2jOA7F/qWMo/GtO1OULxaMx5UIta0gsXZVhMdaG3oakqhTBX76H7wFygjTX4Ip+vK4cdIQNEJY6H212cl2eC7UXFDQJKHetiGEKNJX7drCADby1TXGnNakqgCZPevdKCDB0o55qiz+2ikphCFsy7eMvmYCV+l9gNRuZjHDRvyuE/mncQ8mjP99N8VojSn07Ej9xjDGiGYVPXtcdngsG4ff+TYp+6aSBUp2GxhMxuwbP9IbHTn4Kn0XCJDaAdDEhxaDDzUBT6OBMnLosRrS+0bz1OIw5VWdrzwrvvrrTbEB+GFvTPtdh2WmRmkKK2yS4CBJJ4QcU5ExubuBD/OMPR9uf2ATFM957ct0pHWaVjOa4tPOkPeb4Wmvad3N7PpZIhD2rlqi1aQfh7lteY3HOqKJA60c0KqTfk4NOlM61GJF93cXR/7qXrOkbqTZ9eaDW6T1B0sRt++ZqSBQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(186003)(26005)(85182001)(6512007)(9686003)(86362001)(54906003)(2906002)(6916009)(33716001)(316002)(53546011)(4326008)(508600001)(6506007)(5660300002)(8676002)(6486002)(6666004)(83380400001)(66476007)(66556008)(82960400001)(66946007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlNCV1BMcmZFRmdubFZQV2Fqd0JMc2ROWk9ISTF4d0lHTjN5Y0JacFlJUzh1?=
 =?utf-8?B?NVJFWUNZRmN3VnIwQTcrc0U0dzNmWnZubjYxbUttcXdlWlJ0THNyMVIxMmtM?=
 =?utf-8?B?aE1aNDU5b1YzeW8rMWRZd1RiRmVMcE8vWXp6MjJ1UjRKaCttc0c2WlM2L2c5?=
 =?utf-8?B?OG1EQkJ4dmM2dm9ZdkNpV3A3NHZUOE1WeFV4Z1R0amxSVTNKeDB2ZGRLdnBW?=
 =?utf-8?B?TWpxWEdvSTRkRDdOYTJUQkZ0TmlENWxzVmhBeG1YQXJlVUxjUENtbVpNY2pT?=
 =?utf-8?B?RlpkUkliSFhxNVdlVnlib0dqbEJqcUFpcVptcmNxOXhWNEFKS0dGYW9NMGsw?=
 =?utf-8?B?VU1nWWxiQkh1Mm5ncTJ2REp0UXZpVTJGZml1bEZnMmY4L1JLUXNuTmNDM1Mw?=
 =?utf-8?B?R2FPeUpKdEJDYmdhMWhqdlJ3MFl3YUwrV2ozRmptd1BUZVdGY0xiOHBZWEty?=
 =?utf-8?B?cjhGMHZRMmkvS280cEZ5aC9HVHNJWHVNSjhwT1Zqb0wwMWVRakY5azNhNFVC?=
 =?utf-8?B?d2MrKzhXaUxsMmFnV1JvN1ExT1pQUmJ2UHRXTERaUjZIUVdVeUduaUFZZ1BG?=
 =?utf-8?B?Y1pnM1lmR3h5Y3VweHYwQmRSL0hJZ3RuSWpuTVcwQTY4RUVNN2hmc0lrcmla?=
 =?utf-8?B?NkpYbzh2MVc1VTZ0dlVRMVFCQmhGMlByU29jOHNHVlFXcXVlZGcreHVJWjZj?=
 =?utf-8?B?d1pNMTNxeFMvTVZzSmFZdlJMNDJ3d2dFdmZOenZXa2tlRTZkcmxXUDIwVFlX?=
 =?utf-8?B?bHl0YTJCR1oxVndnd2FBeTVzaHdLTFZFaXVmUFc5Qk9iOU4wYzhDZzhhc09Q?=
 =?utf-8?B?eElFYkFYRytCTXJUSEg2c2g3WTI2RVc4N3plS2FnS0NjYzlKc1laMnZQay9Q?=
 =?utf-8?B?ZFpkUExlRnZySGlnakRpekhtNCtTN1pVelZ1KzlSMDFMenk5UnppSURRTE52?=
 =?utf-8?B?MHBGc0JIRlRKWlJiWjZzZW1LMmpWSUNtbC9WTmV1WEt4dERXRmNHU1h5S2ZS?=
 =?utf-8?B?N2ZmeWJiQ1d4WXQ4VHJQYjA5Wk9OOTAwMnNKdVA1dG5YcEZhNjhtSHY3NXht?=
 =?utf-8?B?djdSd0c0WThhcDlvVWVuKzlUTjM3YnlpZWhYZWN5MFRvTHQwWnpJUmJhUzha?=
 =?utf-8?B?aVFBc2NTSUlwZGdHMmJ1TDcyMjFLRVhUUUlTSU9pektHWTg1Z2NnT3JDRXBl?=
 =?utf-8?B?QkZmWGFPa2orbDE4dkdYd0x5UFd1N3k3WEVwM0xWL1hKYlJwajN6ck45MkRN?=
 =?utf-8?B?SjBSUkNtc3dYQk40M3R5ZEsxaXorbGNxYlR5RTFLZ1pJVlZkekRLZElRZzdn?=
 =?utf-8?B?S2g4aDlEQlc3bEpGeEkyMXJjREluS1JQS2dxV3ZJV1RSSnMxc1FBam9WSXVQ?=
 =?utf-8?B?cjVYTW9TOWh6ZDlNbW9IVmd1SDNoeHQwZFBUOFhCZTA3WG8xZlUyS1o3aGpP?=
 =?utf-8?B?V2RxQXFHTjZsdVd2emdWdCs1UzJWSjdWc1dtTXowRHVwVUViOUR2RHIrcGww?=
 =?utf-8?B?Smo2Umx0YzZmTkJpM3hnOWNnZmpNL2hjR0IrSkQ2WHR1b1luZ1B3YkwzMGxV?=
 =?utf-8?B?dXA5aXdyYVhFanY3bFkrUGNydGw0TnBPZ1UxK0V6Ry9vdmNUOTQ4NFZDb1ht?=
 =?utf-8?B?YTF3bGRtRGtrRUdoMXBOK2lHczI3NUhvZWZxaWJMUEI0aWdjdGVremg3czY3?=
 =?utf-8?B?a2YzS0NXdG0rNkp2aCtCRlN6OTdQcmtvNFE2djdZTjRZOGsyMFAzSlIvaVQ0?=
 =?utf-8?B?cWpHeVRudTJGS2EzUTFQbDExSWlYTUZvSy9Cenc1K1Bqb2NNRTBXQWhyMm9z?=
 =?utf-8?B?RU9KRHNvVG9YR1VuOGxZRjUza2VwZDBSVm5oQzJjd2M4bitEOUl0RFhOSzVW?=
 =?utf-8?B?NzVZajRWYk02cW5FWm9aQzh1eWdOck5oN1RvbVBCcURadzhkVlEvUmRWTnJ4?=
 =?utf-8?B?MW5YSGwzWHo5UnhRRFhqMTJYdkhsSUVYbjJaSFpQUDMrWG5HVWExczlIaG12?=
 =?utf-8?B?NlhnRmZRbnlyQnJQR0dDd2dqOXNlS29NanhIZXA4aUhtM3dobHU0ZWZtUXVZ?=
 =?utf-8?B?V2lYUGhub1ZGS0w5eWdVem5zdGFtY1R6bVg5YlRod09jbmw1MkdLcmhYZlpR?=
 =?utf-8?B?UTViRFdrTDAyTmNuOG53UWduSUpXaWFUeDhsbXZxT0FCQUlycmREUHVtZkpU?=
 =?utf-8?B?LzNNTDZhMjR0VnoyamZ2THlrMXVqUzA4NHFacGVOMlpvaFBFb2lNWTVpeHJK?=
 =?utf-8?B?TnJNVk9ZZEpudjdsa2N4QUpReXRjUzJQa0hVdndxOHF3enpmQ0ZwWUFKYll5?=
 =?utf-8?B?TmswTk03d2V0S0xHR3A1ZmJlenozU3JVNFg0ZTR2bzA0dGlGWDZ6L2FNOWlC?=
 =?utf-8?Q?swJslYdFWSg2GDQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb80b4e5-edba-4217-4415-08da0dae2ab3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:51:31.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW5rUlbyLZOQXqrIHfwlbqxXi8Z+f1vrpnB993PnfvQ5IXGFTVHjOtfW/aWGzbDY9K3b9wWD6q3s+om5lj6hgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5775
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 11:15:08AM -0400, Tamas K Lengyel wrote:
> On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > Add option to the fork memop to skip populating the fork with special pages.
> > > These special pages are only necessary when setting up forks to be fully
> > > functional with a toolstack. For short-lived forks where no toolstack is active
> > > these pages are uneccesary.
> >
> > I'm not sure those are strictly related to having a toolstack. For
> > example the vcpu_info has nothing to do with having a toolstack, and
> > is only used by the guest in order to receive events or fetch time
> > related data. So while a short-lived fork might not make use of those,
> > that has nothing to do with having a toolstack or not.
> 
> Fair enough, the point is that the short live fork doesn't use these pages.
> 
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > ---
> > >  xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
> > >  xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++----------
> > >  xen/include/public/memory.h           |  4 ++--
> > >  3 files changed, 26 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> > > index 698455444e..446cd06411 100644
> > > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > > @@ -31,7 +31,9 @@
> > >  #ifdef CONFIG_MEM_SHARING
> > >  struct mem_sharing_domain
> > >  {
> > > -    bool enabled, block_interrupts;
> > > +    bool enabled;
> > > +    bool block_interrupts;
> > > +    bool skip_special_pages;
> > >
> > >      /*
> > >       * When releasing shared gfn's in a preemptible manner, recall where
> > > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > > index 15e6a7ed81..84c04ddfa3 100644
> > > --- a/xen/arch/x86/mm/mem_sharing.c
> > > +++ b/xen/arch/x86/mm/mem_sharing.c
> > > @@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > >      return 0;
> > >  }
> > >
> > > -static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> > > +static int copy_vcpu_settings(struct domain *cd, const struct domain *d,
> > > +                              bool skip_special_pages)
> > >  {
> > >      unsigned int i;
> > >      struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> > > @@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> > >
> > >          /* Copy & map in the vcpu_info page if the guest uses one */
> > >          vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> > > -        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > > +        if ( !skip_special_pages && !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > >          {
> > >              mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> > >
> > > @@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
> > >      return 0;
> > >  }
> > >
> > > -static int copy_settings(struct domain *cd, struct domain *d)
> > > +static int copy_settings(struct domain *cd, struct domain *d,
> > > +                         bool skip_special_pages)
> > >  {
> > >      int rc;
> > >
> > > -    if ( (rc = copy_vcpu_settings(cd, d)) )
> > > +    if ( (rc = copy_vcpu_settings(cd, d, skip_special_pages)) )
> > >          return rc;
> > >
> > >      if ( (rc = hvm_copy_context_and_params(cd, d)) )
> > >          return rc;
> > >
> > > -    if ( (rc = copy_special_pages(cd, d)) )
> > > +    if ( !skip_special_pages && (rc = copy_special_pages(cd, d)) )
> > >          return rc;
> > >
> > >      copy_tsc(cd, d);
> > > @@ -1826,9 +1828,11 @@ static int copy_settings(struct domain *cd, struct domain *d)
> > >      return rc;
> > >  }
> > >
> > > -static int fork(struct domain *cd, struct domain *d)
> > > +static int fork(struct domain *cd, struct domain *d, uint16_t flags)
> > >  {
> > >      int rc = -EBUSY;
> > > +    bool block_interrupts = flags & XENMEM_FORK_BLOCK_INTERRUPTS;
> > > +    bool skip_special_pages = flags & XENMEM_FORK_SKIP_SPECIAL_PAGES;
> > >
> > >      if ( !cd->controller_pause_count )
> > >          return rc;
> > > @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
> > >      if ( (rc = bring_up_vcpus(cd, d)) )
> > >          goto done;
> > >
> > > -    rc = copy_settings(cd, d);
> > > +    if ( !(rc = copy_settings(cd, d, skip_special_pages)) )
> >
> > Can you set
> > cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages} earlier
> > so that you don't need to pass the options around to copy_settings and
> > copy_vcpu_settings?
> 
> Would be possible yes, but then we would have to clear them in case
> the forking failed at any point. Setting them only at the end when the
> fork finished ensures that those fields are only ever valid if the VM
> is a fork. Both are valid approaches and I prefer this over the other.

I think I'm confused, doesn't the fork get destroyed if there's a
failure? In which case the values
cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages}
shouldn't really matter?

> >
> > > +    {
> > > +        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
> > > +        cd->arch.hvm.mem_sharing.skip_special_pages = skip_special_pages;
> > > +        /* skip mapping the vAPIC page on unpause if skipping special pages */
> > > +        cd->creation_finished = skip_special_pages;
> >
> > I think this is dangerous. While it might be true at the moment that
> > the arch_domain_creation_finished only maps the vAPIC page, there's no
> > guarantee it couldn't do other stuff in the future that could be
> > required for the VM to be started.
> 
> I understand this domain_creation_finished route could be expanded in
> the future to include other stuff, but IMHO we can evaluate what to do
> about that when and if it becomes necessary. This is all experimental
> to begin with.

Maybe you could check the skip_special_pages field from
domain_creation_finished in order to decide whether the vAPIC page
needs to be mapped?

Thanks, Roger.

