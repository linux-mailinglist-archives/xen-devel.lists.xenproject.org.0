Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B98541259
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 21:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343499.568843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyfAb-0004nB-2J; Tue, 07 Jun 2022 19:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343499.568843; Tue, 07 Jun 2022 19:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyfAa-0004kn-VR; Tue, 07 Jun 2022 19:47:16 +0000
Received: by outflank-mailman (input) for mailman id 343499;
 Tue, 07 Jun 2022 19:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXeP=WO=citrix.com=prvs=150b9cda6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nyfAZ-0004kh-6Y
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 19:47:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f101479-e69a-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 21:47:13 +0200 (CEST)
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 15:47:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4958.namprd03.prod.outlook.com (2603:10b6:208:1ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 19:47:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 19:47:02 +0000
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
X-Inumbo-ID: 9f101479-e69a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654631232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ccZ9Gby7PCU6na6QwRjpasAAHx9d+SrXzMkgZ3b6Xhg=;
  b=gaL3mokw35lPCoIsa+DuM9BFpwVlQlJkK54IR7dMiYsA7+GyUF23KZCb
   nhtY3ujG24oNz7vbOSiuOExQSfl6wXJhauduS5w+gce8P/+AtUVgOJNnb
   m7+Fj1qmU/DETTgbiS/Re6aYzlkv8LOM8t+2hnWl8rtdz6q1tVSuXS8Tl
   Y=;
X-IronPort-RemoteIP: 104.47.74.49
X-IronPort-MID: 72928762
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zMqNraLrEnedYsRzFE+RuZQlxSXFcZb7ZxGr2PjKsXjdYENS0zMCy
 WEXXDzUOqmDY2ujKNx1YN60pE0Gv5aGxoRkSlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3NY32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OtplrO9SRwQBbaWpb9GQT91Mg8uDIQTrdcrIVDn2SCS52vvViOwht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsyFH/SiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IC+QjF+vRti4TV5B5SyZfLHfGKQOGTGeoJj2qnj
 GXm42usV3n2M/Tak1Jp6EmEj+vCjWX9XIQUGruQ7uRtnFqVgGkeYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflhsVWt4VGetq7giIkvbQ+1zBWjlCSSNdYts7ssNwXSYty
 lKCg9LuA3poraGRTnWesLyTqFteJBQoEIPLXgdcJSNt3jUpiNhbYs7nJjq7LJOIsw==
IronPort-HdrOrdr: A9a23:7dExyqsItahImT/j+mKJylsE7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.91,284,1647316800"; 
   d="scan'208";a="72928762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH/OvUob82g+X1Pov5fBcpCUBhsU8rsqd4h//My2ZzVoI4DnGHb4qUD+h3f9Zfms6V6IGCWbrPqzU/z9fYEvyl7AWu+Sa/Hb1rE6pCnSZkVDWPI3XYxsgvI/XJJMg6AQk/TsWj+hGao/Q3ExwMMVFxjA+/j2Ya0jY9Hqu6nrVuiK6InAHjWeF6rB9pjIGX0wuLnFcwIlWr3/62Jelvm1+i4N7CSCn8jZsX61iAt4PF1YDXio+ssdWX/bQrG1bG3MH/v+pb1iciqbbIn1gcDtLI2irKSJ1gSEi9+09oohBr5bLIdlJ6P9pyQs6sazGFpEz6zuwIrAlm4NnyJQ6ATPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccZ9Gby7PCU6na6QwRjpasAAHx9d+SrXzMkgZ3b6Xhg=;
 b=HZg/bMtVkCsyfCJmgaL0bRat1xqWncdKhr8GGbGPeqrH22OnOBNE9XHUnY1RLmzdG/4WrbejZZ3Sc638Add8CSB9/mVMwmKJmGXqWs8kKDVTqVnVtLeORUegEKz21/IPzKC+VeyFZqSU1mZd1t2kLkXE/GK4xUTdsVm24P0c+9omn/bUudxOWdOKzCqbV8pcNnE1OWs+7VrMQiEucHqPUFUpeRhVq/csmyGNx0i+VExZMCHqWVTp38alMfIBvsB71noozNR48dVpStJ8WxxvqRYOHWnJL9aR8qPaomllc6FtwBhP9zYJRA3IVPHqiafJDKkdEeZDcG2jkFLWLZt74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccZ9Gby7PCU6na6QwRjpasAAHx9d+SrXzMkgZ3b6Xhg=;
 b=LWybnVooo2a+OqJYtJrtHx7DP3yoGoF85H/RTCLJveVfe/Cjh2N4kthEpkw7/LqXUZNmc0QTfftlzpEX+OUaGwqeHkRuH/mX8yi2cnjPkvaM3HIP8Mn9yMflaJznTRCfU7uUUJ0CDIyhmzpitmYmflzd9DHdYdp6mnZ9otKrZyI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Alex Nln <alex.nlnnfn@proton.me>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: memory overcomittment with sr-iov device assighment
Thread-Topic: memory overcomittment with sr-iov device assighment
Thread-Index: AQHYeihemc0HW39+c0mUd/wlJkeuKK1Dt4iAgACcCYCAAAbTgA==
Date: Tue, 7 Jun 2022 19:47:02 +0000
Message-ID: <f3fa2179-6b4f-74eb-03b9-b6755aa26278@citrix.com>
References:
 <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
 <eb7a2869-d9f8-7a9f-3884-60d1a61e36f4@citrix.com>
 <RLsJJNdXwhH2qzKW2TCaLRSv8JcF5heYpDGfzMxwwrkzQvi0cOZ2YyiwcI0K_UkgiH7fFFCNsFScpqH-oFA00BnyRIcdWKKbuCsal_9aFhE=@proton.me>
In-Reply-To:
 <RLsJJNdXwhH2qzKW2TCaLRSv8JcF5heYpDGfzMxwwrkzQvi0cOZ2YyiwcI0K_UkgiH7fFFCNsFScpqH-oFA00BnyRIcdWKKbuCsal_9aFhE=@proton.me>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7c51fe1-7923-4c7c-c854-08da48be7e25
x-ms-traffictypediagnostic: MN2PR03MB4958:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB49581F191488DF36E667DA5CBAA59@MN2PR03MB4958.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BWX3ZUJu7253POvXSCJN9Hss98FLE/aUovzkrTyazTPNF4/bj0Af/pXCkLVR26/6JbRM5gAHzrZOnvV4jdH+ieXRH8ALn11FuUrxn6XdXlb5KecAYo3feSXIoj5KdB90xmP8YxA5yEcc7WkKIm8iM8ZENt+oVJN+WPK7NKItbq+uWkj+5A8lUfRQtluCwEGsXg3uISlI50m3F1o3LNraPKOrVFS0OSUrK3l85Rm4RULMdAwsWf5SBq2CR5cn+OPVcoTvYsJ0WyTevfZcdwBCl4/WBAtS+UWLr1vTdX69xeFdYqyZ+W7KXlTyyfyKgFURzhCVu9uvSGVx3hOEKFDdl//pzLa1F3yt+m1o+ZcPZw7Amciy8E1FCmpZGxRIm4HN2x8dbGqoHO/Gf+msjQDLDBezCRX6ioJK0mQvyUCnjpc2WqVUnGfNwr77BOfAC2i430zgMlBpRPCOj0JIC2zaS+/Ne9D+WFTX6GXVNZf483DqcHQhWiKWBQ7uSXMCxn7T4UnIAe5TW99K0DxrIGrGphOSbEWIOoxbUWVFABkopI4YQBa2x7wRabFRn8i8vvKi0E9FgBYqrmgbSiyYEr+ATBCZPdKYQY5nvZMMl6E77bhvfdVME9HoyKuiNtO5PQ9U89cFg9D9NL2EFCj3LxY06tFukbexIlzhlRN4jMSLmPbGwXTh3oZvCo4iDmZw0w6vghGPg6exUW8GnCyXexGBFoFtEfvODuWOlXgJPCUC7UjKrT0M82tqDSMGxKckNd4pbC7ZzrSC6Ug8HX7omDSuLojMZdafIn1X7dx+6VdQJgqD/NqDiRr9Y5laohq/O26fcKKGKHU6HrOknElMGSDaxLbZOvsrxRtsxOKA7z+0WQg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(31696002)(53546011)(966005)(6486002)(76116006)(31686004)(8936002)(66556008)(186003)(508600001)(5660300002)(8676002)(66946007)(66476007)(4326008)(2616005)(66446008)(64756008)(91956017)(6506007)(26005)(82960400001)(2906002)(38100700002)(6916009)(122000001)(36756003)(316002)(6512007)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVlFMGlvcHFvdEptTjVZZ1h2YWFBY3ZZOVpaYWcvTWV5NDJVRjdqT3NCQmpE?=
 =?utf-8?B?RTdLOFlWR3FYcGZsNmdJVDVYeERlR1JUTkNuL1M5ZnJnb2JLWksxMEs1VnRr?=
 =?utf-8?B?S2JGRERmMlZMcmh0L3ZlQ29ldWNsYy9FbHRzTGRRSVdWakUwdUVKWklvdTRE?=
 =?utf-8?B?ZlFSNTliOVBSQ0V6NUtrQ3dhSnJJY3VxVzNkcWkwUDFQazRZVUhHcnN4VlIx?=
 =?utf-8?B?SWJoMHl3cGUxUFZzNVI2SGdhcURuSUJTYWlkaTlOeW5qV1NYQlE3NTJ2VEU3?=
 =?utf-8?B?cHlkNk9VNzJXdTNHa1U3U1hiRlpNdDlGem14VDFZUjJ0OXFMMkpQM3N0WFhH?=
 =?utf-8?B?NEdUMU4zaE1yNTNpQ2N5QWJ1RWw5VW0wQ1JGZGhVWUJWeFl5N2JydHM2U0Jn?=
 =?utf-8?B?VGdXS3RnVHNXemxYWXlBV3VBeDdXakZwTWJTUHZVT2IxQ1IxWlpnUXp4ZDRE?=
 =?utf-8?B?eXM0NFVaS09aNHFwWU1oaWRBdmdFUm8vMlVBWFVxV0NwclAzeEkzUDVlM3pK?=
 =?utf-8?B?Qm1mM0tCcUNJVnlFV0dubTJhdEUrLzc5OS85Q1hJa25JTFFBc2lDYmJBOUs5?=
 =?utf-8?B?OUprY2ovUURYVXpXci93bENmd09Zemt2bEVFUlJSU2NhRkVXakFTSFRYWGZr?=
 =?utf-8?B?MkJsNGlreHJlMU0wYi84aEJPWHVKZVdTRnord2lZTStCdjFQWjQvTnVmekoy?=
 =?utf-8?B?WFNBRUNOVElXSERoTkpicGZqdW5laG9zTXNQd0grOUdwZG1Mamt5WlN2NzlT?=
 =?utf-8?B?Tm81SDBOdldkYVVqbmRDOTFWNUljb21XOXh6ZkZUV1FlZVdkZmM5RzJ4Q3hi?=
 =?utf-8?B?QUFxdzd0cmJ5SEVHeE5oYk0zcjBFRExwSWNQNFA4cTdqbkVRcTFnK3dnM3do?=
 =?utf-8?B?a1FLb2pMY2dYaWNHNWF0Nk45UWRXSzVkOGZyN0IvQkVHWVVObURzWGZWVzlk?=
 =?utf-8?B?YmtJbGVPaGFTOUt3aGMvM3VtejhUdmRCaE5YWG45TlB0RjNGbVhJR01LZEs0?=
 =?utf-8?B?eFl4Z2luRW9Xcm9DYXF0SVVjVUY0Y2hTYzBOSjI3b05jNGdxNmZYTDVLTGg4?=
 =?utf-8?B?STgzdnk2b0xwSGtES2l0UGNrS0VJU2ErYi9YYjk2bU1JNFN0NVVmNHNMSTVk?=
 =?utf-8?B?cDVsK0Y1UXpMSEZmamRUS3hHeGdlSlQ0d2h4a1BTQzRYaHVyck5iTWFoWGtV?=
 =?utf-8?B?QWlEaExWTzJVK0ZjcVJQVS9TK2JtSW1yc21LTkowVkcrOVc2TjlmYlJJMVVx?=
 =?utf-8?B?d2xUNjQyUEJTMlBwRU5nd2xZYWZ6dXVQempnZ1c0alpGaVVzTm11YXF1Vng0?=
 =?utf-8?B?Z2tKQlQyZCtMMDBmZkNQZTFDWVlCdCtIc1BHaXhpb3ROUWx2aTYrOEowTlRa?=
 =?utf-8?B?SVdFWnhaQjJkUEYxVFVuNEg2d0RFdGVGeXdvTU5vbzRFLzN1UnZVN1BSVmNN?=
 =?utf-8?B?YjJkYVZQRDRzTXZjQ0EwN1B3M3FpNzhsR1lkN3JvZkVmRXVmcXFtZ25iNlpB?=
 =?utf-8?B?Nk5vRXgwbGR3UU01VEUwcXZlbFZmSDh2M1E3NlQ3VXNTTFdoaWxXRkszeVhZ?=
 =?utf-8?B?cC9EVmVDSGJGcENMdEY1WmpOOEV6akV0WU9MMHd1NGtYOTZDOTFwUitHVzVY?=
 =?utf-8?B?SktRVTFMUFg0U3JHSzdKU1dqQkJkbmlFOXROdnZqL2grUEFBWlh0K2FGNGs2?=
 =?utf-8?B?N3BPb1EyTEo5SVc0Mi8xMGIrTlZZeHh5NGtrK0l4SFFCT09kZnhrQUhieUd3?=
 =?utf-8?B?RGZZVEI2K2FULzd1U1VKc2YvaFQ0blZsZVJhSU5Xb2Nvc0VyK0crYWpxTW9J?=
 =?utf-8?B?SDRjaFBhTFh1M2VUei80dWRVVGFNM1VFOXVWYmxoV0k5ZlRDMVRaNVRZR0hr?=
 =?utf-8?B?VUV5OFppYnMxcUdwL29weW9UaTlEbEo0YnF6Y3YxdWdnSTNTVXdRREkwVXZh?=
 =?utf-8?B?OW5DMEY2MW9FZ09WS0puVzg1ZjdGL0sxSTFrRitad1IyMWxwYkxCb0wvVnRY?=
 =?utf-8?B?eGtvSzdPTERtS1o4MytkWlB0SnUrbktFZExwL3ExRERiWDFKaTZzZlp4b1Vx?=
 =?utf-8?B?aEF2L3daOVNHTzVIa1B4alczTmtVMzR2SS92NTBLL1VPanArWHo5WS9JUEs1?=
 =?utf-8?B?YTIvQ0Nxek5mdXpwcktiTmtJZkh0TzBqajc5SmdGbXBpdWIyTlJIVUNibUJh?=
 =?utf-8?B?V2FwS1JyMjlDMmhwSW9hMkdMQ25obm5DbTBkeHRwLzVwSWtEcjI5NzA2eVJK?=
 =?utf-8?B?VEdYUGJWZ1MwVGJpQWRrQTV4dG1STm5HRWNzZjAwUGFQWWpDaUVNbXhqMlAz?=
 =?utf-8?B?SlhXVGNLRktUa0dpaGdiV3BKcVNlR2lzUTJONUZscGxMVTBvNXl2eEthVmpD?=
 =?utf-8?Q?+mzkWXll3ainTcPc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <457CF527D24E6B44A8FDA559C14AAD68@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c51fe1-7923-4c7c-c854-08da48be7e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 19:47:02.3115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUZZZn3NUQPmj7ER48lwc1WrqB8XoZ/sUV1f54XEBb7pEKq6XSPR8hzgKlbEJbbvk2XpcXAsSd5nW3v9QVfy84SyZYjkQaFZOIemsv1FDMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4958

T24gMDcvMDYvMjAyMiAyMDoyMiwgQWxleCBObG4gd3JvdGU6DQo+IC0tLS0tLS0gT3JpZ2luYWwg
TWVzc2FnZSAtLS0tLS0tDQo+IE9uIFR1ZXNkYXksIEp1bmUgN3RoLCAyMDIyIGF0IDM6MDQgQU0s
IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4gQnV0
IElPTU1VIHZpb2xhdGlvbnMgYXJlIG5vdCByZXN0YXJ0YWJsZS4gV2UgY2FuJ3QganVzdCB0YWtl
IGFuIElPTU1VDQo+PiBmYXVsdCwgYW5kIHNodWZmbGUgdGhlIGd1ZXN0cyBtZW1vcnksIGJlY2F1
c2UgdGhlIFBDSWUgcHJvdG9jb2wgaGFzDQo+PiB0aW1lb3V0cy4gVGhlc2UgYXJlbid0IGdlbmVy
YWxseSBsb25nIGVub3VnaCB0byBldmVuIHNlbmQgYW4gaW50ZXJydXB0DQo+PiB0byByZXF1ZXN0
IHNvZnR3YXJlIGhlbHAsIGxldCBhbG9uZSBwYWdlIG9uZSBwYXJ0IG91dCBhbmQgYW5vdGhlciBw
YXJ0IGluLg0KPj4NCj4+IEZvciBhbiBJT01NVSBtYXBwaW5nIHRvIGV4aXN0cywgaXQgbXVzdCBw
b2ludCBhdCByZWFsIFJBTSwgYmVjYXVzZSBhbnkNCj4+IERNQSB0YXJnZXR0aW5nIGl0IGNhbm5v
dCBiZSBwYXVzZWQgYW5kIGRlbGF5ZWQgZm9yIGxhdGVyLg0KPj4NCj4gVGhhbmtzIGZvciB0aGUg
aW5mb3JtYXRpb24hDQo+DQo+IFNwZWFraW5nIGFib3V0IElPTU1VLiBDYW4gWGVuIGVtdWxhdGUg
dmlydHVhbCBJT01NVT8gSnVzdCB0aGlua2luZyBvdXQgbG91ZC4NCj4gSWYgWGVuIGV4cG9zZXMg
YSB2aXJ0dWFsIElPTU1VIHRvIGEgZ3Vlc3QgVk0sIHdvdWxkbid0IGl0IGJlIHBvc3NpYmxlDQo+
IGZvciB0aGUgaHlwZXJ2aXNvciB0byBwaW4gVk0ncyBwYWdlcyB0aGF0IGFyZSBtYXBwZWQgKGR5
bmFtaWNhbGx5KQ0KPiBieSB0aGUgZ3Vlc3QgdmlydHVhbCBJT01NVT8gQnV0IEkgZ3Vlc3MgaXQg
d2lsbCBlbGltaW5hdGUgdGhlIHBlcmZvcm1hbmNlDQo+IGJlbmVmaXRzIG9mIGRpcmVjdCBkZXZp
Y2UgYXNzaWdubWVudC4NCg0KQXMgSmFuIHBvaW50ZWQgb3V0LCB0aGVyZSdzIG5vIHN1Y2ggdGhp
bmcgYXMgcGlubmluZyBsaWtlIHRoYXQuwqAgWGVuIGlzDQpub3QgS1ZNLsKgIFNlZQ0KaHR0cHM6
Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy9sYXRlc3QvYWRtaW4tZ3VpZGUvaW50cm9kdWN0aW9uLmh0
bWwNCg0KDQpCdXQgImNhbiB5b3Ugb25seSBkZWFsIHdpdGggdGhlIHN1YnNldCBtYXBwZWQgaW4g
YSB2aXJ0dWFsIElPTU1VIiBpcyBhDQpyZWFzb25hYmxlIHF1ZXN0aW9uLsKgIFRoZSBhbnN3ZXIg
aXMgbm8sIGZvciB0d28gcmVhc29ucy4NCg0KRmlyc3QsIHdoYXQgZG8geW91IGRvIGlmIHRoZSBn
dWVzdCBtYXBzIGl0J3Mgd2hvbGUgZ3Vlc3QgcGh5c2ljYWwNCmFkZHJlc3Mgc3BhY2UgaW4gdGhl
IHZpcnR1YWwgSU9NTVU/wqAgVGhlcmUncyBubyAic29ycnkgLSBub3QgZ290IGVub3VnaA0KbWVt
b3J5IHRvIGFycmFuZ2UgdGhhdCIgZXJyb3IgYXZhaWxhYmxlIGluIGVpdGhlciBJbnRlbCBvciBB
TUQncyBJT01NVQ0Kc3BlYywgYmVjYXVzZSB0aGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMgbWVtb3J5
IG92ZXJjb21taXQgaW4gYSByZWFsIHN5c3RlbS4NCg0KU2Vjb25kbHkgYW5kIG1vcmUgaW1wb3J0
YW50bHksIHRoZSBhdC1yZXNldCBiZWhhdmlvdXIgb2YgYW4gSU9NTVUgaXMgbm8NCnRyYW5zbGF0
aW9uLCB3aGljaCBmb3IgYSBndWVzdCBtZWFucyB0aGF0IERNQSBjYW4gZ28gYW55d2hlcmUgaW4g
dGhlDQpndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLCBtZWFuaW5nIHRoZSB3aG9sZSBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzDQpzcGFjZSBuZWVkcyBtYXBwaW5nIGludG8gdGhlIElPTU1VIHBh
Z2V0YWJsZXMsDQoNCn5BbmRyZXcNCg==

