Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CE4549F1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 16:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226890.392235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnMws-0005UK-9R; Wed, 17 Nov 2021 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226890.392235; Wed, 17 Nov 2021 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnMws-0005Rq-5d; Wed, 17 Nov 2021 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 226890;
 Wed, 17 Nov 2021 15:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnMwq-0005Rk-4C
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 15:34:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4a828f-47bb-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 16:34:06 +0100 (CET)
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
X-Inumbo-ID: cb4a828f-47bb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637163245;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Pj3ME5dQfFCEUCP9uNcK+m9EBdPrXETkCRvMIc/CChQ=;
  b=gFNaTmGEQZ3ijMwkTyAsQ9aTh7GAoFAUkr6w7HKJwqAG7Z6WlbqYb4qx
   KQZmQN0rvEI9mMItK8JcVqWItkquvYZjFz4Kt8u1XwqKOQF1rUUmyXMrI
   sraZdZdfLTc/KlWLam4rIK9gPOlJC4Nl6rz4iJEqKOTppx58oChK8j7od
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4JKZ5GC3ea4Rvfdd+9Wbt53YAzJne3nl7H9MoUFrhfFY48ZwHU7VJoQ7VeV8rQGPl+j8uyQ4O4
 0sPTlu0OIbEazg1oml6v87NSIUXcb6kJVQe34+5fdjlCSNUuA8Wgfds62oDnG97lSX/UDdkasc
 4PfU7Z70+jtkTtP/jCh0GUEge4OVsdT8abRw7EgB3Ij5OPD1EjL2rMXznq3ZQGBaUuMuQqPSa6
 4qqbHrgzceKYjldn1kEl8A1c9glPVgBWZwmC+FsD4I0ZoA9J5gDDoEfYcIrGrxlLN0vBqxHYBk
 CgJdGBzovTDwJRhf6jhKvDnu
X-SBRS: 5.1
X-MesageID: 58002625
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Qrh0uqK+DXg9bu/gFE+RNpIlxSXFcZb7ZxGr2PjKsXjdYENS1zEAy
 mtLXDiGP/+NMGr3f4xyOY238EtT7ZXRxoBgHVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6xLZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2nvc9e2
 MQT8qWhYkRxPPHLnu0sfD5XRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtYcAhmlq26iiG97eY
 sQIcWZWdyjKXCB1IUsRKpUn28aB0yyXnzpw9wvO+PtfD3Lo5A1u0pD9PdzNYNuISM5J2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0dfhPPP0rtka024GXuwTFAW4NfxFmZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 iBsdy+2tr5mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lex85bZpbJWW4P
 Sc/XD+9ArcJZxNGioctPeqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WcQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:m52WsKGDxNb9EqoApLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58002625"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lImEgYsx8mrSNqxVwXcDauW7mGp0yxrxSnodxUud1mzPfgtI056UYQv0n2VrEKnN+s/6g+sDuFGVBbgIWJfXYCS+0DE5sil1pt0ELknP6SFxgO81u5XDJ3f7fvnzTiMz+oSdirRd2G6vYzziPGCKnNL1MNh8uHHeiSHKvXV8lhu2gIHgdmkjz89lbFFwKjjmpADj93/YQ6kO2AuBnUInn+9JKhoFxvqHY+LjIVx/yutZIeeQoN1NvoQ891ADRzF4PReKqFqCuKZ55qVw5lq8nvYDDdMuUEp+99hvzLqXdDGEg41i4DoPQeP38JHokvyroBVPtUlh+KDOKANaDlCXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7yVKsAWCWZHBToll3wYcVdUhfwMwV/kcO/6YqeI6j4=;
 b=ImngCNqYCptTAPdyCpwqeNMzcGmzWD+y1g4u1m1yK8DxY1hOhxz5z4QS1bNhPmfRg2uZyN0it4ZvYjueH03mdmxN7gTSXR+5X+1TUiG0zE26EvoPuHKGefbxBfT9yYsPWzQ0rqKqzrcHmnIA0Lje5v2Xf1Xw4ISm0ISkicytmIyfGa/pJWohLwfkFC8LAKLHqC8ruqV0L8MjbtDvMtACOni1wSDgnJg+5d8WBGcLjv73oLTaGPgSNdgSxDiiZp96I6jaUtwOc8X4SORs4tpQGs1dmB1brW2GhE5gZfo7NjQ3fErKuk8E/VRV5JrywcmFAvHjijrRNJOnL9EYBq4bFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7yVKsAWCWZHBToll3wYcVdUhfwMwV/kcO/6YqeI6j4=;
 b=mfq08LfzST3JkcQQtYTHCC0aIXj7gTSW2m4yvBpHEUuhlk5fXeI9otCqdPjPOIbAopxC9k/XY4GhHizobfYZ83Nv8+LcoM2YAd7ecx8w499S8yAxEphnQJCqhesLfslwZ/gF2yzNJlvBugoruFaEJGTLD6ZWoy37bblXTHrcUv0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode
Date: Wed, 17 Nov 2021 16:33:50 +0100
Message-ID: <20211117153350.19823-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR2PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:101:16::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 100fa047-696a-452f-d182-08d9a9dfad1e
X-MS-TrafficTypeDiagnostic: DM4PR03MB6094:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6094EEAF94D417DEC710AF038F9A9@DM4PR03MB6094.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzDpMEEZnKeFS5HoxR6ZGiXhcFnLgpY7sq01Nl41Yole+umUyIdiicmP90T1A+5OljFRXXttMFbT4TVg1UmI1RPxXjavy+jY2bBuyHxGxCR1ZQHBeTpmiUMlMn0PIamXbm6IeJhtxSHVZeYPcmxNUJWMSlRe4sUcusNV6CeUMm+L7jpu8XGJI9qMR30QiWhWQgIecLZu0A6HSh7cVnDeaK6zlKGs9GXqBKR1jvSQ99IwS7+qzYRul5smWHtC7S0X0OiOJEcfTcUezxRlKn5e8+GW600qam+/1CzcLHrWq6PHNbz9HScnOGRjOLazLMm4weFgHfLU+SqSDfu4o4NGc7NRysTWhXYanEQ6hGyWoddqdfY/ATYqWwFffi6hNlrrudEElCDq0q5ql1aiv+dV4dNp3EOaavF0iVdtIRkQP8bXrnskqy6/uTz1BqqVT+hhyEoBmnnixOdLeRc5rYl/SOb5Ks6ayMSKDQd1aKjApB1Wgbui86R31qD0f6M+v5eh6nD4MjUZdqHaj5ON7Z8WsImpMrwt3TLtQOQUiZWX2Qzw8qRKN5byus1hi3BoxWj+qjeXoQw8fyn+QpxgyUo6deWUyCnTHrjpOaAhtr1ULAJv/6yYvBa1/CIX3zSgGB4ya18G9yVtQz6C6w3lyq/4kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(54906003)(86362001)(316002)(956004)(2906002)(36756003)(6486002)(508600001)(38100700002)(66946007)(66556008)(66476007)(4326008)(83380400001)(26005)(8676002)(6496006)(6916009)(8936002)(6666004)(82960400001)(1076003)(186003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVva3RKdVVaQzhpdFhtWXFxN0dERVN6VWc2ei90aEFOUUE3a1Z6RjJFMVRY?=
 =?utf-8?B?YmtoODZUR3FQbGtmbjl2ZTJvYVNzcUdMQWRUeWRUb3lmdVJrOGp2eTllRnZw?=
 =?utf-8?B?cVZiRmNmV3Y5VStVcGdnNUFiYmlRM21sQjFoUlpSZ1pqWEdHN3ZITEhuY3gr?=
 =?utf-8?B?M29CMkE0YVplRFhwblRFUGVDMFVvN2xOT21OR2RzUVdCcTFQYk1ha2F4VEho?=
 =?utf-8?B?SjZhYU16UUxQWjB5dEpCb3JDZ1lkdlRwYnhLTm01R1ZSR0x2eU1saWZWYUtz?=
 =?utf-8?B?QjZjeTRGZkllUEQ3M0lPMFNPdE1oNVpXMlpnTTQvTDVyWXhhWUFsbEZidFRY?=
 =?utf-8?B?a29lanR0NERLM012bFRLeXhhZDdrcERnazVOenZWTkRMZlBCRUJ4L2JXcy9m?=
 =?utf-8?B?RXpIeGxJZVNIYllwV2k4a09VazE2M2dacmFZRkVhb1JWb09ibmhYRE9EVEdz?=
 =?utf-8?B?clRMVExGVkZvOFQ0NEo2VDlWMTJmdlNabUR6SGYwenJFTGtuN3g1SGZNVDlv?=
 =?utf-8?B?TXM5Mis3b3JOTlE5WlBXakdIcTQ2T1RmRm1CeVdsODI4b3R3SDRsR0JXdXRT?=
 =?utf-8?B?NDZoVWhPZktMb3l5OWZTbjluMlZ4QXo2UHJXRFZJL3c3WjRUcjVFRkVGWWJu?=
 =?utf-8?B?Um0wdWpzb2V4RW5IR1I5b09oZmNBK01wRWp5U1RINVRZUFlUSjJwWThhYU5T?=
 =?utf-8?B?elFLaW1HQjI2MUpJeXZnOGYxV0ZLcndjdytoVS84N3pBQzdETkZHK01KNk05?=
 =?utf-8?B?OUF6MEkxR01ESHhvL1lra2lXQzNCWitpazdIOTArS0hGQlhnV2FyRmxpTFFK?=
 =?utf-8?B?aG01d3JQUUpxdlB6Rld0RkJlTy9NeVFGNUJPSUIzSUhZeFNxcGRlSU5xMEhJ?=
 =?utf-8?B?M1JwV3JSSU5HQjQ1Mzhib0hZRUExei9kYWdGdERYRk14d25DTm4xUGxQWjZX?=
 =?utf-8?B?cnh0SkpsS3ZSWmk3dUIrVUNQYVR6cDhmQTRVeGVxMHV0a2tVYVVDTU9Fc3VK?=
 =?utf-8?B?QU5EZElpZWpOVzBwU09EL1FBaHY5eEIyM040Yk0rL2g0aUdSbHVyS1N2YTNK?=
 =?utf-8?B?UkY5STRsOGVzRzJyRjE2Zms0NlU5VUFURjN1b1RvYUdLTVpLeitCbEhEVDFZ?=
 =?utf-8?B?UXB5aHRKVlEvdk9HNzBzbzdxWUpyYXY0RkJTZCtxVytZeXpVR3VicHk3TGh0?=
 =?utf-8?B?dTcyNmc5aENUeFMxLzMwejZMYjVRd21aS3FLc2tJYnNBUUxXR2pZV0RmMlhR?=
 =?utf-8?B?VXV0bGg1TldRQWpLTzNHWGZ4VjJIbGl2TU5JL0JMTTNydThVMXlPRU1BbFI3?=
 =?utf-8?B?aXpieXo3aUJOZHRiYnNLd3d0M2NRejdlSS9kV1ZNZkwwUmtJQ24vWFlkTkE5?=
 =?utf-8?B?NnBmQTZUTjA1WHBoNUV5QzhxcTQ3N0o4T1Izdlh1ZnlpT3NBV2tzV0RnVTFU?=
 =?utf-8?B?UlZWUlNlS3d6QTdrd0NnSGwwS3ZpNjFKVFJqSFcramY4YWtrb0RFZFZRQ09C?=
 =?utf-8?B?YzhJNnU3UkE2cFZDSDR5NGJyVGRJcFk4Ujk2YXh0cHVLVlZtS0t3MHd4eXM3?=
 =?utf-8?B?NkRsMEJKa1hRTXRLd1ZOelBzc0hyMjdHUlcyeG9Kd09JOVFNemZDbGNKdW9p?=
 =?utf-8?B?T1lmMUU3QUJNMDJQRmFENXU4S292SUdiQ29EUVB1N09Ibm1yUDNjNlpYNDV3?=
 =?utf-8?B?L1crSjNXYk00ZEpWV3NIT1RFM20rbDVBeEFld01FbGtEeDJVV0xBVDlWS3d1?=
 =?utf-8?B?TlBBcS9xRGd4V3QvY3E2VFd2WVVwVWIrM2x3NU1DYzErZDFrekdPRUlpb0E0?=
 =?utf-8?B?VGl2aDhKQXFtK0lhZ1VkdVlrRHlWMnVoQS9jQm56VUhuNVJWcHJrbW1IbUJx?=
 =?utf-8?B?c1ZIWlYrVnhJNmRJV0xRTkVOdklPKzduazhlWDdSb1NITU13YkxZVUlwYUJt?=
 =?utf-8?B?bzJOeGNzSDdrRkg3SzIxSHVqTU96dmtXdndtdXgrYzdsT0d0UFhFajZqdFMy?=
 =?utf-8?B?N1U3K1QycE5jSHA4NGp4b1pHUVczcDM4MTljdVRVUWs3b0NZNVVtTkxjYUFU?=
 =?utf-8?B?Uys1T1lTczVlUE05ZUxmNXg1TTZyMkZXUUgwZGE2Wm5ua1kxYlZDczE0SlY1?=
 =?utf-8?B?ZUVlMWhPUmV1QStwa0kxbjhyelRpaGdDUjVORzFkaDlvREZGTmJQajVkREor?=
 =?utf-8?Q?5Tn5g9jcUkSgecTWkjii+8g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 100fa047-696a-452f-d182-08d9a9dfad1e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 15:33:59.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YPSsTZl3GmjjwQqvpxlLPqZEQ+LyAz2Z38R7jlMlIFvuvXC1wtudd6pvoj1mvcMIhdAt+khvWJc4SV+ZfKsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-OriginatorOrg: citrix.com

Currently the max_store_size, remain_store_size and max_size in
compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
complain with:

In file included from compat.c:30:
./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_store_size,
            ^
./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.remain_store_size,
            ^
./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
            &op->u.query_variable_info.max_size);
            ^
Fix this by bouncing the variables on the stack in order for them to
be 8 byte aligned.

Note this could be done in a more selective manner to only apply to
compat code calls, but given the overhead of making an EFI call doing
an extra copy of 3 variables doesn't seem to warrant the special
casing.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Tagged for possible inclusion into the release, as it's a likely
candidate for backport. It shouldn't introduce any functional change
from a caller PoV. I think the risk is getting the patch wrong and not
passing the right parameters, or broken EFI implementations corrupting
data on our stack instead of doing it in xenpf_efi_runtime_call.
---
 xen/common/efi/runtime.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e..4462233798 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
     break;
 
     case XEN_EFI_query_variable_info:
+    {
+        uint64_t max_store_size, remain_store_size, max_size;
+
         if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
             return -EINVAL;
 
@@ -638,16 +641,29 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
             return -EOPNOTSUPP;
+
+        /*
+         * Bounce the variables onto the stack to make them 8 byte aligned when
+         * called from the compat handler, as their placement in
+         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
+         * clang will complain.
+         *
+         * Note we do this regardless of whether called from the compat handler
+         * or not, as it's not worth the extra logic to differentiate.
+         */
+        max_store_size = op->u.query_variable_info.max_store_size;
+        remain_store_size = op->u.query_variable_info.remain_store_size;
+        max_size = op->u.query_variable_info.max_size;
+
         state = efi_rs_enter();
         if ( !state.cr3 )
             return -EOPNOTSUPP;
         status = efi_rs->QueryVariableInfo(
-            op->u.query_variable_info.attr,
-            &op->u.query_variable_info.max_store_size,
-            &op->u.query_variable_info.remain_store_size,
-            &op->u.query_variable_info.max_size);
+            op->u.query_variable_info.attr, &max_store_size, &remain_store_size,
+            &max_size);
         efi_rs_leave(&state);
         break;
+    }
 
     case XEN_EFI_query_capsule_capabilities:
     case XEN_EFI_update_capsule:
-- 
2.33.0


