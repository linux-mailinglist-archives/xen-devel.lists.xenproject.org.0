Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4185336F66
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:00:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96425.182400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKI6W-00008E-QO; Thu, 11 Mar 2021 09:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96425.182400; Thu, 11 Mar 2021 09:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKI6W-00007p-MM; Thu, 11 Mar 2021 09:59:40 +0000
Received: by outflank-mailman (input) for mailman id 96425;
 Thu, 11 Mar 2021 09:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKI6V-00007k-0L
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:59:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dada5450-2c69-4a33-ac0e-b618df77eb8c;
 Thu, 11 Mar 2021 09:59:35 +0000 (UTC)
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
X-Inumbo-ID: dada5450-2c69-4a33-ac0e-b618df77eb8c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615456775;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=wIRbsGN4ZKu1v3I5qQBKYn7QajOrmyqygcYS6gU9eLE=;
  b=E8OEuSemPEg6WO28Fo6aUNOBR1nkt+J545iFSRIT3GW5hU2bGywydGa0
   moT+5knCFXi+oKbTvMITw+zvD4Ehf4O0kdTOmB31wX4+w8ydi76QlL7Rc
   yAkbJZIMtEUJqCM+BeUzMyRx7ZCRU87i/+11tQzlertIX0fdXmMLfeIex
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iYhU9LbygTERJV8Lza/Fj30iXuuDA3j+3YKMTZviaC2SgTF5lJR0fkkXaHHVuMRXFow3ovv1Yo
 jFYXDWFgm5KWv7Q4zRsRi12rDo1IsS8fpF9Rz2gzsI3nY5EIh9M0MgqGAONkH87S3NrPjs3BDV
 J4spJ9C7qLsEL+b2h5az4eC9CpHYILdes5+JKykR75Ux1YQ4Gf5RB2lL60wPk1P+Ey+/zIMp1/
 gK1UaYt4H8o8Kted2ufGe9pH2lLGYboIueezumcTUFlbycfGU7FCQVMlg8FqHktbaImCtXPfAl
 MPs=
X-SBRS: 5.2
X-MesageID: 39402064
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0GdAOqjikEm8fLH/fefRlmT6h3BQX1Jw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIDVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5ejbSDQBAAMq7xTLsCOw5NfBYmOl9zo9cxcK+7ct9m
 DZjxf0j5/Mj9iXwgLRvlWjiah+t8DmzrJ4da6xo+w0DhmptQqyfoRmXNS5zU4IicWi8kwjnt
 WJgzpIBbUL11rrcmu4oQTg1mDbuV5EgR+Sqi7pvVLZrdHkXzV/MsJdhOtiA2TkwnA9t9Jx2r
 8j5RP/i7NrC3r77UHAzumNfRRrmk2omGElgO4egldOOLFuFIN5nMgx+lhYH4wHGz+/wIc7EP
 N2BMWZ3/pOd0iGBkqp81VH8ZiIczALBRGNTlIZtsH96UkjoFlJi28jgOAPlHYJ85wwD7FC+u
 T/K6xt0JVDVNUfY65RDPoIKPHHRlDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYysI
 6paiIYiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvQNzGZQlxGqbrvn9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVYEVsk4vcs6RkKursrHJpaCjJ2ZTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDjdMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHlnuqwyd0
 1uHaP/nsqA1CyL1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGnNmDZ2ZI3j+iKgVkR83bVC
 5Tzm4Htp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPCYZM3DpEvXYRrDgXVHxlJmQJnwV
 0zKDMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDbir0mGnNouQXEaRjaqdsaSjW8VNn5pr2
 w015VarKuLmD6pJ2d6pOgjKlVDZF6aB698AB2faJ9Zna3qfw9MXX6H7Abq+i0bSy7PzQE/l2
 bhJSqbdbXwDl1Rtmtx/4zq/Fl3H1/tN35YWzRfi8lQBG7GsnF83au3faK1yXKWcUZH6PoaKi
 v5bTwbJR5Oy9i72AWOoiuLEWwry/wVT6vgJYVmV4uW9mKmKYWOm61DIuRd+4x9Msvy9sAMSu
 CSdmauXUTFItJs/zbQgHkrOCN58iZ51dzp3QDo92i+0joUB+HILFFvWrEcJJW94gHfNoS1+a
 Q8qehwm+26dljVQJqh74r8ajZYMBPdoWKsVYgT2NlplJN3kIE2JoXRVDvD6WpO0xo/JvrljU
 92etUJ3JnxfqtUO/EIcy1X/lAVhM2CAUsivAvxGPI/dzgW/grmFuLMx7LJrLY1a3fx3DfYCB
 268ydH+e3CUDbG/bkGC7goKWA+Ujl21F1SuMeDfZbXEgOkaqVq+0e7KGa0dPt4RLKeEbsd6j
 Z87NfgpZ7cSwPInCTRtyB8OKRA7iKORt6zGhuFHapwyOOBUG789JeC0YqUlzf4STyydkQei8
 lkTCUrH7l+owhnqpY23Ci0QrHwuWQ/nTJlkHdaqmI=
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208,223";a="39402064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr9cqDOOXd7HA9suTlSu/RTZtEYf1DnQ6CMGtUjV3pow3J4Hq/mtEnSdPxkWiwDTnLN1wCYh15YhPXn/kHLBMwNz+cQ/nsv5TncEk9/CcLTgZuLfjtRTv9yjMZw3Rq7OWJrbbHWf+FJnVQCFGIPguYVLHmX/PxRkay/Myoa5FdmJTqJ7iK0NsW8PhjMs5R/UqZJdhpwV1MTCtB0PzgyLAo8TdBD9VOa6oyG91sZSSDOYXrFIQiwfTSDhR2XqXiBK6csDqnRxXbYuMF3GAz5rudK4o5WRaAUHw822oSifDoCSHFZwvtk5UHdV27IY09PjOKUPtPo8CJni6ShZcKH2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzhLKUTaPXnVkcI98OV/eAAQi3Y9/MTk1MqGWIaaYWk=;
 b=EBZmWAm9s/dW0nbYrWJAIAlH0fPSGlI6El39/u9m+VB0NvYW5vc+Mf4tXd3fFqS4xZ7FSM/Aa6+I6KpGj/8Ig4Dd70WrPDRSs+oxMifLCJESc2YpKB3Oh8Obg64JqrAOkWn2AJh28OH/s+FEjZqRYjbmovILoZ9v0pYSUQJs/j8p7TxrnDjw0wmy5b8vHpytGQ/90ROiY0L4wv34awxXspysx3UYIJQl5ohMszHT8nyj8xv9KEgXNsfarJaxUcx/nL/3a7nWO2/RHqogrK5bDstX9k6OK7Kgz3WRrA5vwt/1EKaDpAOdrWOOb+DIPafHr+i9MF3mqxnNX30/SnocBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzhLKUTaPXnVkcI98OV/eAAQi3Y9/MTk1MqGWIaaYWk=;
 b=Ir8odBgV9U3rbWZSIesfNtQNvZQEMR6wUKG41CC+hz+HrdzUXJW6l8HfKc7Pnqd+SIplq1XBnRJwTu1IDmok6mgWVyJ45Goo1db/GdcezTnrvGCMmpf9wk+ivtu0+/T0bpqqrInPgwUjT7T0d+vPt+whM7y2PkrRFqN65r/7evs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: [PATCH v5 for-4.15] x86/msr: introduce an option for compatible MSR behavior selection
Date: Thu, 11 Mar 2021 10:59:17 +0100
Message-ID: <20210311095918.40490-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0387.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304408a1-0985-4981-0723-08d8e4745c53
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5084468BEEB2694808F9145A8F909@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvJNDveCko+/AR62ksM54SVxNPnPjwLg1FeSO+kyDpcKL9sTd4CP3M6tdcqH/JORvWrIvo13CQ5KLz6GGLRH1DAo5ViDS9RYinecWxKz4ZiRJx3tFlEowK1GLxHXSVQrwGvwEk9EWKjHHHtUGF8PtRxnbJl9ULRMah3PW0iDh2nArYz8xC3vdd8Rf2P3chjHBzex89IdaDhNDm6uANKDppDjaTmHAO/h2sK/bFO9OcLqyfuQqzKzW84/ZSoG64+POWo9FUnaBSCJLzMU36c8DJPYdSw9eB2gUAZjRI6tCsReI7WVHFvNHBQYIPDPSpTA6Ce3pujc1ixSW5g61EV4n5sx6QZCKWnlXR3M5jOW9MDJD1JREUHaHYyRzwKBiRC0FPV/b3vMtJ+u0qmDKissueAzuRC0Lg0nbR3v4gAvqujw69xPVDJdlibgp9+JZAA2aHQH7fvl1a1EngtKUupaz7ss4gKNrDxyB6xpoeZw7AoeR0FvQJCY55ftAnxla25okAkBdyOsnmNj55vtiqsWjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(186003)(4326008)(2906002)(16526019)(478600001)(5660300002)(36756003)(7416002)(66946007)(8676002)(83380400001)(2616005)(1076003)(26005)(956004)(6916009)(316002)(6496006)(6666004)(66556008)(66476007)(8936002)(6486002)(86362001)(54906003)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R3dCM2ExZDFzSlg2VzNuQ253NGJIVm1TRVdqSmxXc2c5Z3BGbGUwMWx1emVu?=
 =?utf-8?B?MlIyZUdsTkpzUUxyOVNrWVQ3UFUwOWc2MzhXcnprWWJ2UHJoWkpRWXo2b1dH?=
 =?utf-8?B?VmVjYVRoMFNvRmNYSktlUWlSMnYwR0srMmo3NGxTUmJ6R1ZPdXE1Mk8xT1pt?=
 =?utf-8?B?LzVBdjYraEI0U2xwbGJsaHdGRWtwZlRCYURwQlEySGMxVEY4c3NaZ1Frdk90?=
 =?utf-8?B?NVM3dnNuMjVRMkJBY1pkTGdVblVmK2lRUDBKazZqSmNnMTFPd0ppU0dRKzZZ?=
 =?utf-8?B?Ynhaa250cElmSFlwWnBRTjlNYmw1SzVsaC9uMjREV3lic3VzbUh0OFJsTFRT?=
 =?utf-8?B?SlJ3N2p6K0VGWkpzYkwxemNJdERISXFyZWtQd01SU1ozWUdHclhmWjJZajBM?=
 =?utf-8?B?K0lmYlZaZWUvL2RQWVdmNmNnZk5LVERVQ3FrWmlabDRnN0tUcFc3MzlwWEJj?=
 =?utf-8?B?ZUhyWWp0MkNnL0JFOEtDNmplM3BlL0VKeUMwUi9yd0dJemU3dHFsdHhDeTFB?=
 =?utf-8?B?UG13dmsrNjhhVURybWJsdUtjZGxnazcxVit3Q1pxYWlWTTFNaGJaTm4zeUxO?=
 =?utf-8?B?QXBzQi92YkZIMU9IdFN5MWQ1OStHcWZmVGZaZVVyN2VCN3IwZE9Tblp3NkVG?=
 =?utf-8?B?dzhQNG5vSWFqOFN0bDlYbEc5ZUZ4SlFnbEwxN2RCYzJObksvcENOQ05YZjgz?=
 =?utf-8?B?SzUzc25nMW0xS3ZQNGZ3L3VkL1FtVXFJMmRsai9wQmF3aXErSnlmNGRVNlhM?=
 =?utf-8?B?eXZVTG9RbTlYVTBEV1pLM21oTjNIdVV0M0RiOU5hTGFqc3YzV1JBRHB5dWhF?=
 =?utf-8?B?QURCblJhMVRTMXJNMkoySWhSMlJpNFBOSHRrR0Exc1YxdGpHczBDS2xTbitR?=
 =?utf-8?B?OFNCbzF5elFZZ3UwK2dmSlNibnMvRFAxODhuTWZ6dTNQclFnTHlrWXBUUEtS?=
 =?utf-8?B?aUtWVG4vYXR4RUZsWUVQZjFrQUU0SzIwend3YkpNOGtHZHVLZWMyMHJEN2NK?=
 =?utf-8?B?MEREUWpzaU5pUW00THlMQXFESy9SeUxVTTRiSEFXUnhaZTh5WkhrQklXb2dS?=
 =?utf-8?B?RVNUZ3h6THpWMUJuazQ1YWlxKzYzdGczcmtnUklsZnExVGprWCt3dGM3a1dy?=
 =?utf-8?B?U2JDN0hqemNocUlwb01lZDhBTWxKNEZVdUFteTMxM2J1dzJHL0k0NVpqejRi?=
 =?utf-8?B?VmNHMERQenlZSW1RV3VSUEY5c0J4cktocTNZbG8wbEhXRzZrWDExQ1FDVWlp?=
 =?utf-8?B?ZWNrU0hwMlg3KzFNeEpkNFJremVvMmJwKzZ3dk5jYWdWdHVTQXpTb0Uvb3k4?=
 =?utf-8?B?YXFkMXN6R1liK2kxdXo3YW00K1Zwd1FDeHlPbjRNSWcxK2NnYjZ6NlBsRm1x?=
 =?utf-8?B?aXJ0NkV0OEQ0Slg3S0RnWTBpNzJDNlR0Rnh3K090aWxObFA3VDJnM0RnZit1?=
 =?utf-8?B?ZUNCUjJINVRRRGROZk5JZ2hBS21UZFpTTisxL09uSmZMSDFkd0d2TUlNditJ?=
 =?utf-8?B?bFpCd3Brb2xMcFp1L2ZXSXlQTGplVEVIZmRrSktKK3pNVzJEeVpBaGR4L2xj?=
 =?utf-8?B?b0k0aGZESm55MVYvaXVQOWNmajFsVXJHR3hCNS9OSzRXL1pnMHYvNWpkOXpC?=
 =?utf-8?B?TGlzTHFVeDN1Qk9QWmJFZ1YxcFd6T1IxQU85SlRWeWhsdFBEdGNsczZRSENZ?=
 =?utf-8?B?d0dVUFY0U005WHhKRWxremJOdE5XTHJvdjFCZmVLVHEzalR2Qm0rTWlUeG1P?=
 =?utf-8?Q?WGc45Z63fVK0woK0TIb3JDjExlrPWUdZEsXttzY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 304408a1-0985-4981-0723-08d8e4745c53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 09:59:29.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xm0inhNUZ/1OdGX/dGT+15BVUj/ZWoTlaIWQrqI/MPHBfev9uhXDjmhbX43pY0qNvkX+RdtZ4snB9XklMTVy/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

Introduce an option to allow selecting a behavior similar to the pre
Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
handled by Xen result in the injection of a #GP to the guest. This
is a behavior change since previously a #GP was only injected if
accessing the MSR on the real hardware would also trigger a #GP, or if
the attempted to be set bits wouldn't match the hardware values (for
PV). The reasons for not leaking hardware MSR values and injecting a
#GP are fully valid, so the solution proposed here should be
considered a temporary workaround until all the required MSRs are
properly handled.

This seems to be problematic for some guests, so introduce an option
to fallback to this kind of legacy behavior without leaking the
underlying MSR values to the guest.

When the option is set, for both PV and HVM don't inject a #GP to the
guest on MSR read if reading the underlying MSR doesn't result in a
#GP, do the same for writes and simply discard the value to be written
on that case.

Note that for guests restored or migrated from previous Xen versions
the option is enabled by default, in order to keep a compatible
MSR behavior. Such compatibility is done at the libxl layer, to avoid
higher-level toolstacks from having to know the details about this flag.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Boris, could you please test with Solaris to see if this fixes the
issue?

From a release PoV there are risks of taking this patch, as it touches
several different areas. So it could break MSR handling or domain
creation. I think however we would be able to spot such breakages in
osstest.

Not taking the patch would put us in an awkward position if people
migrating from < 4.15 find their guests no longer boot (or crash on
migration) on newer Xen versions, hence I think we need to accept the
risk.
---
Changes since v4:
 - Fix xl.cfg man page.

Changes since v3:
 - Slightly adjust commit message.
 - Change the description of the option.
 - s/domain_flags/misc_flags/.
 - Adjust setting of misc_flags in create_dom0.

Changes since v2:
 - Apply the option to both HVM and PV guest.
 - Handle both reads and writes.
 - Rename to msr_relaxed.
 - Introduce a Xen commnad line option to set it for dom0.
 - Set it unconditionally for guests being restored or migrated from
   previous Xen versions.
 - Provide the option to dom0.
 - Attempt at adding the ocaml helpers (build tested only).

Changes since v1:
 - Only apply the option to HVM guests.
 - Only apply the special handling to MSR reads.
 - Sanitize the newly introduced flags field.
 - Print a warning message when the option is used.
---
 docs/man/xl.cfg.5.pod.in            | 14 ++++++++++++++
 docs/misc/xen-command-line.pandoc   | 14 +++++++++++++-
 tools/include/libxl.h               |  7 +++++++
 tools/libs/light/libxl_arch.h       |  5 +++++
 tools/libs/light/libxl_arm.c        |  6 ++++++
 tools/libs/light/libxl_create.c     |  7 +++++++
 tools/libs/light/libxl_internal.c   |  3 +++
 tools/libs/light/libxl_types.idl    |  2 ++
 tools/libs/light/libxl_x86.c        | 20 ++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |  4 ++++
 tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs.c |  9 +++++++++
 tools/xl/xl_parse.c                 |  7 +++++++
 xen/arch/x86/dom0_build.c           |  3 +++
 xen/arch/x86/domain.c               |  9 +++++++++
 xen/arch/x86/hvm/svm/svm.c          | 10 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c          | 10 ++++++++++
 xen/arch/x86/pv/emul-priv-op.c      | 10 ++++++++++
 xen/arch/x86/setup.c                |  3 +++
 xen/include/asm-x86/domain.h        |  3 +++
 xen/include/asm-x86/setup.h         |  1 +
 xen/include/public/arch-x86/xen.h   |  8 ++++++++
 22 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..56370a37db 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,20 @@ No MCA capabilities in above list are enabled.
 
 =back
 
+=item B<msr_relaxed=BOOLEAN>
+
+The "msr_relaxed" boolean is an interim option, and defaults to false.
+
+In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
+to avoid leaking host data into guests, and to avoid breaking guest
+logic which uses #GP probing to identify the availability of MSRs.
+
+However, this new stricter behaviour has the possibility to break
+guests, and a more 4.14-like behaviour can be selected by setting this
+option.
+
+If using this option is necessary to fix an issue, please report a bug.
+
 =back
 
 =head1 SEE ALSO
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4737c92bfe..a0601ff838 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
 
     Applicability: x86
 
@@ -789,6 +789,18 @@ Controls for how dom0 is constructed on x86 systems.
     restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` fixes
     an issue in dom0, please report a bug.
 
+*   The `msr-relaxed` boolean is an interim option, and defaults to false.
+
+    In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
+    to avoid leaking host data into guests, and to avoid breaking guest
+    logic which uses \#GP probing to identify the availability of MSRs.
+
+    However, this new stricter behaviour has the possibility to break
+    guests, and a more 4.14-like behaviour can be selected by specifying
+    `dom0=msr-relaxed`.
+
+    If using this option is necessary to fix an issue, please report a bug.
+
 ### dom0-iommu
     = List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
                 map-reserved=<bool>, none ]
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a7b673e89d..ae7fe27c1f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -495,6 +495,13 @@
  */
 #define LIBXL_HAVE_VMTRACE_BUF_KB 1
 
+/*
+ * LIBXL_HAVE_X86_MSR_RELAXED indicates the toolstack has support for switching
+ * the MSR access handling in the hypervisor to relaxed mode. This is done by
+ * setting the libxl_domain_build_info arch_x86.msr_relaxed field.
+ */
+#define LIBXL_HAVE_X86_MSR_RELAXED 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index c305d704b1..8527fc5c6c 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -85,6 +85,11 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              const libxl_domain_build_info *info,
                              uint64_t *out);
 
+_hidden
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src);
+
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 5e2a209a8b..e2901f13b7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1222,6 +1222,12 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 46f68da697..1131b2a733 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2287,6 +2287,13 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
         unset_disk_colo_restore(d_config);
     }
 
+    /*
+     * When restoring (either from a save file or for a migration domain) set
+     * the MSR relaxed mode for compatibility with older Xen versions if the
+     * option is not set as part of the original configuration.
+     */
+    libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true);
+
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
                             params, ao_how, aop_console_how);
 }
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index d93a75533f..86556b6113 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -16,6 +16,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 void libxl__alloc_failed(libxl_ctx *ctx, const char *func,
                          size_t nmemb, size_t size) {
@@ -594,6 +595,8 @@ void libxl__update_domain_configuration(libxl__gc *gc,
 
     /* video ram */
     dst->b_info.video_memkb = src->b_info.video_memkb;
+
+    libxl__arch_update_domain_config(gc, dst, src);
 }
 
 static void ev_slowlock_init_internal(libxl__ev_slowlock *lock,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5b85a7419f..f45adddab0 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                               ])),
+    ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                              ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 58187ed760..ac09897a63 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -19,6 +19,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
+    config->arch.misc_flags = 0;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
+        config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
+
     return 0;
 }
 
@@ -809,6 +813,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
                                               libxl_domain_build_info *b_info)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
+    libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
@@ -851,6 +856,21 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+    /*
+     * Force MSR relaxed to be set (either to true or false) so it's part of
+     * the domain configuration when saving or performing a live-migration.
+     *
+     * Doing so allows the recovery side to figure out whether the flag should
+     * be set to true in order to keep backwards compatibility with already
+     * started domains.
+     */
+    libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
+                    libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
+}
 
 /*
  * Local variables:
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a02e26b27f..a5588c643f 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -48,9 +48,13 @@ type x86_arch_emulation_flags =
 	| X86_EMU_USE_PIRQ
 	| X86_EMU_VPCI
 
+type x86_arch_misc_flags =
+	| X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig =
 {
 	emulation_flags: x86_arch_emulation_flags list;
+	misc_flags: x86_arch_misc_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d2a312e273..6e94940a8a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -42,8 +42,12 @@ type x86_arch_emulation_flags =
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
 
+type x86_arch_misc_flags =
+  | X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
+  misc_flags: x86_arch_misc_flags list;
 }
 
 type arch_domainconfig =
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 9a8dbe5579..d05d7bb30e 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -233,6 +233,15 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 #undef VAL_EMUL_FLAGS
 
+#define VAL_MISC_FLAGS          Field(arch_domconfig, 1)
+
+		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
+			/* ! x86_arch_misc_flags X86_ none */
+			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+			(VAL_MISC_FLAGS);
+
+#undef VAL_MISC_FLAGS
+
 #else
 		caml_failwith("Unhandled: x86");
 #endif
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1893cfc086..9fb0791429 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2741,6 +2741,13 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
 
+    if (!xlu_cfg_get_defbool(config, "msr_relaxed",
+                             &b_info->arch_x86.msr_relaxed, 0))
+            fprintf(stderr,
+                    "WARNING: msr_relaxed will be removed in future versions.\n"
+                    "If it fixes an issue you are having please report to "
+                    "xen-devel@lists.xenproject.org.\n");
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0ce29e91a3..74b443e509 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -256,6 +256,7 @@ bool __initdata opt_dom0_shadow;
 #endif
 bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
 bool __initdata opt_dom0_verbose = IS_ENABLED(CONFIG_VERBOSE_DEBUG);
+bool __initdata opt_dom0_msr_relaxed;
 
 static int __init parse_dom0_param(const char *s)
 {
@@ -282,6 +283,8 @@ static int __init parse_dom0_param(const char *s)
         else if ( IS_ENABLED(CONFIG_PV) &&
                   (val = parse_boolean("cpuid-faulting", s, ss)) >= 0 )
             opt_dom0_cpuid_faulting = val;
+        else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
+            opt_dom0_msr_relaxed = val;
         else
             rc = -EINVAL;
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e3c94d3fa..b212729880 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -683,6 +683,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    {
+        dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
+                config->arch.misc_flags);
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -852,6 +859,8 @@ int arch_domain_create(struct domain *d,
 
     domain_cpu_policy_changed(d);
 
+    d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a..4585efe1f8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
+    uint64_t tmp;
 
     switch ( msr )
     {
@@ -1965,6 +1966,12 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
@@ -2151,6 +2158,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bfea1b0f8a..b52824677e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3123,6 +3123,7 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
@@ -3204,6 +3205,12 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
@@ -3505,6 +3512,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
+        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e5a22b9347..74e71403ff 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
+    uint64_t tmp;
     int ret;
 
     if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
@@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
+        {
+            *val = 0;
+            return X86EMUL_OKAY;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
         break;
 
@@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
+            return X86EMUL_OKAY;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  reg, val);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 23bbb6e8c1..68454df8ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -749,6 +749,9 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .max_vcpus = dom0_max_vcpus(),
+        .arch = {
+            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
+        },
     };
     struct domain *d;
     char *cmdline;
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3900d7b48b..7213d184b0 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -437,6 +437,9 @@ struct arch_domain
     /* Mem_access emulation control */
     bool_t mem_access_emulate_each_rep;
 
+    /* Don't unconditionally inject #GP for unhandled MSRs. */
+    bool msr_relaxed;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 642a5e8460..24be46115d 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -65,6 +65,7 @@ extern bool opt_dom0_shadow;
 extern bool opt_dom0_pvh;
 extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
+extern bool opt_dom0_msr_relaxed;
 
 #define max_init_domid (0)
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 629cb2ba40..6bf1e8cccb 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+
+/*
+ * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
+ * handled by Xen instead of injecting a #GP to the guest. Note this option
+ * doesn't allow the guest to read or write to the underlying MSR.
+ */
+#define XEN_X86_MSR_RELAXED (1u << 0)
+    uint32_t misc_flags;
 };
 
 /* Location of online VCPU bitmap. */
-- 
2.30.1


