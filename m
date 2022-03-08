Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB804D1CAC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287146.486996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcIN-00029d-FZ; Tue, 08 Mar 2022 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287146.486996; Tue, 08 Mar 2022 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcIN-00027N-CE; Tue, 08 Mar 2022 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 287146;
 Tue, 08 Mar 2022 16:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcIM-00027F-LM
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:02:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1a1654-9ef9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:02:41 +0100 (CET)
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
X-Inumbo-ID: 2e1a1654-9ef9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646755361;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DnrGlj75LbkaqJdpvIgSXzhxfGYb9qfticxcaO6s+qA=;
  b=giES7aOzVSfJieZFb9+Ew0SF+7ljq/e+RJX/MXeu846FSKOOtOfO6PcI
   BzUGsViPw8EtLs5GBbksgDF3kcprPSC3j4FCxyap29kiB8Mbk2L7J07eU
   WquhEzZeKaMhbxe/v7AziMNp++u12KhAqUpv5rUNtMjRiQCYmQzvOX5Ei
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65718423
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z3UFQawko7y3pkUp2656t+fLxirEfRIJ4+MujC+fZmUNrF6WrkUPx
 jYXUDqDParbZ2uhfdt2YISzpEoDv8fTy9RkQQpppCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YjhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6aS5ey01ZLH3veUdXjhZHyJ6PKZq5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0RRKaCP
 ZFxhTxHPSb+fQEIFg8rV8gdmfuPhHrRIhtitwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKH73ati+nnjS79HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasoRo0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTwQf5ML4iJoulR+JRdFmeJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43ibuzuejISTUjUQ5wXaf2Op7Qd4b6K6MtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLINgIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RocWCnSSXFXelM2LWaJ29zq1+KTLuftjU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOCDLFudYawLeM7tRAEa4TOP9q
 Y032yyikUk3bQEDSnOPrd57wa4idxDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzWAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tJ53QUq4RG26cp1zwr/DV9eRfSfhivirXVwKNazkjZZ9wAQvP/97vZAz08ycSSCGwsKMDT
 3eIjGs3nbJrq9xeMfvr
IronPort-HdrOrdr: A9a23:G2thjaP/QGKsmsBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65718423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdaCB8X06GX3Zce0G+a6aRx1Qghhfk9JgmM76OxDmhkAohEo5J04OW1xtOc7yY3nyeJXCylDZxwDgTWNaIndsQ8LwIks0fI4NphEVXMvFYVFcPRu0IHIjnYuPQB5AYW9xn0hyJhIxFNCLaarjTqoa+C/KRGKHRvs1NzwkyspXGGJWgqMtDwkZknXt8Zp+QJEk26Ifqphtx3asXNMNHkZSh6dHBgCfXsbp5i3lKtgbpMBsJDWXYSbv2G5tGc9Ess35Q97nX1kMZNUz1rEZNRNuyzjBu1RUVH1OQ4eFbVLURxSDHA3qfWvWEObuc3qFDg8wvJE8OLTkUAZSJnD4eSJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP5MYYqJ19dAI1jFhfiLZssLcY4DL4Hh0KobK7hBq8g=;
 b=gFS/GVw1QQhc9YsxnuL06v6j3FbQHtHdMOjwMkWqFRPXwB32ua/onbGILdgXj9AtehW5qwmAMpktvCJ6EAQrArH1XxLetoIJDWQvPcQegzshG9z/KE7rftmncEb6IdokbYkMBmiguLt+Q1PTU3eSIkMZrQjlH9zvio3cJgNh8hlpc3nFbUPlWlPMUYiRzgFcS5nBk93a3Xi3axvme04NsQNnHeGKJrxkgewT4v2eZs6ZvOHHgHfTpvByhZy9dPcyoSiqXJaK0RvXuWN9sSx+yTYqHsSqEQTAtbbPmzMwp6xyxm5hIr1bBxSrCmskxuh34iEGOKuts3IWP5VJ39WDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP5MYYqJ19dAI1jFhfiLZssLcY4DL4Hh0KobK7hBq8g=;
 b=DPe+4URzM5p/HlKxbxLt8jokAjQJpVIMbSXFXyMY2ujm/mnHNU+Y4ww4VTlObh71gNuuOhVySCDy8n4ofquAlIX4hjCXbCwxPyrJcRKIiW7eolbRrORHDZkMO6A61suq9z0OvZkxEjqJOkbG32fvHNwC3AbelahD0qWLVM2dMp8=
Date: Tue, 8 Mar 2022 17:02:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yid+F5LdtMhs01tM@Air-de-Roger>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <c20a3e9f-770c-3d2a-a332-ce836a4192da@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c20a3e9f-770c-3d2a-a332-ce836a4192da@citrix.com>
X-ClientProxiedBy: LO2P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9acdb2-ac63-4007-d9c7-08da011d0ffa
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6503:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB650303303384CC04703B1D478F099@SJ0PR03MB6503.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jm0z3l5DM1sg3t1/iab163dEB3Xvp2mZ2y2+qt66clF5tU418bs7VV9d0nMttFyDmEgQjD7g+Ntva2ogJ8QsUVwGwK4zchL3lbqpaMD7sJ3AnQFy8xlXZSTjDjfV/0yoEO/1O89R8RXax7LYhvCAdU0xieC/HhokKYoo592jViObQNiUGSmiqiSbbl7h4Ypw/vU4dO+RN2acA7vuBeFC4OR9DN0Oc0EteXM+OW8kQASruffF5fh/0yc4pMyhWKCiQvlDYN6B0BmQd5Q5ZiH9lqTyzrx69Kc3Hv0gRZeLthk0Y8lFzSsjemhtoPRPKxGbu/88AB5R1QDG6EqxFRLSAPr4Y7CfJD7c783fshniqz8eUSkUmOwdN7Iev6mzRIbOtByIALi4HE20wdxDucve+1DIIFvvKp20FvCXMOAlsiCcC3Bmg+Mb4lRkDk47oWyW28B2mZZMbP9RfSMbrdTOukdtvpmafGNBsxNyooglCL9Zo1TQhQviNda27odAWyjn6opav/+LpfD021F9/ZtIb5D/negn+x40kZ45wJ7FJ2SbWpPzAb+niPnteSpSyGzLrwccZPZHlxLXdjKBc1yxqG/oM3E200t/6mS+AheARaD1J5HKMhAMecs1QDY499XxqITFEbr/LTyEQYTC0ckH28JZ2Ozp3NDkTuNRV8YrBYTGm+19a9cxER5ZQR5oqH+7KIAlIRkaXEJI37tMee/GzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(85182001)(6506007)(6486002)(38100700002)(508600001)(6666004)(2906002)(4326008)(33716001)(6862004)(66476007)(66556008)(9686003)(8676002)(6512007)(86362001)(82960400001)(54906003)(8936002)(26005)(83380400001)(316002)(186003)(66946007)(5660300002)(6636002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmh0b3phMTRjd2xwTDBsT0dOU0Qxb2RMQVF5Sjl0OElaNDU3VWlMRyt3eHd6?=
 =?utf-8?B?cUxjZjZFdU5pazRNZTFwN0Z0RGRWY0IvT0NrdkgweVRObnRnSE94NFBUZWlR?=
 =?utf-8?B?d3ArbzBhbVorbThLN0hyTTUzMkdBMVQwM3RDbUdueG5OdnRmOUgyMkR3MGVX?=
 =?utf-8?B?QjRGQlIvWTY3RFZka1B0OFlQMVppMVhpNzhoeGRvRlhPVU9MS1NiWS9ObXZP?=
 =?utf-8?B?ZDEyclJDMlNSZDNFOEpRMXFYcE55WmxWUTNGL2hOZHZRWXBDamhDVmI4RXZi?=
 =?utf-8?B?SGdLQkhKUVJtdHpNMjZKOFFKUUw2YWYrODV6cFEvZzBMZGFFRXU0R0JydFE2?=
 =?utf-8?B?L0o1d284WG1icmRNU3RRUmRiblJxR1dMblEwUGhiRkxRMEd5djYxV1VUazVU?=
 =?utf-8?B?dDRIWk5LVzZPTFJGUW1KNXpJcmN5U1FsbElBVjJ4N1NBS1AxNVViOHVGUjJ1?=
 =?utf-8?B?OEVoSFhtdDVPbzVHSElORmY3SWxZSE1uT0kyQzhjR3lmYks3U3llRVRRT0Vn?=
 =?utf-8?B?UlJZNlNvS3VmWnI1V045a1ZpYkkxUlMvRWJvWnp2L1F0cVpITjcweWNpV1RZ?=
 =?utf-8?B?ZEFHaTlRaDBvSThOaEEvL1E5bHRLd1BLa3pGczU3c1B1N3lVR0xjbjZWaGRa?=
 =?utf-8?B?L2FzNFFLZWNzRm1kcUNmUHpKNzA4aHZ4c1BXWk5WUi9BYnFmS25uTkIwRWZ3?=
 =?utf-8?B?QlFOR1hQam53ZW1vdk52cTQrUExUTGQ5Z2F0eHVwUTJ3THIyMXRxRDFYMVBH?=
 =?utf-8?B?SitQS1pEcXFTUXEyekQvLyt5R1JJZXhzUmN2WERuS21DR1FhcTQ4SmlsK2Y2?=
 =?utf-8?B?QVZtczBpVTFUWUdMTUxpN1JKczFNd2hOVDFJM1dOUVVvQURpV2hWUGxOb0Rz?=
 =?utf-8?B?S1J5aU9tTGRYSXBhQWQ3VVNvcGIzTjB3amxjQ1RVVFd0ZWVNOHBCOWNBOCtM?=
 =?utf-8?B?RkJ5VndsaEFwcUROSUlVUzlXMzdYQ2dRWGRDbmR1WENGek5YS0s4M1hlY3lT?=
 =?utf-8?B?RmVjUit2WnpQcEVEMmgzQXUrQXdlV0ppSStIMTVaYTJTY2R5ZVppTFlRNFBB?=
 =?utf-8?B?RW50Y3VPNVFqaUNEM0lWMENEMEZlQ1ZqTHlLTlRZTnB3R0R0STZpKzA3UCtv?=
 =?utf-8?B?Z21yYklCSjdaWmpCZi9VWVQwNU9kRy9DM2ZUVy9wT0M4amNOTENpR0N1VWh4?=
 =?utf-8?B?NzlZVW1aOGp5OEJ5cTNlcURicTdKNHZQaUFVS2xYWXlmT1M2eG5LQ2YzY2hi?=
 =?utf-8?B?TkZpcThjNmVRMFNIVmUxMjlsQVZqZDg3Z1BQZitvc2VZOUV3U2JPd0dYbDR2?=
 =?utf-8?B?Q1Jwd1IyL1VjRVYrMDdBckk2SHpuTnMzQi9uZEs5QkN6N2xzQjNQbmt3ZTNl?=
 =?utf-8?B?QS90SnEyM2dmODMwTXN5OWZuNnd4KzdYMGpsRjdOMnpETXRNdVB3Z3o0REND?=
 =?utf-8?B?aFoveHBIN3dXcng0TGVCbkw3UjlENk4veUJITVVadE1MTWJveXEwTEIxRGkr?=
 =?utf-8?B?T1pIWGlaYVZhTXpzK0lPdUFXZjFtQlc5WWVrR2FLSHBNSnNWVG1nMGI1WHBW?=
 =?utf-8?B?Zms1Q0NkYzA1K2dSRzJKQktZZ3BUVGtCaG5ndVZnVEFoejV3SUwvclhhN3RN?=
 =?utf-8?B?Sml2YWozaTFTeUl0S2liR08zQno4MnRKU2MzRVV0Ym9pcUN3aUd4LzloVDhW?=
 =?utf-8?B?RkpKRUxMMGZTTTRocit1WjZGazRVVjJ4UjJrQitsVlZjSnZac25jYUw5Mnlo?=
 =?utf-8?B?RG9Idk5WbVYwK1hhT1F1aGlHNG9JVGYxbmd1WHY3Vk15Q0hBZnFUZEY2dk9H?=
 =?utf-8?B?TVRjZzdQOS9wMnBnU214aUhJbHJtU0drSmdGOStIb1ZvN2FtZk84YnZDOHBY?=
 =?utf-8?B?dFpwajBweng1dGRydDFuYmhaYlc3RUNrbFhEdlR5RjlPcWZ4ampBSzJOZWNM?=
 =?utf-8?B?QUw1TWdmNWNEOHpndXJyc2dUSThQT3h3cFhFVEZGQlhyZVdqUjZONlNvSG5B?=
 =?utf-8?B?TFdVMzlrNWFNWWQwUkxKRUNlQWthdFdDT0pxOEJsNE1JVG9ZZFdIekx1K1Ns?=
 =?utf-8?B?MFB2L1JPbHdwT05TdmZuZG1rb1VuVTdHdEdPSWhwcGNKbjBJVHh4eWNSSTlj?=
 =?utf-8?B?bTVUcmRrREdEMllKd0NmSHExZFluWUFPWnVyN2FUMjFYcG9aeUZnMlg3NU1G?=
 =?utf-8?Q?CSM3taPZbw94t1bkEnreXUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9acdb2-ac63-4007-d9c7-08da011d0ffa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:02:36.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpXx+czTeBivrMXlivEWMgw7FzP9cyW+yLCz/hSm6X/vkrpvZwIQrsUhVPR1frjxED+3dgU2BwzZnY6nF4ul+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6503
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 03:44:18PM +0000, Jane Malalane wrote:
> On 08/03/2022 11:38, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
> >> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >> index 9119aa8536..5b7d662ed7 100644
> >> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >> @@ -220,6 +220,9 @@ void vmx_vmcs_reload(struct vcpu *v);
> >>   #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
> >>   extern u32 vmx_cpu_based_exec_control;
> >>   
> >> +#define has_assisted_xapic(d)   ((d)->arch.hvm.assisted_xapic)
> >> +#define has_assisted_x2apic(d)  ((d)->arch.hvm.assisted_x2apic)
> > 
> > Those macros should not be in an Intel specific header,
> > arch/x86/include/asm/hvm/domain.h is likely a better place.
> 
> Actually do you think hvm.h could be better?

I guess that's also fine, I did suggest hvm/domain.h because that's
where the fields get declared. I guess you prefer hvm.h because there
are other HVM related helpers in there?

Thanks, Roger.

