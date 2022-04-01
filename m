Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A307D4EF099
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297444.506721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIPX-00065U-B0; Fri, 01 Apr 2022 14:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297444.506721; Fri, 01 Apr 2022 14:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIPX-00062h-6j; Fri, 01 Apr 2022 14:37:59 +0000
Received: by outflank-mailman (input) for mailman id 297444;
 Fri, 01 Apr 2022 14:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dc+m=UL=citrix.com=prvs=083d63866=roger.pau@srs-se1.protection.inumbo.net>)
 id 1naIPV-00060A-6P
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:37:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5061d88b-b1c9-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 16:37:55 +0200 (CEST)
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
X-Inumbo-ID: 5061d88b-b1c9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648823875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gOh+MbI5/vyzNf9U+I3QlasMd5sBpWWXSGlu8Dw3/pI=;
  b=NUvYvASnsug4bdXo2/oQbPdmjgRtXXKpeC8puzsXKT5JxWnhoAcE6RKi
   GlCb82M9S9nMMoyZ4IAZPcZ9k9t/ISkS4ixX14OSMYTgxJ3kBXHJXy2lK
   4sK4pGxW4+9wsd+GXXjc7/SAP53nLho3OHX8RpnIqnINsWBJcEAoiibb7
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67673382
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GMiM8qxFqMnmyzK23KR6t+cIxirEfRIJ4+MujC+fZmUNrF6WrkUAm
 2RNUDrSPa6LZmHweIwna9+38EoF7JPQzINjHQc9/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplvJ/tTiMVPYvwvssYVxN5EC9aB+pGweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J8QQq2FN
 5BxhTxHYzvcSEdGBVguCpMbnMOZi1/iSBZJgQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoQCbm5+/hCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHub7ITlah9ZGoixy3PSI0LmEmX2gEdF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hL0yT8FWy3yGsiTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CqCLM4AUOskgKVLvEMRSiai4hT+FfK8Ey/xXB
 HtmWZz0USZy5VpPklJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNxPoNzL6Sr
 iDgAie1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMProSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:Er8fYKp03IRFkL+FERwdgvUaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYWcegDUdAf0+4TMHf9LqQZfngiOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpOfHHclAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67673382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMgTfOOEbgSizV2T/0ybHtkedXa0//FktUTPSJRDwER5kxzzw4i/eqTD2VPDU3oglKmMGKZ5XrWMBiYPTW/CeviANQAxbk4JZVFF2pV/tfJIwOaPRPvi5pgP1OAB0NWtF85H5gxpEj60Kf36eDD+htIwx84E8vtB/46PZWIzLiXY2xJfjPhjg+9iAY5FCe4PvJ4NwuYJbspD5cj4OWbuqJvy+67jDhqzNZ+TPiBC5GpcVdqcpYfiBnmSx7gUpwEFZ4jm0ci4y4vUK7Oxnz4uroESbvTPH4wnk1ryKlHoYp0piazE/fE8VNb8PnEaZaqBJVepWpTDFsho3b3Rsuk7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WF9KvEYEzdfBix0SwaBl+hEi0VZ8z9aUzi13sJkjWA=;
 b=L8MBkNjSx7UiOtV3YJlr74jXJa/dC8RSEMdu8/jOYdM7a/MMcnl8R7b3II9DnI7RHA0hvMEOU513e+u5hJzQEtpCscSkKnE23bg7At94JisdC2zzq+RQLxxKz3gYPDwJNelnbrIU/yFQ15rYbPhLawMDhIjrN6w745gdGYQs8dhMWspEBkUEkfIfjbZ5iBd9OBbLJbu2og0L1BFrUoM9l3oQhjuNGXWp+glgOvrSyHvrRNh9BjLG+Gs61FImihbA3TxX/9jdGKJlOLsoBgiUNIDEQdjDB9mDdm38JnX4cxr3KxYifL99A+l6ngZ8tTId7Hzax4fA1KF+HYsx8r8T+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WF9KvEYEzdfBix0SwaBl+hEi0VZ8z9aUzi13sJkjWA=;
 b=mXiXkw5Yt5kRS6giOh+cEpU8uozIBNKu0/ZIaQiSaUZ+Pvlfh+wkxrT3yapsEFWgE8OR9X+78zQHT7X9/8urwAmqZZsFb1ltrFR3IYis1OFOjsXocdzu+fR6oVZ+FB0rVcsuoUBCdXqK/LRfUEe3IPU3AEMQMtrfy4aU4CmM3Yk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools/firmware: do not add a .note.gnu.property section
Date: Fri,  1 Apr 2022 16:37:19 +0200
Message-ID: <20220401143720.23160-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401143720.23160-1-roger.pau@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4879c129-b41f-4751-3986-08da13ed2f5f
X-MS-TrafficTypeDiagnostic: SN2PR03MB2398:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB2398FE72D5BAAE4CD9F6BAA18FE09@SN2PR03MB2398.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1P2d7j14NLWb4FNcf3AY92rRol3skARChpdxMy9nqtO23ede1eWIc8eJLeoevqdFR9HVDqcl8sBi2VVLIKMKRTvEd1FBxL9zGX2ROLAVAA+5CYmmK/yyxKqhaqy1+WYmZLONWEUVzj4kNpDVqCaS1E8JDd8/BOmkxxu47k2uMwh+bFv+igFg9XfhE0STmY9JfQebNrYl5WVgNXX6/df1oCuJT0qgzFgw2NghBB9Oq+ylSej1rtqWxBpX1lN2k2HnmVlLQaq1HV4WYjJ6jPN609vuhcCc7+PYQ+oF8nFLrxRYwIdetiBXPh6OWGLULOrdDopxQPgRvk9VDLEENNMAGnL/RJdhuXT1/y3SenJmjHp3QqLaJuR2KIcNLtW3esRbW0456DxcW6HpWZS2rnS9IQbxNt4ronPl2GjCbA1Kr1PsK7uh3J8hvIqAd4aa7gylKYdlTjKOOA7wnanLmwvEIT3OhipgAweVqQ4iKAEPo9ZuT3HOJGGrm2smWz1TQkFfrNrMCvKpjjHZb8eVNwbGoQxetdgqnhoI8GU8GoTG3zpUmnA7RDAXSCFe2xDDAaf9Qg5gUrg66f4+oEbQD3pVfMuYuS3ypWZR9lLRtm/qClcvHGpTppk4UJrDs1jpIsRQ6enIGNBixptmFjkrcOzK9kCO4Q2a8oP1FkT/N6yONl9nbZZxbUi8JQGHi3lXd8zYvLFRuIihoQmYAzgM1WR59w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6916009)(107886003)(54906003)(316002)(38100700002)(82960400001)(66946007)(2906002)(6506007)(5660300002)(508600001)(83380400001)(6486002)(66476007)(8936002)(2616005)(86362001)(66556008)(26005)(4326008)(6512007)(8676002)(6666004)(186003)(1076003)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9SKzZnd2JqSEdiSnBVbldPZnNHMXpjZUExcGtiYmJJV2c0UW5MZVBlSC92?=
 =?utf-8?B?cDN2N1lQSVhSOFdzSkFGcHdMTWRUQkFCQmxrcDFnMCtBazJtSXZtNzNuVW1Z?=
 =?utf-8?B?c2c4Nmo0M3hVZmtQZ2owaXBLUXZmaFFUOW4xNk1GQ2psOFo0L2E1ZFQ4OHJt?=
 =?utf-8?B?S3N5M0c0eEFyajR3Tlp3d1ZjWmlmWURMbWxIQW5BZVZnMmtORWViejlJQmY5?=
 =?utf-8?B?dTA4QzZrOXZLaFBaOG1DaGpqVnFzWmdiQ0Ixc0hxTkRuK3J6d1huQWc4Yll1?=
 =?utf-8?B?TTQvSldacGFHWUM5SG5IeWFkUUVLcy9pTmYwOU8vaVpaZVI4VmVJN0NwTDJW?=
 =?utf-8?B?cDFBSHZRN2U2RC91Qis4Q0c0MkdIaExHZTd0bEVTamR0ak5Rbm9na3AweWlq?=
 =?utf-8?B?MUhnQ3RpdzVIdUZtMjNZMHhjSExtR1VqL28vZU1teXA5eE9yZzYxZW14L1Bx?=
 =?utf-8?B?SlQ2VmlCemc5OEZYWTJrZWZ4OGVQbWZGTlo5OE5KRHkvcUtWQk1rVUNFaW5k?=
 =?utf-8?B?ZWpZY2ZvdHltKzN0eWw3SlNNc0NSc3ZCSXhFMkV0OXVGN0N6cmkrYVlHUDND?=
 =?utf-8?B?SWx6YkphZVlzNmVwNzc4d3pkT2ZMcG9lcHFaK2x6Ri9CTmRDTmZ3bXF5SDBq?=
 =?utf-8?B?alFlU040cG5maTdPOGR2TUtYd2g3SDVqb2RuZ2VRZnpzYjRHd1JpWXQrbTNm?=
 =?utf-8?B?MHZ1RkRqKzZxNjhzbGlqTW5LdnJDL0lxdVlqZDNVWFloWU9WSWJKcDVPVFhm?=
 =?utf-8?B?M21iaVE2TnJMaVdUL1JaOS84MThsRHF5MjFJNXRKamtzRmtXQ295SUc2cjF3?=
 =?utf-8?B?T0oydmdoOTRPN2twVUlNa2ZsZnBNTThoV2hkL1paUkFsQjBySGdibTdDbVln?=
 =?utf-8?B?cmpyRllUdms1SjZ0cEhIZGkyLzJ0U1Bua2VaYUQyaHU4SHpkRnpJT3pqcGV0?=
 =?utf-8?B?Z1ZRRVhRTUZPOG1HZW9PQkJyUTl4Zk1INGU2OGliTndMb1k2M1J2WDY0VE8x?=
 =?utf-8?B?U20zVlNqbGdoaDhVZ0tGUmp2Yk1wbm5SakNjQWg1MExmdFBENDJJa1Vnc0Zo?=
 =?utf-8?B?MUNTOVdsbUxtSUpicVpSY0JwaU1vcVVIMmErOGVrbjcwd1NJQi9IU25uRWlS?=
 =?utf-8?B?a0ZaaVNJSWRUNm9VT2VSMGRoRFhQK2RPd24waUg0Ym1jUkdjL0pmVmZHUFls?=
 =?utf-8?B?VGhiVlgwK2p4bHk4b3F2azVTUGM0bFNYK29qSkVaYzJjMVRuemhpVHEyVzUr?=
 =?utf-8?B?TlpiL3E2UlpHN25jcTFpRUF5UUwxV2N6RTFnTzAxL2NSSnQyZDJ4c3oyR3lY?=
 =?utf-8?B?dkdoY3YxZDc0OFkrTmJ3bkVxTUJUdUJxV3l2aUliRTI3dUtjV2dPeVpHdEsv?=
 =?utf-8?B?MGZGbXVsbGF6UDlMR0dHUUJIdkxjSlBmVWg4Wk5yclFjcm1kWHFpcjYvUGFS?=
 =?utf-8?B?YzdQYVl6akMzWGFzcnByMVlmYlNiSzBCc1RacXViZGR0b21KMDVLdnorSjJV?=
 =?utf-8?B?eElyaVhIbGd4SmthSk12YmFob3h0a0c4TmY1QmRoVkcwY1VSSmltdUc4NG94?=
 =?utf-8?B?bXlvUmI3SE1IMVc2dS80VU9obWc5RHlNSUpvZ0ppMDM3Mk9zdVZxeHVURDZG?=
 =?utf-8?B?UnhndWtIMXVPSy9Sb3p0QVFkVUZ1MWtpMjdkNHI1VWhYMHlXYkZYRmZGRFZJ?=
 =?utf-8?B?S2hhanlGWU9WcWZmV2FLOWJkMXdTOFlqSHp3K1ZUYVJGUzcvanNqMThpQkxR?=
 =?utf-8?B?TERJY1NmQWR0YmNZNzczcDZ2T3JvVVhVWjQ3U3UyOStudDlQTGdDTnI5MDN6?=
 =?utf-8?B?N3Z0b2VYTjVCUG5hV2hnZ0VJNzk1MXVpTHRnd3MvbC8ycVY3SGJyVmEyTk1N?=
 =?utf-8?B?Vi95K3BJR1RWMmJVTHYweUlpSHJCcVNuSHRoNFAzSEtGT2pJaU12QlVwbkM3?=
 =?utf-8?B?WWN4YzRCWDRjS0JycFNKeVdKVVZmdVc5Z1FQTTR2NllwWVg0bTBMYnpoaDFL?=
 =?utf-8?B?NmRmbGRwdFdBZjFSNkRvU0JPRGVhT1Q0UmIxSHpncEFrNnpCNmszQTljU0Qy?=
 =?utf-8?B?ZXlxSVYxVXZFY2FHdVF2NUJJdWU2YnVMK3Vkd0VlTW5IVGwyMkxnYko5Y3Iz?=
 =?utf-8?B?RXdyNW5OU0VxOUN6RnpQSlFyOHEvUnJ5NzhVak10S3ZjM2x1SUd0L1Uwdmx6?=
 =?utf-8?B?RlB4bHFXMWNRV3hzM2RFcERKSXM0QjVubUFGQ09OeEtLK2NHRTNFcndQaFhC?=
 =?utf-8?B?SGRlYnc3Ym9kUG1TY3VCQ2tSOHpyb3RZcVd5RFQ2cStzRW14dnFJSGNmWFZl?=
 =?utf-8?B?STN6amNveTdpOEVvMjA5cDI5U0NHN3o2c0pyS3krWFZjOVZuWDBaTmViSC9F?=
 =?utf-8?Q?7VPRUX9J6mz9dmRo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4879c129-b41f-4751-3986-08da13ed2f5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 14:37:45.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xs8EzV7g9bMEf+3u3v+XTywaSxqHcohSjgBFURAe0FySyIcHEU1p2R3VIj0kxM5AwIUYM5mypDqD//XbdRPn2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2398
X-OriginatorOrg: citrix.com

Prevent the assembler from creating a .note.gnu.property section on
the output objects, as it's not useful for firmware related binaries,
and breaks the resulting rombios image.

This requires modifying the cc-option Makefile macro so it can test
assembler options (by replacing the usage of the -S flag with -c) and
also stripping the -Wa, prefix if present when checking for the test
output.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 Config.mk               | 2 +-
 tools/firmware/Rules.mk | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f56f7dc334..82832945e5 100644
--- a/Config.mk
+++ b/Config.mk
@@ -91,7 +91,7 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)"
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
 cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
+              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
               then echo "$(2)"; else echo "$(3)"; fi ;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index efbbc73a45..1cbe666f5e 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -15,6 +15,10 @@ CFLAGS += -Werror
 
 EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
 
+# Do not add the .note.gnu.property section to any of the firmware objects: it
+# breaks the rombios binary and is not useful for firmware anyway.
+EMBEDDED_EXTRA_CFLAGS += -Wa$$(comma)-mx86-used-note=no
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 # Extra CFLAGS suitable for an embedded type of environment.
-- 
2.35.1


