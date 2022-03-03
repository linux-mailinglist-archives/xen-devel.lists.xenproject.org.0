Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85A4CBB60
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282975.481844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiiD-0000gx-B3; Thu, 03 Mar 2022 10:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282975.481844; Thu, 03 Mar 2022 10:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiiD-0000dR-84; Thu, 03 Mar 2022 10:29:33 +0000
Received: by outflank-mailman (input) for mailman id 282975;
 Thu, 03 Mar 2022 10:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPiiA-0000dL-T0
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:29:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd683717-9adc-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:29:28 +0100 (CET)
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
X-Inumbo-ID: cd683717-9adc-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646303369;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ROQqiSTlb9OyluAuhgdY19GjFJI/EbkNuVhfA5yV2Pg=;
  b=Abs7pVA4FyUhzGzY+HmERldfP3RyyV04NPdUsyDTNMF4KO3s2+AT8ddt
   X6GtAtnIUtMpeiWX2Wi8tB5wueVEZEmWQID7MIf3VyBFNXttBgwro1FYX
   yHzfHkqACKXTccl3dTSHgFB+j873rbXmi9lxftpMfheeR9TE4f3sJT3Iy
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65375535
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7CfdOK4TvtSyYm0wwLQZdgxRtCXHchMFZxGqfqrLsTDasY5as4F+v
 mRLDW2AP62LN2L1L4snPdvk8E4BuMLUnNcwHVNvrCk3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSQRjlwO4bDnd9EQkd0CgFxbYle+bjudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5REMmUyMU+dC/FJElcqMZ5ine2mvyHyLyV1hWjNopoZ8lGGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSyA6zk6//7AOiX3laYidhZ4wCrM4xbGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEtoji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpaI2O3P
 B6I5l4IjHO2AJdMRfUtC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVLfABScCNiXsieRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:Ok0Mq6pH1qhMmqOl886TCncaV5uFL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhcotKLzOWxFdAS7sSo7cKogeQVxEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjHzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2XqbRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX242oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAjv0idprD
 D/mWZlAy1B0QKXQohzm2qq5+DU6kdq15Yl8y7AvZKsm72geNtwMbs/uWsQSGqm16NnhqAn7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklW6voMRiKobzPKt
 MeRP00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQF++oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65375535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ1zrheGl2/cyhgHcRAXrNxXJ9DmpZbOf9LDkMfoY7lZdod4Lz45YG+WFSV3YbGo17SNbXgy5ie6CS+Dpqd4qh7vaMQps/1D9KeHiwAf1sjSRenQSFkEpaduYgd6TsovVYD0dJHRdgS1uA1ueMD4/6hC6WEDaTA+sHutuXVUm9XE5VQTi3qH19YtggSeeR7uheA5/OwiUW/JXRtXk/HLuh/iArSkG+cFKv0fdF+ngo5cC+FyKH0K8isHcH7t8eCZlyJhM+T8hD7q7Mxhj/TD5U7l6nY0qC8UsrqUVnq44RfQKGgqUZaWQsWhTJQcER/evgqJsDxhjaGerGhBwse9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROQqiSTlb9OyluAuhgdY19GjFJI/EbkNuVhfA5yV2Pg=;
 b=aXLOu1nkdJZ8HwAVXC0Th3DvvgSG0n847SF2sFzeCE5R6SzkZMUFT9zh9Ytb4q0Bp/rQnydiomS9PNP7FDWX3TY+Bvi5q8NjAijbMNj+TA3VB0vOz+yW9lLgSGUlEFcj1ZylD66aNw6aLazOT7nnQU0H1O4Wg+794Q7wK7PpEY/NXD6aY9Z6kQtNdj6M+7rwiViHKtSvwVBRhGpldI1TN2bmWepB3QT2BTBRvK2A/4Uhjg9KyTZ47tTHH9otBgpridA8skMJus9yH0tL6dY5BJXfuc68+yCFP/yGaet5XWhwF4wBw9hJywv3dI1Gzpl9rlD0FiSdgGhUJu/MTLM5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROQqiSTlb9OyluAuhgdY19GjFJI/EbkNuVhfA5yV2Pg=;
 b=ZVbyAqVcgZfF6+0XTa4EhnPh/C0EXb2gIbQCKURsdI/XdB5ebOulxKszY7lUyQrFPstfByRjcswthnqr5lA41zO+oMnAtakiDOGHScbHevXpny5fzfzSnPLTxkJ1fUE4WGoUv4LEvI7cNDWXF30YaQQNKjGKMmm6J8T1mUIZCmU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/CET: Fix __initconst_cf_clobber
Thread-Topic: [PATCH] xen/CET: Fix __initconst_cf_clobber
Thread-Index: AQHYLoJgAXApmKaYwEKz6VCRfhdKvKytRW4AgAAwoAA=
Date: Thu, 3 Mar 2022 10:29:18 +0000
Message-ID: <36e72452-1ae2-93b3-c5ba-88707dfe47a5@citrix.com>
References: <20220302221005.16636-1-andrew.cooper3@citrix.com>
 <8eb7d30e-32de-fdee-43c9-3500fb10e6ee@suse.com>
In-Reply-To: <8eb7d30e-32de-fdee-43c9-3500fb10e6ee@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d9f39a5-3230-4e6b-635f-08d9fd00ac87
x-ms-traffictypediagnostic: PH0PR03MB6315:EE_
x-microsoft-antispam-prvs: <PH0PR03MB631533C7B0C678012E5D03BFBA049@PH0PR03MB6315.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUbHosXmSYLYzSrKylID0jB3pprN6bYSAxLdenVGG3dhgwdGCqt5BZthL6zVQSAMwYEtX8W7VRAtR9GPCd34Ne9yWpNxvp/xDiZKx2cJeWrvs9ZPGYfxCgDx0oHQb22iijld2C9mX4NAdeUZVhQ8WtBdY5s7UUCsn0D+i0Ar34GdOvgGLohbyuWZNwv3PdFL59WkhicXPGf66EP9GWOPZr9kGupLn+Uo5DdmM3aDIaa0NXzBledXlrl7b0OJY128Yn1QOc3KJ77LlGSbfCoSo0VfIWpeBDnRhW90e3pN8uRryEz94pySNgIO5ocIYWZK6H0TD3kNklg2dk4HdIbx7B78kKLWPIAukQde2r52Tlq6VXt5KhzSz7oYhQQkrosnbcWMg2OKlbi9BZg7NU0Fhs13ECYd+gNlRzBmBMOR2JaGupaj7P2BNz3GD9os3zuHp2LVG8g9i5G/w0okJTPNTuPCUpHjrxdzzxmkGnSCYynMjjI6/0r3Fm3DHgi4IHEs6X413NJv3fPuOJ862wjnJv/02grWVmo+7/NFcSD/xSjGzaXnsZQQsx6fqH2vBxs3vHKBhVGai0YcO6f0V5i5hxNrjKC529EMqE6Uru1Gtpy5P5GEzdwuXaK6CWYfBxCCPdjKnZdBOr2Newfvvc8bwEYPK++sirx+WZxdK94PqajRlsVx0ASig/ZMp6b5v+nTYm925SJeK2Hv34gAv3/sxh/P80z3FbdzJ81aPpWrQFF4mHKA6Jt79/zgs9+xyR7pRxuhFiLU6jHE0fVq4iw07g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(86362001)(6916009)(31696002)(54906003)(316002)(38070700005)(71200400001)(6506007)(6486002)(6512007)(508600001)(2616005)(45080400002)(8936002)(5660300002)(2906002)(66556008)(91956017)(66446008)(26005)(64756008)(66946007)(76116006)(66476007)(38100700002)(186003)(31686004)(36756003)(122000001)(82960400001)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0hqM253bTlFUmhVZ2dZeldNR01SY09nTTJyZTRJVEhzQWh3Z2RRU2luWHJH?=
 =?utf-8?B?bSt2dXBLeElURVRZZ25hYklyZW0wMjlNVFo3RjJSQ0RaZXZXN1djZWUyTUk4?=
 =?utf-8?B?VXplUytWcG96eTRJVXg5eXNCRkUrTGJHL0JXcXA5WStwMnI5S3hXbEdwYkEy?=
 =?utf-8?B?NUp4QTlXV1VVcDE2ZUl0bllkMldqZXQ0WXRZWlNCRnBKelIyVk93Q3BZNzl6?=
 =?utf-8?B?Uks4eGtwMFM2ZWIyQWUxVGN1RWhkaC8rL2hncWFyZnNBU3RNN2hDR2E2ZWla?=
 =?utf-8?B?RXFDeFVQZm9CMVZoTFZDRjBhQ0w1RzdWcnI2NW45R0lmbWs3NnkxdElDazJV?=
 =?utf-8?B?S0NveFZDZmhVcysyeFk2RWFrcGl3aE5QN29EWXA0cnhsTzdib25pb09XenFu?=
 =?utf-8?B?R1NXL21LUHFMTVFXbUtGYm4vakhTSFJDcTlHSW5QNzZCbDB5ZzFKQ0NreHM3?=
 =?utf-8?B?S2dlYzZROHFzcFBHWjFDTi93c0dtWWw3VFREZDNjZUZjNElRcjNDMHZpRy9W?=
 =?utf-8?B?dFdZNHlOczNXTk9tM2VqRGVYd3JjK0Y5dkVWWDUwTXhBdjR4MC9aZDlaVjB0?=
 =?utf-8?B?RUlBaXcyUndpREpNWXlidEFkcml0TitpUnZIUWxLbDNYT3FGUmR4VWlZSEx5?=
 =?utf-8?B?Z2paMDh4T1NzTlpnMzBqaVM1YzZxUnludTFGMDIwKy8xWS9NUDlhNlZHOEhG?=
 =?utf-8?B?TDJPdFl6Um9yNzdrRVh2bWluMGxEU0JJVXZxek9lREVVaWtWdFJsdjdaMzdW?=
 =?utf-8?B?aG1vZEV2bHkvS1lmeUtubWZkNjU1K09IWjg4b3V1eFNTL29lTnloMSsvZjNL?=
 =?utf-8?B?WGl5SDRIZmVrRUlSb2V2K2VsNmpqNldVUS9NQ3Fob2hPNHpIL1luWjcreVpy?=
 =?utf-8?B?WXpzRU5ySGw0NHd3TFlPZHVmVDR3OWIveFA2dEhMSWNyQ0trRzlQc2tKSmVQ?=
 =?utf-8?B?c0NIUjNvRkQrbzVEL1FSaHUwOENGNjRuRHFvOTZsNzhuRmQySmRHSm5DRHdo?=
 =?utf-8?B?aDhibHp6TUl0dFQxbTloQyszSXg0cUlqSmZLT0dwTmwyWk9XbEE0cWg1K1cv?=
 =?utf-8?B?M1lkRjlLdVVyUGFGRVhVRUZpeUd2NTVvWUVidzh2UFA4NFBzVUF4L24wa0xO?=
 =?utf-8?B?MHkvUXgwYUNpdndWOHEwTFNUZXpISk5GL2ttSDYvZU9WbHorWkNlVzFMVGM5?=
 =?utf-8?B?WVZKMHZKTHlpVE94U1czMnBDWU5KZHdpUnhQbjk5MUtpTXBLV09qbFBNTnNJ?=
 =?utf-8?B?ZURWNndRVVh4U0FMaWxIMnlnRVZjR0t5UnRPeFlBWlQxRE9HaEV2ZURHdWJY?=
 =?utf-8?B?cHhRZTBBdUVLSzE0Z0dLd2J5QWNYaDcrb2N6MHNSelNDaFVOMmdFLzFHRTAz?=
 =?utf-8?B?bFFZTEpUUmdVVE8vNjEySmtCK2tqdW1CcjhiODhIK2VqaHdsL2xIdnVFTDZl?=
 =?utf-8?B?K2V5dDI2bGVIM1BuV2pHcGtNSnlaWXR2MEY0SFNGbmlqK0pDWkNxaHVMZlZZ?=
 =?utf-8?B?S0NXeS96QTNmNGc1SkVJa08xU0VqS09ZMVVCVmpxdTdHYXNYTmlGbmxLdGhF?=
 =?utf-8?B?NU1RQ3RSTFN0WmMvZHVFYWt4R3BubndOUjdOV3kzWnl3TUp6ckdPZlhsU05M?=
 =?utf-8?B?bEptaHZyTVZWa0MxMkhnVDA1TkpVcnBiWVVldSs5SlpxNTdxa3NsYkJtOXNu?=
 =?utf-8?B?S2pkcDU1VnlneE5UTTJ0dDBDQmJESHN6ZzNaL3ZGeWFGaEUrMzBmVjJ3RlJB?=
 =?utf-8?B?cU5CVUJhMWlaNGttSFBZcDQyR0NvWGlSMW9XMDFOS1RFVThvTE9zT3EyTi83?=
 =?utf-8?B?bVhsckU4TS9Rcm9uZGRYUENBRjBDc3haWEZSajlobVlZYTBZSUthUTBmY3Yv?=
 =?utf-8?B?ZDc2YlJxMzRmUmJzK1NwUkUzRkFWb1hCN3YrQTRmRzgydTVwYi9QcDY3WWlT?=
 =?utf-8?B?RDJRYUtrRXBEbFNTU2NGY2wwblBBNDJEWjNHb0d1RFNIam9HdFhXTmtrZU1v?=
 =?utf-8?B?aGhOSzdkUXFNY3BOV2d0dGhvYjhkeG02L2lHT1BBeUtzTGw5T2h6SmZ2UUhC?=
 =?utf-8?B?RDhXRFlHUXJ3Qi93eHpvWFMzb3YvVTRLZGdWZGdwWFBPRlFOeHhJQy91L1Jk?=
 =?utf-8?B?QXYvNE9MVVd5eWRDSEpzMzZsUE1qK2twc0Nsc21BSXhVWURlOVI0cE9DSSta?=
 =?utf-8?B?eTFYWUtYZENOSmUzVXF6Q0ZycENuamtiNjBjMGFob3REL3poUGZwZW1LcmVB?=
 =?utf-8?B?dGFSakFuRnhKUitMV3pHUmxKeHlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D9516F74857024E808A87FB5021D26B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9f39a5-3230-4e6b-635f-08d9fd00ac87
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 10:29:18.4923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13G6Vu/X/fTgbA7J21XZiRDGYG2g7hH3BJZZm6eKFNspKo5nfJZ10z1fx7lhW6R1C6PEjy5rl7mVdiY9JTi6iOGJHG2G+vuOjswbD55ak/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6315
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAwNzozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjAzLjIwMjIg
MjM6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGUgbGlua2VyIHNjcmlwdCBjb2xsZWN0
aW5nIC5pbml0LnJvZGF0YS4qIGFoZWFkIG9mIC5pbml0LnJvZGF0YS5jZl9jbG9iYmVyDQo+PiBh
Y2NpZGVudGFsbHkgY2F1c2VzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgdG8gYmUgYSBuby1vcC4N
Cj4+DQo+PiBSZWFycmFuZ2UgdGhlIGxpbmtlciBzY3JpcHQgdG8gdW5icmVhayB0aGlzLg0KPj4N
Cj4+IFRoZSBJT01NVSBhZGp1c3RfaXJxX2FmZmluaXRpZXMoKSBob29rcyBjdXJyZW50bHkgdmlv
bGF0ZSB0aGUgc2FmZXR5DQo+PiByZXF1aXJlbWVudCBmb3IgYmVpbmcgY2ZfY2xvYmJlciwgYnkg
YWxzbyBiZWluZyBfX2luaXRjYWxsKCkuDQo+Pg0KPj4gQ29uc29saWRhdGUgdG8gYSBzaW5nbGUg
aW5pdGNhbGwgdXNpbmcgaW9tbXVfY2FsbCgpIChzYXRpc2Z5aW5nIHRoZSBjZl9jbG9iYmVyDQo+
PiBzYWZldHkgcmVxdWlyZW1lbnQpLCBhbmQgYWxzbyByZW1vdmVzIHRoZSBkdWJpb3VzIHByb3Bl
cnR5IHRoYXQgd2UnZCBjYWxsIGludG8NCj4+IGJvdGggdmVuZG9ycyBJT01NVSBkcml2ZXJzIG9u
IGJvb3QsIHJlbHlpbmcgb24gdGhlIGZvcl9lYWNoXyooKSBsb29wcyB0byBiZQ0KPj4gZW1wdHkg
Zm9yIHNhZmV0eS4NCj4+DQo+PiBXaXRoIHRoaXMgZml4ZWQsIGFuIGFsbC1lbmFibGVkIGJ1aWxk
IG9mIFhlbiBoYXMgMTY4MSBlbmRicjY0J3MgKDE5MTgNCj4+IGluY2x1ZGluZyAuaW5pdC50ZXh0
KSB3aXRoIDM4MiAoMjMlKSBiZWluZyBjbG9iYmVyZWQgZHVyaW5nIGJvb3QuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
VGhpcyB3aWxsIGRvIGZvciB0aGUgaW1tZWRpYXRlIHB1cnBvc2UsIHNvOg0KPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMN
Cj4+IEBAIC0yMTAsNiArMjEwLDEyIEBAIFNFQ1RJT05TDQo+PiAgICBERUNMX1NFQ1RJT04oLmlu
aXQuZGF0YSkgew0KPj4gICNlbmRpZg0KPj4gIA0KPj4gKyAgICAgICAuID0gQUxJR04oUE9JTlRF
Ul9BTElHTik7DQo+PiArICAgICAgIF9faW5pdGRhdGFfY2ZfY2xvYmJlcl9zdGFydCA9IC47DQo+
PiArICAgICAgICooLmluaXQuZGF0YS5jZl9jbG9iYmVyKQ0KPj4gKyAgICAgICAqKC5pbml0LnJv
ZGF0YS5jZl9jbG9iYmVyKQ0KPj4gKyAgICAgICBfX2luaXRkYXRhX2NmX2Nsb2JiZXJfZW5kID0g
LjsNCj4+ICsNCj4+ICAgICAgICAgKiguaW5pdC5yb2RhdGEpDQo+PiAgICAgICAgICooLmluaXQu
cm9kYXRhLiopDQo+IEkgd29uZGVyIGlmIHRoaXMgc2hvdWxkbid0IHJlYWxseSBiZSB0d28gc2Vj
dGlvbnMuIExpdmUtcGF0Y2hpbmcgd2lsbA0KPiBuZWVkIHRvIHN1cHBseSB0d28gcmFuZ2VzIHRv
IGFwcGx5X2FsdGVybmF0aXZlcygpIGFueXdheSAob25lIGZvciBlYWNoDQo+IHNlY3Rpb24sIHVu
bGVzcyB5b3Ugd2FudCB0byBzdGFydCByZXF1aXJpbmcgdG8gcGFzcyBhIGxpbmtlciBzY3JpcHQg
dG8NCj4gIiQoTEQpIC1yIiB3aGVuIGdlbmVyYXRpbmcgbGl2ZSBwYXRjaGVzLCBqdXN0IHRvIGZv
bGQgdGhlIHR3byBzZWN0aW9ucyksDQo+IHNvIGluIHRoZSBjb3JlIGh5cGVydmlzb3Igd2UgbWF5
IHdhbnQgdG8gZm9sbG93IHN1aXQuDQoNCkkgZG9uJ3Qgc2VlIHdoeSBsaXZlcGF0Y2hlcyB3b3Vs
ZCBuZWVkIHR3byBzZWN0aW9ucyAtIHRoZXkncmUgbGlua2VkIGluDQphIHNpbWlsYXIgd2F5IHRv
IFhlbiBJSVJDLsKgIEVpdGhlciB3YXksIGlmIGNoYW5nZXMgYXJlIG5lZWRlZCwgdGhleQ0Kc2hv
dWxkIGJlIHBhcnQgb2YgdGhlIGxpdmVwYXRjaCB3b3JrLg0KDQo+PiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gveDg2L2lvbW11LmMNCj4+IEBAIC00NjIsNiArNDYyLDEyIEBAIGJvb2wgYXJjaF9pb21tdV91
c2VfcGVybWl0dGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAgICAgICAgICAgbGlr
ZWx5KCFwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkpOw0KPj4gIH0NCj4+ICAN
Cj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIF9faW5pdCBhZGp1c3RfaXJxX2FmZmluaXRpZXModm9p
ZCkNCj4+ICt7DQo+PiArICAgIHJldHVybiBpb21tdV9jYWxsKCZpb21tdV9vcHMsIGFkanVzdF9p
cnFfYWZmaW5pdGllcyk7DQo+PiArfQ0KPj4gK19faW5pdGNhbGwoYWRqdXN0X2lycV9hZmZpbml0
aWVzKTsNCj4gSSBhc3N1bWUgaXQgaXMgaW50ZW50aW9uYWwgdGhhdCB5b3UgZGlkbid0IHJlLXVz
ZSB0aGUgaW5saW5lIHdyYXBwZXIsDQo+IHRvIGF2b2lkIGl0cyAodGhlbiBub24tX19pbml0KSBp
bnN0YW50aWF0aW9uIHRvIHN0YXkgd2l0aCBhbiBFTkRCUi4NCj4gWWV0IHRoZW4geW91IGNvdWxk
IGF0IGxlYXN0IF9jYWxsXyB0aGF0IHdyYXBwZXIgaGVyZSwgaW5zdGVhZCBvZiBvcGVuLQ0KPiBj
b2RpbmcgaXQuDQoNCk5vIC0gdGhhdCB3YXMgdW5pbnRlbnRpb25hbC7CoCBJIG9ubHkgbWVyZ2Vk
IHRoZSBpbml0Y2FsbHMgbGF0ZSBkdXJpbmcNCmRldmVsb3BtZW50IGFuZCBmb3Jnb3QgdGhlIHdy
YXBwZXIuDQoNCkkndmUgYWRqdXN0ZWQgdG86DQoNCi3CoMKgwqAgcmV0dXJuIGlvbW11X2NhbGwo
JmlvbW11X29wcywgYWRqdXN0X2lycV9hZmZpbml0aWVzKTsNCivCoMKgwqAgcmV0dXJuIGlvbW11
X2FkanVzdF9pcnFfYWZmaW5pdGllcygpOw0KDQoNCj4gQW5kIEkgZnVydGhlciB0aGluayB0aGUg
aW9tbXVfZW5hYmxlZCBjaGVja3Mgc2hvdWxkIG1vdmUgb3V0DQo+IG9mIHRoZSB2ZW5kb3IgZnVu
Y3Rpb25zLCBwbHVzIHRoZSBob29rIGFsc28gaGFzIG5vIG5lZWQgYW55bW9yZSB0byBoYXZlDQo+
IGEgcmV0dXJuIHR5cGUgb2YgaW50LiBJIGd1ZXNzIEknbGwgbWFrZSBhIGZvbGxvdy1vbiBwYXRj
aCBpZiB5b3UgZG9uJ3QNCj4gd2FudCB0byBmb2xkIHRoaXMgaW4gaGVyZS4NCg0KWWVhaCwgSSdk
IHByZWZlciBub3QgdG8gZm9sZCBjbGVhbnVwIGludG8gdGhpcyBidWdmaXgsIGJ1dCB0aGVyZSBh
cmUNCmNlcnRhaW5seSBpbXByb3ZlbWVudHMgdG8gYmUgZG9uZS4NCg0KfkFuZHJldw0K

