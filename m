Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD694112D6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190574.340431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGU4-0002pW-Bw; Mon, 20 Sep 2021 10:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190574.340431; Mon, 20 Sep 2021 10:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGU4-0002nN-8A; Mon, 20 Sep 2021 10:25:12 +0000
Received: by outflank-mailman (input) for mailman id 190574;
 Mon, 20 Sep 2021 10:25:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSGU1-0002Ba-Tc
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff975f15-19fc-11ec-b86b-12813bfff9fa;
 Mon, 20 Sep 2021 10:24:57 +0000 (UTC)
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
X-Inumbo-ID: ff975f15-19fc-11ec-b86b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632133497;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YLpdQ302sJlbyW1N6F4FWflrQ/BIaUleO+XxIMSS7cQ=;
  b=iP4K9D/yZ1v5C1ipoYD+rz9kU6P4b4l83zzN0JdMhkcX/3d9fuuUYp5V
   MIojY28TXOdHVmVl43FHQqZm6DULPEgljm3JIevKVUXNJXFs3lmPOrk6A
   ST4xEBS1YLm9BBX7Jw/6SN60MFB5Uo8QKYwDpL7Byj/lPtpfhTVT4uLe1
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TCGJyqO8gytrFeIpPRGs7im+weToOjOzYFqtEZjrWOCUlthe8ZegqGGKKxC8bkpv7DSibcETZx
 UT4iebUJf0zm6Jvv/EeanHyBoUxi/PNTLt5inSHX6rkZ1m+CwphFnpPNxBkdDIE6eCLpL2UQRd
 n++XLe2NficoawfseuZJfL0EXfo72k/vo0UMTrCAftW9JLGyb8VS/+iPGXt/SX7gT9KJaCJqwT
 4nqZX8rl8VgD0/ak9DdK0lxsW9hchg/JxeJ7SEPF8qN9rQp9RDWsizQ/CPUahrCug6wIl5vsxv
 es2WQ/vaJpM+yHKEqSYVGGDw
X-SBRS: 5.1
X-MesageID: 53102433
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ujfZ1amOH3mRRXh5ArhTUUPo5gwAIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDWuPO/uCMTD1eNgkYY/n/U5U6pSAx4RiSQI6pCxjESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 ItBr625TRUOB5XvtOJab0MHAR1AYKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQK2HP
 5BFMmEHgBLoUgQRNRAZJosFxuaXlHTVaRxThkvEqv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqtme3njS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 2QL/gI+oK5081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNAovcA5RDsu1
 3eSgsjkQzdotdW9S2+Z97qShSO/P24SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMW/82
 QGDqDoZvo0wochM6//k72z53j358/AlUTUJChXrsnONt10iPd7+Nt3wszA3/t4bc93IFQDpU
 Gws3pHEtbFQV8nleDmlHb1VdIxF8cppJ9E1bbRHJJAn6z3l0HqqZ4k4DNpWdRoxb5psldMEZ
 ibuVeJtCH17ZyDCgUxfOdvZ5yEWIU/IT4+NaxwsRoASCqWdjSfelM2UWaJ144wKuBN2+ZzTx
 L/BKZr8ZZrkIf0/kVJauNvxIZd0n3tjlAs/tLjQzgi90Kr2WZJmYe5eazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwPx7+Uo
 SniChEHoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ5pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:aodGc6jGj+yp7F2U26teC0MBkHBQXuAji2hC6mlwRA09TyX+rb
 HJoB17726StN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+Vzd8kPFh4tg/J
 YlX69iCMDhSXhW5PyKhDVQyuxQo+VvJprY59vj8w==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53102433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKZ6015f7lOjirwy8KMnLBtd1N3P4UG78gKgPE5JxyHRi4r1G2mw4uGdgU4bU7WG5cGyWWLly+oTMpywImENlKtUSaPqrCkHnak3bSn73En0uM0qnFFqpBTgOSrRdHBe+xIVZ2AxxhYXZx/jOGkG1miwxdJUu45mGFPejjrmgo82DOV/77NlANWCBGsUc6/dmaIONeOy2GtMC6CE3VabvA3fLBVzMHMh1o8Lu7LftGMK4uuloCjOo6XVOSCGY1YATT+8padLnA1+z3khUmp97bBnCRR2W8suHqvpLnAJ1YxHDFwwICKzfUMgk8bWfJz5o8Nam+a3iLJeBA8/dwI9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=52fKv83QhqJGhWASPxnT8whS4RezB2CT5RddIuOzg1A=;
 b=e3gbLLpDxLpG0JclEe2BTH22inzokOuSZ8w00nx2KxKBzdO1VKqe/zfrF/g881M5bjUnH8qUqWULtczASbsGlAlPeFzmddxYywZe0PfpqzifMtnzcUAO5627ajxeH+dGDwS0gHPOQBodMYfULCSWpOkdLP4OfSC2zKL+u1gWUuw+qca5VdIzksJsZk7sBagQrKqvkMH34mTFmHnus/S3Sr8CK9t5zndjtiwbQxOATrbyvaPIQTdvD6uXGQW8u6UrIHQ9G/KuynJipJLna2TKpUHo+LwvASW52MPCC8X2oE0OBDncl9CncdAKv1exEA/RAs3hRHLSK4fpE1RJHdz5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52fKv83QhqJGhWASPxnT8whS4RezB2CT5RddIuOzg1A=;
 b=QbAVcXKnWJjVTroa58AWR+SqFi8TbsDXUPkBaC8Sy4M82ONmmxjSDWbUx0Q9kSGRBlBdEhi3xM4bfZ0Di9njWp8CfBt0qjF5P3WLHEniHVtMmuWcHMFfObRGy+4gw1HoLeF3hxXqFGpXbkijPc+xO09pTCx3FSFNDRxHZPRjXDo=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-2-andrew.cooper3@citrix.com>
 <ed07d2de-9354-6c6d-b9f6-4b325ca328ce@suse.com>
 <0db4dc68-ccf0-0de6-61ce-7f155431a977@citrix.com>
 <8b2a548f-a955-302b-82ce-59c061537e27@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] xen/trace: Don't over-read trace objects
Message-ID: <b5c877ee-368e-efc1-da24-2e4ddc821e8b@citrix.com>
Date: Mon, 20 Sep 2021 11:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8b2a548f-a955-302b-82ce-59c061537e27@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d897989-7d72-464f-adb0-08d97c20e1f9
X-MS-TrafficTypeDiagnostic: BYAPR03MB3671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36717AA4882E39F833A4D2B4BAA09@BYAPR03MB3671.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62o3kKDIXhXI203EFl2UGznbuKGvrx8VSW7fkah5536TosGJjpaxKS6GXta2Qzp8kkRx1EQz5z8jRWzuiDRg5875VszGYHLUoZNOXIrw/zcENftZBm5CBB1VCYIPyvD6QCsd89DXWPo+aF8e7XqF3SG8OfZPTNeXUhmTxsPO2oI0/0og5GKStKCxCIrzQHQTbMkYeq+FJDw331cAP8MeoaWT9FsiF8GXIDG22s3NGaOvY+5ZvKwiGUNGrTwod7juFdHkpp+cHPu5ixu+h+CfAKkX+thb8N386vuDnrZWpkY0SkODT/wobb8r0bZ7MQ0UJ4H0cTtuubQ+mESJ4t7YfZWWwV8Ri/39STvP0dvgohUuzSPcfLLfvz/TaS/7Tx3MqxoDW/BEw+UTp7vT2t69SS77A/1P6e116wFPchiwIm9r2gM7Bfqt7UPX7STyMsmkQ+nFTvHoTjOD2qdh+f/t2ksabAjmYT1X8hrilH+b5O5VQRs/iSof/CGO9MuDHY8fKdDRPlh2WyqQB6srhxFZUnjS+hyd6Pa8o5tdvphrvFSjx301q/i56JBg3dklnQ8hfO5Bax3ho2AQgWlmuENdD6kFoqTPdZTE3bT9RTR+ETylMzzibhGD9wndHF28p0HNjYMmx7Q5r3Mmn7NFb+GZi4/zJ54prY+f7kJVJYUZg49aczVaLRPWKO2TGOiA+2C5UBNonLJ8EGTtYIIwZF2EWX0YFpNEdYkfpm4ibq3uBDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(956004)(186003)(508600001)(86362001)(31696002)(316002)(53546011)(83380400001)(5660300002)(38100700002)(54906003)(66946007)(26005)(6486002)(2616005)(16576012)(6916009)(55236004)(66556008)(4326008)(66476007)(36756003)(31686004)(8936002)(8676002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFAwS1dKVHRFUHBaeDVsbkx6TkJ1YncvRUdkQnZTNjRIdEs2L2prRmVyY0xC?=
 =?utf-8?B?L0lYZWs1ZjVkazc4Tzd5aTFPQkhyK3Z6VTdQZ3RKQkR0WXFvL25uMVJNSk95?=
 =?utf-8?B?eXNLbWxvblVDK3RZUVlRTVFtWkdnWHhTSGZORlJDWXRJa2FZSU5zTXhjem9W?=
 =?utf-8?B?Nk9ud1VOekxoODJCVkRqMEwrUXhnaUk3ZzhIdzRDQjljVDZhZ3dqalNOQzZu?=
 =?utf-8?B?amlpWVFFTjc5NTF4UTFiMGdXdU1YY00vVjZVZEtRZUlWUGl1aGZxVjZZR0Ji?=
 =?utf-8?B?Q3l0a2RRRWpLcXB0M3RPcXZHY0xzRzFVMjFzRnM1alJhT0xPNTRlMkhyeVp5?=
 =?utf-8?B?Vk1yektVbjJmK3dvZzVDL1dIc2FDVGo2b2t1Z3BIaldtd2FZekJuOEFnc2Ru?=
 =?utf-8?B?aHdCU3BVMFV4V1BKejJkREJ5S3h3aUFMbU9KUXErVVhlVmtWWEtiZWR4VWoy?=
 =?utf-8?B?cGE2TVpSc2VkWUZVbitHd0lSNkVpU2JJa3loQW9LYnZ2ZkJ6THlHUVdMY3Zp?=
 =?utf-8?B?NnY3Nm8rNkwwUzRCSkJjYng5OHJ5bG4rRGoxejdPS0pUOXBvdXViYVREb2pz?=
 =?utf-8?B?WkJidU52V1NSWTZKS3NGb3pVSGx3SUlRT0ZQQWFWTHBnSTR5QjlqaTcxUklp?=
 =?utf-8?B?Nkova1U4dm5abTIzdnh4VEJvRlZGck9yanNUTzZMUDh6S0YvOUFWSXg1U1pI?=
 =?utf-8?B?UkJxQXZhdXJXSy9oSm9zTkVyZTFHSk0wNStaaTJScnNac0ltVUtEbmVtcG1O?=
 =?utf-8?B?cWg0dHBhZStVWEIrUUpEbm1pRUEzYzJkTXFGWFg5TVp5YWNySGhiQ2U1MTFN?=
 =?utf-8?B?dXZOVDVTQ1FlNFFwREVRNW5DbVNZZ0orZFVEdE1BVENZWDhzRUdRQjdlUEJE?=
 =?utf-8?B?K1l6ZHdTTExRYUhXcDFEZmcxY0RrRG5oWjN5QjErNktOY0ZxcytBZk5YUmFv?=
 =?utf-8?B?MkNQWFVFaTNrdlVxaVFGNXpnOTVIZzhTMjJqanRUbUFETHNtNWY2dU5zVHoy?=
 =?utf-8?B?Vmxrdlh1UnR2cTAzVWJjdnZ5eVhOK2FRZyszdlo4UXplVG8zWTBaelZWcWMr?=
 =?utf-8?B?Zzl1SDlDSXdjNFl2OVcrY0Fkb0orMlY0WURSV2FQcEtabFJnblhWa2hocEtJ?=
 =?utf-8?B?b2JzMHkxZWdEM3owTGI5czU0dXN4eHlvWVNKK3oyb0xYSFZ6MDV6RktJa2Jt?=
 =?utf-8?B?cGFabDFadTQ5dmNpZ3VQT3dETXVUdjFXckNPRmtVcVNadlZPOFVqUUlJVlV6?=
 =?utf-8?B?WTRveGRnWjdaM1pWYTkzZDR2V3lBUE5PME1VSitlK3Bqd3NvazlnNnRqQU5W?=
 =?utf-8?B?b3dxaEZnMEFmYjZzbHo1aDdCNjZiWG92WHpDaVBlSlNIMEgvdHRrWFRuMDNy?=
 =?utf-8?B?WTJzUTUxaStaVUpPMmlpSzd3ekNjNVFFMC82b1RRN1pYSEQybmZjbzY4QTNa?=
 =?utf-8?B?ZU5oNnV6N1YyWEJCOHdzRGhEdXVrTC9ZaFZxWnBjNkRZQVUwTGI2bzNubXE0?=
 =?utf-8?B?cjdSQUtJYVY0aVZPa1JydWxjQ0dRM0N4OExRSVVqdFNETFNkenluVWNZSDc4?=
 =?utf-8?B?WDhaUFNvb29LV0xudEFuOGU1NUlTbUF2UWJyVndiQUFsb2s3b05kMmNOclZk?=
 =?utf-8?B?Mkg4YmcwL2ZYWHRMWWxSenA5b2F3UWNaUGhvdFdaMi93cHozQ2pqa3paL2Nk?=
 =?utf-8?B?YXA3VldYTmUrNDl6SDJvYndnT3pkZmVsRGQ4cGIxbFF4amV0ck5XZGRzSDRx?=
 =?utf-8?Q?5teGLnrJ21XNCeBySlayjTlF1jBZCKI9J8jjdLK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d897989-7d72-464f-adb0-08d97c20e1f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:24:52.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3rIPJLnM2G6pKhAhPi0naNQDU72uM4hW9kZbVv5bsIDgPSWKSBP6Ql/ZVNGsVi/p2dz3NWkeKmQFR+a0u0ZVGzd/ZfxLOF6PJ5gu4wpj/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3671
X-OriginatorOrg: citrix.com

On 20/09/2021 09:00, Jan Beulich wrote:
> On 17.09.2021 15:26, Andrew Cooper wrote:
>> On 17/09/2021 13:58, Jan Beulich wrote:
>>> On 17.09.2021 10:45, Andrew Cooper wrote:
>>>> --- a/xen/common/trace.c
>>>> +++ b/xen/common/trace.c
>>>> @@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsig=
ned int extra,
>>>>      unsigned long flags;
>>>>      u32 bytes_to_tail, bytes_to_wrap;
>>>>      unsigned int rec_size, total_size;
>>>> -    unsigned int extra_word;
>>>>      bool_t started_below_highwater;
>>>> =20
>>>>      if( !tb_init_done )
>>>>          return;
>>>> =20
>>>> -    /* Convert byte count into word count, rounding up */
>>>> -    extra_word =3D (extra / sizeof(u32));
>>>> -    if ( (extra % sizeof(u32)) !=3D 0 )
>>>> -        extra_word++;
>>>> -   =20
>>>> -    ASSERT(extra_word <=3D TRACE_EXTRA_MAX);
>>>> -    extra_word =3D min_t(int, extra_word, TRACE_EXTRA_MAX);
>>>> -
>>>> -    /* Round size up to nearest word */
>>>> -    extra =3D extra_word * sizeof(u32);
>>>> +    /*
>>>> +     * Trace records require extra data which is an exact multiple of
>>>> +     * uint32_t.  Reject out-of-spec records.  Any failure here is an=
 error in
>>>> +     * the caller.
>>>> +     */
>>> Hmm, is "require" accurate?
>> In terms of "what will go wrong if this condition is violated", yes.
>>
>>>  They may very well come without extra data
>>> afaics.
>> 0 is fine, and used by plenty of records, and also permitted by the
>> filtering logic.
> I was about to say that the two parts of your reply contradict one
> another, when I finally realized that it looks like the first sentence
> in the comment can be read two ways: "Trace records require extra data"
> then going on to describe properties, or "Trace records require extra
> data to be an exact multiple of uint32_t." Obviously this is to me as a
> non-native speaker. But maybe you could still reword this to be
> unambiguous? (I'm not going to exclude that the lack of a comma, which
> I did silently add while reading, makes a difference here: Does "Trace
> records require extra data, which is an exact multiple of uint32_t" end
> up altering the meaning?)

Yes.=C2=A0 The requirement is for "extra data which is an exact multiple of
uint32_t", not "extra data".

The comma massively changes the meaning.

I'll see about tweaking the wording.

~Andrew


