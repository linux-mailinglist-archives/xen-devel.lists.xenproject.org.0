Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C944094B4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185730.334439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPn1H-0000VI-G2; Mon, 13 Sep 2021 14:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185730.334439; Mon, 13 Sep 2021 14:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPn1H-0000T0-Cp; Mon, 13 Sep 2021 14:33:15 +0000
Received: by outflank-mailman (input) for mailman id 185730;
 Mon, 13 Sep 2021 14:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZsy=OD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mPn1F-0000Su-IV
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:33:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 857bbae8-149f-11ec-b3b8-12813bfff9fa;
 Mon, 13 Sep 2021 14:33:12 +0000 (UTC)
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
X-Inumbo-ID: 857bbae8-149f-11ec-b3b8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631543591;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dbEFosl56BvADuL2whBTXBmQMxHWcrJp/eHiu/xDp/8=;
  b=fZ50Mapmvh5x4FRO5/3Z0twfE8jHJjgo1T9eRkjhmCFE9xzN8dWCG87D
   qMw2bHC8fDSLRPV/40VkrwO3/28Mp6GBJOpcJ0ryvQcFDNdWZDXXRedTa
   d2WaCOcb8R8ois1mdpZD8o3Rl1tNk/PToyus2ITc4XcYEuf+JU1I5A40K
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wV9EQ54t5JNj1L3zVWB1W4IH6mGj/xkjhDLcts7qCwcJZ+GSP2vBVgyrWnOUwnCJin6L3D/YIS
 6VNn0X04yi4tkUqQtG0bG7UtmTiWE4+jYHlx7cXbnrnVEanKYWyhr0cnUpXnOoF0Ac/ebjmFNq
 UW/2pRINmwSLDo1u2RMameRMh70bHsMBWH9urJdjtPuUUa2/bnEcriYTlCwdXVGsQyTihJLZ6b
 KTJsgvd/moQOfQNrIz8jloZmjC/XCr3i0xwPeKPE7Dwd9BO74sVs9SKXrNPQ33fKVHgYaaHHWZ
 jFTvmATyEwzvdXzgkky7GpGM
X-SBRS: 5.1
X-MesageID: 52606106
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5JKQAqs1gd3tMzVn384k2kR+O+fnVE9ZMUV32f8akzHdYApBsoF/q
 tZmKWCBM6mNNjOge9AiPIS09EIHucLVn4UyGgJs/i4zRC9G+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y52IPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7rfoSToDMPD3iukWdxdfHgheBL0aweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25oQRaiHP
 5RxhTxHTw7LRhpzJUwrFI9hpe2QmEnHQRdAkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZHcIJQLsc0tTqfx6Hw7QGUL0g9XmJ4PYlOWNANedA66
 rOYt4q3XmU16+DEFS31GqS89mzpaHNMRYMWTWpdF1JUvYO7yG0mpk+XFr5e/LiJYsoZ8N0a6
 wuDqjQ3z54XhNQCv0lQ1QGa22/wznQlowhc2+k2Yo5HxlgiDGJGT9bxgbQ+0RqnBNzFJmRtR
 FBex6CjABkmVPlhbhBhpdkw8EyBva7ZYFUwfmKD77F+rm/wqhZPjKh74S1kJVcBD/vojQTBO
 ReJ0SsIvcc7FCLzMcdfPtLgY+x3nPOIPYm0CZjpgi9mP8EZmPmvp3o1OyZ9HgnFzSARrE3IE
 c7LL5/zXCdFUP4PIfjfb7517ILHDxsWnAv7bZv60w6mwfyZYnuUQq0CK1yAcqYy66bsnekf2
 4wHXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:hk6j4aM3I61s28BcT1D155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDkqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPgf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0a2SwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7RvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WTAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 hT5fnnlbRrmG6hHjXkVjEF+q3pYp1zJGbJfqE6gL3X79AM90oJiHfxx6Qk7z49HdwGOt95D0
 mtCNUdqFh0dL5lUUtKPpZ2fSKGMB2/ffvyChPmHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.85,290,1624334400"; 
   d="scan'208";a="52606106"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN0qeSVCaMfclGnqeSPe62B/U0a3hnHDHDEw9qXPGYhRi3ZSfCrrr3GvchntzOeDZM0WEj/S9QgtyL0z4dbExJCpKcTc87NJfXzal1QhVsZbYgUfpEW+JjUAmQ4Za20JbdNlOjvPApO0zXoqP/fvEfS8Yv2EWPurk6C1enyiolJBusgYK8sVvWpoNeMsZuKIK8rjHxOAyoYIHinUUwcg/cBXZ5hLtU63+B0VWSf0YViMMvIOrZAlqZIFUmdG8SG1s8MvPUYEY08pSa8DkLxiSbcP7D3ifX8s/m3xPRpmvrs/tnpQw9yASC3ItipuaX+MoPLrbdMuVSN6iO7Su6d6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ctat5Gg+/Z8V4ZI07tGQbtU60i88SPRxZBQcf/3yWwc=;
 b=ePSBfGjS2v186w9FzqBXvMn00GojuI3+UQAVB+HxLJMwquwT7xl1bXa49U7JScyWxmsw0Cbkas/WdjKUPe7NBPRYcKBzVQ9j9EwW4SlEuAo42v6AET1KuHSeMpP4NKWbzE/vbkcM9Dwo7HCYz4keboPwc4zyhfZxqlnvlUaveeHTonQhsHiduWuWbPf+rU19LdCN5WTLsFlczTnXYohx0xrszndNInq68r/WoDwcpxHbi8s3vAV/aih856lm5cO0PIT1JNTcWokqA7zUTnfHTMZ7gj1ql3ehuqK6SXXeb7d3NaJ5/vbkT5Puov+x7+hxzwTCfk5x3Y9H1ozjIjf4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctat5Gg+/Z8V4ZI07tGQbtU60i88SPRxZBQcf/3yWwc=;
 b=fMYaS7a7DjXpPrwAJ+8RDhj66cnh7TI8R7rET8aYAZEChXIpu6R/gW2QACQxvw/oblQObHPedxOPf5OPT0Ggk4D938JrDyDHrMXI9L7gU2xarMAGuKP3e0o5vJzcsdqfHIEaorRYwC2wS9sqjqfznx4WrwCOhaV/z8T/fkMdx2Q=
Date: Mon, 13 Sep 2021 16:33:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
Message-ID: <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
 <7c97de87-9687-a088-406b-33faf037244a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c97de87-9687-a088-406b-33faf037244a@suse.com>
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb361a21-7792-4f49-7075-08d976c365cb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460380EEF52CF047BD5743F38FD99@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CP18AFlbRsNLySkaao+/l318D8oLnHetKyscl8+BbUye97VKvLX0GHO3CFkcK6XuFDf3EQiVLFZq+hZkdsbcEhpdzUw/l/G8l4xY0B8QuuIvWpY+jaDW2YExbd++QyNkHK1asd2I4SsKdisu14OUHoGyBVVA1zc9x3vKQQteXvILjuo/xsHCLSxq85vCPci8+8evi3+J9mR1lqe8wFxMkJCQoet4bEdtsqQ2jhlzx4dWamXI5PsNRs5WS2KimRV58Mb/qI+K7p14+BWhsObnq32H89Aoe9Pnnp32aFwS9FXqoffrYJyrjW7QT5X1AMraqEMf2au08iFIHPQiBvW19d+tmaN9RxvuDoXBjI9mmWdi5XWwzcgVCauAiK7OyUotAIxsfSkAAHdS1fhtPlPhNmIts1x9NKTMQMysaHGWfcYswPzSh4ZIqlyfVZLhfO3JQww2qEe8A+u9zwVNfOVwtZglMq/jQRzFFsIMLoAm2p30ph+h/f7N3YFUqF3yBS0znbvHPI9YFtViMsKWM/rfFt6GSxoPY2o4sXGvnVexb9+uJE1fiQlapbXgdD8Ycc7boH3778VDdVCUwDylyBNaamU1lhGFMcWX3QCf8SvtWCkX0f9D8ayxUrfNhrDNc6CxtgezTQC5Gp6GnKQKUJ+EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(6496006)(66946007)(86362001)(9686003)(38100700002)(5660300002)(2906002)(26005)(4326008)(8676002)(6666004)(83380400001)(956004)(54906003)(53546011)(8936002)(6486002)(508600001)(316002)(186003)(85182001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dsWFRhOTV6dFlGWGk5anhKVzRjVHRBVW9rbXV4OGhZekNtVzNvenNRNGhP?=
 =?utf-8?B?OC9tM3hZa2QvV0h5aFJuaHQzSnAyK044Z2ZWbWh1aERXUFd2aTlMYkZvYm5w?=
 =?utf-8?B?QVh4dGZVVjVnMkZhRHRUZFpJWVluME02ZVJSTzljMVBqdEN3OUR3TTF3TktT?=
 =?utf-8?B?eksySVFaelVZVWtpNGluTUdFanU1Ui9pckN5K0VyZ0dFelFKcTdOd2VMdlpW?=
 =?utf-8?B?ZTQ3R3dhOW9TSVdDWmd2d2IrNjhRV3pWZEk1MHVMc1R3Y3BYUGt5UnY1T3VR?=
 =?utf-8?B?S2Zray8xOEZxOFdDek1jVk9EUm5GeE1tVWFvYnhOYjBUSTlWdXo4cnc3U0xs?=
 =?utf-8?B?aUU4VkFrQ1dYMDNtZG9OcEs2VTB4YXQzY1dMUkdwaHZwdmpEeGpsUzh3clJ1?=
 =?utf-8?B?SzFOOWlyWEFZaVFhOHBEMDFuSHltVUpRczRxK25mdFk4R0VTUjV5VEM5SmpL?=
 =?utf-8?B?RnExZDlpdUpGU1Q0TDJOd3JQQ2tUQlNmK0RnbCtxNHl1V2tIdFQ2b3Z6dGMy?=
 =?utf-8?B?WllJYTZDVnJodEZNVEpPcmdsMTZPcjZTZjlKd3JmN3NVc0t2Mks2cFFac2No?=
 =?utf-8?B?emFZNmZsYUVUZWt3dkFFMzZrV0tuKzYyamVkVzJ1MHpmWU1WZ2RPY0NYVXJO?=
 =?utf-8?B?eEFMMklWVGR3N214NzRIRVltSlZEVm9vNnpBQ1lSQUFsMEFYdjFEUlA1Y1Vl?=
 =?utf-8?B?YmgrNXVodFNwVTcxTmFidWhOYXFpUFRYV3krS2hhK01COFJOU2c4NE9iNUc4?=
 =?utf-8?B?OTFLZEtpVHovKzljSFdtYlBwOGpLWWpQS1M0M3dUQ2UxN3JoV0JyMVdSYzNj?=
 =?utf-8?B?c0RGNGJzL05Zd2liRjhjUEFjQlpFajIxZjMxOHl4WGNwL3pmdFVVTXRFa2gx?=
 =?utf-8?B?TENheExEa1UyMVd1MDVsZzVubTBkN0g1YlVudVZSc1dML21WajdvNnhxSXRv?=
 =?utf-8?B?dEswbEs2SUVqR0FSa3dDNEloMEl1cjcxa0hWSWZtU3FCb3pEUDJraWFHRFVM?=
 =?utf-8?B?QzEvQ20wbEFkU3JMWlRtbGtXUk91Y2YzYzRZSFlJTWFhSitkK3hna29BMzdK?=
 =?utf-8?B?bDlFcitKTjlvUkU0cmRuRzFlNzUvN2EzZXE5bTFHNzU5b1N6QWt0bUhqMkJy?=
 =?utf-8?B?d0JQRW5BUnQxdm15K3ZwT2Y1L2ZDZUxGeFVkQ2MrdGxnV1MybC9FL0t4SlF5?=
 =?utf-8?B?d1VJcHk3bGYvaDRRdFN5RlNwRUszOWpwS3hDdy9OaXc5c094WDQxaGs4QW5i?=
 =?utf-8?B?K3lnVTRaZWFVemt3enphalo2RERSU1cxMldjUUNMN1pUUjN6cjN1ajlNWXBW?=
 =?utf-8?B?UHRtTnFvZ0hUazdSZ2FsVmEyZXE1b2NmeDc5QlV6T1ErQ1dVMGhtbnJmOUFp?=
 =?utf-8?B?U1NUYkJXT3pyQlBvaG03aUVHWFYvYnVoK28xVXo4THhlZFhEcFBvekxhZlVs?=
 =?utf-8?B?QzVrRG5KdHI3Rm9aVGJIc1cwL1BRdDRJSEJaVjl5YmZ3YmczODJ6YkNhM29M?=
 =?utf-8?B?cnR2cWFvc3BDUEJTOEtSZ21zam9GY2FIK0NyVWpLbDFtUm8xZ2tlZFVpcEZt?=
 =?utf-8?B?Z3JXaTdnZEN4MGlXaGhyUzZsZVZITTBMN3kwZHpvMU5xYk1BR09PK09Oalkz?=
 =?utf-8?B?M2pJdHBHYTRYaG96LysxTmprZUZtSStubmtuemhoMTBqODJ1ZEtPRnZrcGJC?=
 =?utf-8?B?SUg3U0dSMDkxdW5FNFBNOGdSSDRvNjZkbFNzY3ZKWjNZWkN0ZWp6R0tZd2tn?=
 =?utf-8?Q?U8kQ5AZLaqoGG3Fi2nZ+cYSnBMRAUnIVyKcl06H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb361a21-7792-4f49-7075-08d976c365cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 14:33:04.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvtP0UkMPoEJyA9Aw2QwGRQUZXTR/O7sMX4dT/YKU0ylghPAVBd8fGgol/xt875TkDGejpnJXdRjaiEKbUASNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Mon, Sep 13, 2021 at 04:05:15PM +0200, Jan Beulich wrote:
> On 13.09.2021 15:37, Roger Pau Monné wrote:
> > On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
> >> I haven't been able to find an environment where I could actually try
> >> with lld (ld.lld); all testing was with GNU ld (ld.bfd).
> > 
> > Thanks for fixing this. I've been able to test with LLVM ld and the
> > workaround is fine.
> 
> Oh, good, thanks for trying this out.
> 
> >> --- a/xen/arch/x86/Makefile
> >> +++ b/xen/arch/x86/Makefile
> >> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
> >>  
> >>  ifneq ($(build_id_linker),)
> >>  notes_phdrs = --notes
> >> +# Determine whether to engage a workaround for GNU ld 2.37.
> >> +build-id-ld-good = $(shell echo 'void test(void) {}' \
> >> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - 2>.check.err \
> >> +                           && $(LD) -T check.lds -o .check.elf .check.o 2>>.check.err \
> >> +                           && echo y)
> > 
> > Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
> > then use is here?
> > 
> > We already have compiler and assembler checks in x86/Kconfig, so it
> > would seem more natural to place it there.
> 
> The question of whether to record tool chain capabilities in .config
> is still pending. I'm not convinced this is a good idea, Andrew keeps
> shouting me out for that, and an actual discussion doesn't really
> happen. Yet unlike back at the time when I first raised my concern,
> Anthony meanwhile supports me in at least the question (to Andrew) of
> when such a discussion would have happened: Neither of us is aware,
> yet Andrew claims it did happen, but so far didn't point out where
> one could read about what was discussed and decided there.
> 
> For the few uses we've accumulated I gave (if at all) an ack for
> things happening under some sort of pressure, with the request that
> aformentioned discussion would happen subsequently (and, depending on
> outcome, these would be converted to another approach if need be). I
> have meanwhile realized that it was a mistake to allow such things in
> on this basis - the more of them we gain, the more I'm hearing "we've
> already got some".

I see, that's not an ideal situation from a review PoV, as we don't
have a clear placement for those and that will just cause confusion
(and more work since there are potentially two places to check).

What's the benefit of placing the checks in Kconfig instead of the
Makefiles?

As I understand Kconfig is run only once, while the Makefile could run
the check multiple times.

The downfall of having them in .config is that .config could suddenly
change as tools are updated or as it's moved around different systems
(yet .config already contains specific compiler version information).

> >>  else
> >>  ifeq ($(CONFIG_PVH_GUEST),y)
> >>  notes_phdrs = --notes
> >>  endif
> >> +build-id-ld-good := y
> >>  endif
> > 
> > I also wonder whether we need to make the quoting tied to the usage of
> > build-id. I guess we don't add sections with dashes and instead
> > use underscores, but it might be prudent to always quote to be on the
> > safe side if dashes are not supported.
> 
> If quoting was uniformly supported, I might have considered that. But
> it not being uniformly supported is the reason for this change in the
> first place. Hence I'd prefer to generalize this only if really needed.

OK, FE. As said I don't we would deliberately add sections with
slashes.

> >> --- /dev/null
> >> +++ b/xen/arch/x86/check.lds
> > 
> > I would maybe name this check-dash.lds, in case we need to add more ld
> > build tests.
> 
> I sincerely hope it was a one-off that a binutils release got cut with
> this sort of a supposedly prominent bug. Considering that the dash is
> merely what we're after in this specific case, but breakage was wider
> (presumably about any printable char that's not alnum or underscore),
> I'd consider check-dash too specific a name. You only say "maybe"; if
> you were sufficiently convinced, this is an adjustment I'd be willing
> to make. Yet even better would be if I / we could just be done with
> this.

Ack, we can always rename at a later point if there's a need to,
hopefully we are not being too optimistic.

Thanks, Roger.

